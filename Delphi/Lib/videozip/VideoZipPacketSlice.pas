{*
  ��Ŷ�� �ڸ��� ��ġ�� ��ƾ�� �����Ѵ�.
  UDP ����� ���ؼ� ū ��Ŷ�� �߶� Ȱ���ϱ� ���ؼ� �������.
  ��Ŷ ������ �� �ٲ���� ���������, ��Ŷ�� ���߿� ������ ����� ���������� �ʴ´�.
}
unit VideoZipPacketSlice;

interface

uses
  DebugTools,
  Classes, SysUtils;

const
  SLICE_SIZE = 512;  /// UDP ������ ���ؼ� ��Ŷ�� ũ�⸦ �����Ѵ�.
  RING_SIZE = 32;    /// ��Ŷ�� Seq ��ȣ�� �������� �з��ؼ� �����ۿ� ��� ���´�.  �ش� �������� ũ��.

type
  TPacketHeader = packed record
    Seq : Cardinal;
    Index : byte;
    Size : integer;
  end;

  TPacket = packed record
    Header : TPacketHeader;
    Data : packed array [0..1408] of byte;
  end;
  PPacket = ^TPacket;

  TPacketSlice = class
  private
    FSeq: integer;
    FSize : integer;  /// ������� ����� ũ��
    FIsPerfect : boolean;
    FList : array [0..255] of TPacket;
  public
    constructor Create;

    procedure Add(AData:pointer; ASize:integer);
    function Get(var AData:pointer; var ASize:integer):boolean;
  public
    property Seq : integer read FSeq;
  end;

  TRingOfPacketSlice = class
  private
    FIndex : integer;
    FList : array [0..RING_SIZE-1] of TPacketSlice;
    function find_Seq(ASeq:integer):integer;
    function add_Seq(ASeq:integer):TPacketSlice;
  public
    constructor Create;
    destructor Destroy; override;

    function Get(AData:pointer; ASize:integer):TPacketSlice;
  end;

  TPacketSliceMerge = class
  private
    FRingOfPacketSlice : TRingOfPacketSlice;
  public
    constructor Create;
    destructor Destroy; override;

    function GetPacketSlice(AData:pointer; ASize:integer):TPacketSlice;
  end;

implementation

{ TPacketSlice }

procedure TPacketSlice.Add(AData: pointer; ASize: integer);
var
  pPacket : ^TPacket absolute AData;
begin
  Move(AData^, FList[pPacket^.Header.Index], ASize);
  FSize := FSize + ASize - SizeOf(TPacketHeader);

  FIsPerfect := FSize = pPacket^.Header.Size;

  {$IFDEF DEBUG}
//  Trace( Format('pPacket^.Header.Index: %d, pPacket^.Header.Size: %d, ASize: %d, FSize: %d', [Packet^.Header.Index, Packet^.Header.Size, ASize, FSize]) );
//  if FIsPerfect then Trace( 'TPacketSlice.Add - FIsPerfect = true' );
  {$ENDIF}
end;

constructor TPacketSlice.Create;
begin
  inherited;

  FSeq := 0;
  FSize := 0;
  FIsPerfect := false;

  FillChar(FList, SizeOf(FList), 0);
end;

function TPacketSlice.Get(var AData: pointer; var ASize: integer): boolean;
var
  Loop: Integer;
  pDst : PByte;
  BytesToSend : integer;
begin
  AData := nil;
  ASize := 0;

  Result := FIsPerfect;
  if not Result then Exit;

  // SLICE_SIZE�� ���ؼ� ������ �迭 ���ҿ� �󸶳� �����͸� ������ �� �� �Ű� ���� �ʾƵ� �ȴ�.
  GetMem(AData, FSize + SLICE_SIZE);
  ASize := FSize;

  pDst := AData;
  BytesToSend := ASize;

  for Loop := Low(FList) to High(FList) do begin
    if BytesToSend <= 0 then Exit;

    Move(FList[Loop].Data, pDst^, SLICE_SIZE);

    Inc(pDst, SLICE_SIZE);
    BytesToSend := BytesToSend - SLICE_SIZE;
  end;

  FreeMem(AData);
  AData := nil;

  ASize := 0;

  Result := false;
end;

{ TRingOfPacketSlice }

function TRingOfPacketSlice.add_Seq(ASeq: integer): TPacketSlice;
begin
  Result := TPacketSlice.Create;
  Result.FSeq := ASeq;

  FIndex := (FIndex + 1) mod RING_SIZE;

  if FList[FIndex] <> nil then FList[FIndex].Free;

  FList[FIndex] := Result;
end;

constructor TRingOfPacketSlice.Create;
begin
  inherited;

  FIndex := 0;
  FillChar(FList, SizeOf(FList), 0);
end;

destructor TRingOfPacketSlice.Destroy;
var
  Loop: Integer;
begin
  for Loop := Low(FList) to High(FList) do
    if FList[Loop] <> nil then begin
      FList[Loop].Free;
      FList[Loop] := nil
    end;

  inherited;
end;

function TRingOfPacketSlice.find_Seq(ASeq: integer): integer;
var
  Loop, index : integer;
begin
  Result := -1;

  index := FIndex;
  for Loop := Low(FList) to High(FList) do begin
    if (FList[index] <> nil) and (FList[index].Seq = ASeq) then begin
      Result := index;
      Exit;
    end;

   index := (index + 1) mod RING_SIZE;
  end;
end;

function TRingOfPacketSlice.Get(AData: pointer;
  ASize: integer): TPacketSlice;
var
  index : integer;
  pPacket : ^TPacket absolute AData;
begin
  index := find_Seq(pPacket^.Header.Seq);

  if index = -1 then Result := add_Seq(pPacket^.Header.Seq)
  else Result := FList[index];
end;

{ TPacketSliceMerge }

constructor TPacketSliceMerge.Create;
begin
  inherited;

  FRingOfPacketSlice := TRingOfPacketSlice.Create;
end;

destructor TPacketSliceMerge.Destroy;
begin
  FreeAndNil(FRingOfPacketSlice);

  inherited;
end;

function TPacketSliceMerge.GetPacketSlice(AData: pointer; ASize: integer): TPacketSlice;
begin
  Result := FRingOfPacketSlice.Get(AData, ASize);
  Result.Add(AData, ASize);
end;

end.
