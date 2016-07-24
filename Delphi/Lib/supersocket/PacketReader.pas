unit PacketReader;

interface

uses
  DebugTools,
  RyuLibBase,
  SuperSocketUtils, MemoryBuffer,
  Windows, Classes, SysUtils, SyncObjs;

type
  {*
    TCP 패킷이 조각이 나거나 합쳐져서 들어오는 것을 패킷 단위로 분리하기 위한 클래스이다.
  }
  TPacketReader = class
  private
    FCS : TCriticalSection;
    FBuffer : TMemoryBuffer;
    FNewBuffer : TMemoryBuffer;
    FList : TList;
    function can_AddData:boolean;
    procedure do_AddData;
    procedure pack_Buffer;
  private
    function GetCurrentPacketSize: integer;
  public
    constructor Create;
    destructor Destroy; override;

    /// 내부 버퍼에 있는 모든 패킷을 삭제한다.
    procedure Clear;

    /// 소켓에서 수신 받은 패킷을 저장한다.
    procedure AddData(AData:pointer; ASize:integer);

    {*
      완성 된 패킷이 있으면 리턴한다.  리턴 된 패킷은 내부 버퍼에서 삭제된다.
      @param ACustomData 패킷마다 4바이트로 된 더미가 있다.  개인적으로 사용하는 영역이다.
      @param AData 해더를 포함한 패킷이다.
             [Packet] = [Header] [Data]
             [Header] = [CustomData: DWord] [Data Size: Word]
      @param ASize 해더를 포함한 패킷의 크기이다.
      @return boolean 완성 된 패킷이 리턴되었는 지 여부.
    }
    function GetPacket(var ACustomData:DWord; var AData:pointer; var ASize:integer):boolean;

    /// 가장 오래 된 패킷의 크기를 리턴한다.  패킷은 내부 버퍼에서 변화가 없다.
    property CurrentPacketSize : integer read GetCurrentPacketSize;
  end;

implementation

{ TPacketReader }

function TPacketReader.can_AddData: boolean;
var
  pHeader : PSuperSocketPacketHeader;
begin
  Result := false;

  if FBuffer.Size < SizeOf(TSuperSocketPacketHeader) then Exit;

  pHeader := FBuffer.Memory;

  Result := FBuffer.Size >= (SizeOf(TSuperSocketPacketHeader) + pHeader^.Size);
end;

procedure TPacketReader.do_AddData;
var
  pHeader : PSuperSocketPacketHeader;
begin
  pHeader := FBuffer.Memory;

  FList.Add( TMemory.Create(pHeader, SizeOf(TSuperSocketPacketHeader) + pHeader^.Size) );
end;

procedure TPacketReader.pack_Buffer;
var
  Temp : TMemoryBuffer;
  pSrc : PByte;
  pHeader : PSuperSocketPacketHeader;
begin
  pHeader := FBuffer.Memory;

  FNewBuffer.Clear;

  if FBuffer.Size > (SizeOf(TSuperSocketPacketHeader) + pHeader^.Size) then begin
    pSrc := FBuffer.Memory;
    Inc(pSrc, SizeOf(TSuperSocketPacketHeader) + pHeader^.Size);

    FNewBuffer.Write( pSrc,  FBuffer.Size - (SizeOf(TSuperSocketPacketHeader) + pHeader^.Size) );
  end;

  Temp := FBuffer;
  FBuffer := FNewBuffer;
  FNewBuffer := Temp;
end;

procedure TPacketReader.AddData(AData: pointer; ASize: integer);
begin
  FCS.Acquire;
  try
    FBuffer.Write( AData, ASize );

    while can_AddData do begin
      do_AddData;
      pack_Buffer;
    end;
  finally
    FCS.Release;
  end;
end;

procedure TPacketReader.Clear;
var
  Loop: Integer;
begin
  FCS.Acquire;
  try
    FBuffer.Clear;
    FNewBuffer.Clear;

    for Loop := 0 to FList.Count-1 do TObject(FList[Loop]).Free;

    FList.Clear;
  finally
    FCS.Release;
  end;
end;

constructor TPacketReader.Create;
begin
  inherited;

  FCS := TCriticalSection.Create;
  FBuffer := TMemoryBuffer.Create;
  FNewBuffer := TMemoryBuffer.Create;
  FList := TList.Create;
end;

destructor TPacketReader.Destroy;
begin
  Clear;

  FreeAndNil(FCS);
  FreeAndNil(FBuffer);
  FreeAndNil(FNewBuffer);
  FreeAndNil(FList);

  inherited;
end;

function TPacketReader.GetCurrentPacketSize: integer;
var
  Memory : TMemory;
  pHeader : PSuperSocketPacketHeader;
begin
  Result := 0;

  FCS.Acquire;
  try
    if FList.Count > 0 then begin
      Memory := Pointer( FList[0] );
      pHeader := Pointer( Memory.Data );
      Result := pHeader^.Size;

      Exit;
    end;

    if FBuffer.Size >= SizeOf(TSuperSocketPacketHeader) then begin
      pHeader := FBuffer.Memory;
      Result := pHeader^.Size;
    end;
  finally
    FCS.Release;
  end;
end;

function TPacketReader.GetPacket(var ACustomData: DWord; var AData: pointer;
  var ASize: integer): boolean;
var
  Memory : TMemory;
  pPacket : ^TSuperSocketPacket;
begin
  ACustomData := 0;
  AData := nil;
  ASize := 0;
  Result := false;

  FCS.Acquire;
  try
    Result := FList.Count > 0;

    if Result = false then Exit;

    Memory := Pointer( FList[0] );
    try
      FList.Delete( 0 );

      pPacket := Pointer( Memory.Data );

      ACustomData := pPacket^.Header.CustomData;

      ASize := pPacket^.Header.Size;

      if ASize > PACKET_SIZE_LIMIT then begin
        // TODO: 에러 처리
        Trace( 'TPacketReader.GetPacket - ASize > PACKET_SIZE_LIMIT' );
      end;

      if ASize > 0 then begin
        GetMem( AData, ASize );
        Move( pPacket^.DataStart, AData^, ASize );
      end;
    finally
      Memory.Free;
    end;
  finally
    FCS.Release;
  end;
end;

end.
