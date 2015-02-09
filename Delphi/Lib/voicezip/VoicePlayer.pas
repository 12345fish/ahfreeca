unit VoicePlayer;

interface

uses
  DebugTools, VoiceZipUtils, WaveOut, SpeexDecoder, SoundTouchDLL, VoiceBuffer,
  MemoryReader, SimpleThread, VoiceQuality,
  Windows, Classes, SysUtils;

type
  IVoicePlayer = interface
    ['{A480221C-8951-4525-AA63-7C9ADD7568E3}']

    procedure Clear;

    /// ���� ��� ��ġ ����� �����Ѵ�.
    procedure Start;

    /// ���� ��� ��ġ ����� �ߴ��Ѵ�.
    procedure Stop;

    /// ����� ���� �����͸� ����Ѵ�.
    procedure DataIn(AData:pointer; ASize:integer);

    /// ���Ұ� ������ �˷��ش�.
    function GetMute:boolean;

    /// ���Ұ� ���θ� �����Ѵ�.
    procedure SetMute(const Value: Boolean);

    /// ���� ��� �ӵ��� �˷��ش�.
    function GetTempo: integer;

    /// ��� �ӵ��� �����Ѵ�.
    procedure SetTempo(const Value: integer);

    /// ������ ���� ���¸� �˷��ش�.  (�⺻�� 1.0)
    function GetVolume: Single;

    /// ������ �����Ѵ�.
    procedure SetVolume(const Value: Single);

    {*
      ���� ��µǰ� �ִ� ������ �˷��ش�.
      GetVolume�� ������ ������ �󸶳� ���� �Ǵ� ����ϴ��ĸ� �˷��ش�.
      GetVolumeOut�� �󸶳� ũ�� �Ҹ��� ����ǰ� �ִ� ���� �˷��ش�.
    }
    function GetVolumeOut: integer;

    /// ������ ���� �� �ð��� �˷��ش�.
    function GetDuration: integer;

    /// ���� ���� ��� �Ѱ踦 �˷��ش�.
    function GetDurationLimit: integer;

    {*
      ���� ���� ��� �Ѱ踦 �����Ѵ�.
      ������ ������ �Ѿ�� ������ �����Ǹ�, ���� ����� ���ؼ� ������ �����Ѵ�.
    }
    procedure SetDurationLimit(const Value: integer);
  end;

  TVoicePlayer = class (TComponent, IVoicePlayer)
  private
    FVoiceQuality : TVoiceQuality;
    FBuffer : TVoiceBuffer;
    FMemoryReader : TMemoryReader;
    function get_VoiceData(var AData:pointer; var ASize:integer):boolean;
  private
    // TODO: ������ ���� ��� ����, ��Ŷ ��ü�� �����ϴ� ������� DeskCam�� AudioSync ����
    FSoundTouch : TSoundTouch;
    procedure on_SoundTouch(Sender:TObject; AData:pointer; ASize:integer);
  private
    FWaveOut : TWaveOut;
    procedure on_VoicePlayed(Sender:TObject; AData:pointer; ASize:integer);
  private
    FRepeater : TSimpleThread;
    procedure on_Repeat(Sender:TObject);
  private
    FSpeexDecoder : TSpeexDecoder;
    procedure on_DataDecode(Sender:TObject; AData:pointer; ASize,AVolume:integer);
  private
    FMute : Boolean;
    FMuteVoice : array [0.._FrameSize-1] of byte;
  private
    FTempo : integer;
    FVolumeOut: integer;
    FDurationLimit : integer;
    FSaveToBuffer: Boolean;
    FOnVoicePlayed: TNotifyEvent;
    function GetMute: Boolean;
    procedure SetMute(const Value: Boolean);
    function GetTempo: integer;
    procedure SetTempo(const Value: integer);
    function GetDuration: integer;
    function GetDurationLimit: integer;
    procedure SetDurationLimit(const Value: integer);
    function GetVolumeOut: integer;
    function GetVolume: Single;
    procedure SetVolume(const Value: Single);
    function GetIsBusy: boolean;
    function GetVoiceQuality: integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Clear;

    procedure Start;
    procedure Stop;

    procedure DataIn(AData:pointer; ASize:integer); overload;
    procedure DataIn(AStream:TStream); overload;
  published
    property SaveToBuffer : Boolean read FSaveToBuffer write FSaveToBuffer;

    property Mute: Boolean read GetMute write SetMute;
    property VolumeOut: integer read GetVolumeOut;
    property Volume: Single read GetVolume write SetVolume;

    property IsBusy : boolean read GetIsBusy;

    property VoiceQuality : integer read GetVoiceQuality;

    /// Tempo = 0: Normal speed, Tempo > 0: Faster, Tempo < 0: Slower
    property Tempo : integer read GetTempo write SetTempo;

    /// Duration indicate the time left to empty VoiceBuffer.
    property Duration : integer read GetDuration;

    /// VoiceBuffer can't hold data more than DurationLimit.  When it over the limit, Tempo will increased automatically to reduce it's amount.
    property DurationLimit : integer read GetDurationLimit write SetDurationLimit;

    property OnVoicePlayed : TNotifyEvent read FOnVoicePlayed write FOnVoicePlayed;
  end;

  TFakeVoicePlayer = class (TComponent, IVoicePlayer)
  private
    FOldTick : Cardinal;
    FTickCount : integer;
    FRepeater : TSimpleThread;
    procedure on_Repeat(Sender:TObject);
  private
    FSaveToBuffer: Boolean;
    function GetTempo: integer;
    procedure SetTempo(const Value: integer);
    function GetDuration: integer;
    function GetDurationLimit: integer;
    procedure SetDurationLimit(const Value: integer);
    function GetMute: Boolean;
    procedure SetMute(const Value: Boolean);
    function GetVolumeOut: integer;
    function GetVolume: Single;
    procedure SetVolume(const Value: Single);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Clear;

    procedure Start;
    procedure Stop;

    procedure DataIn(AData:pointer; ASize:integer);
  published
    property SaveToBuffer : Boolean read FSaveToBuffer write FSaveToBuffer;

    property Mute: Boolean read GetMute write SetMute;
    property VolumeOut: integer read GetVolumeOut;
    property Volume: Single read GetVolume write SetVolume;

    property Tempo : integer read GetTempo write SetTempo;

    property Duration : integer read GetDuration;
    property DurationLimit : integer read GetDurationLimit write SetDurationLimit;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Voice Zip', [TVoicePlayer]);
end;

{ TVoicePlayer }

procedure TVoicePlayer.Clear;
begin
  FBuffer.Clear;
  FVoiceQuality.Clear;
end;

constructor TVoicePlayer.Create(AOwner: TComponent);
begin
  inherited;

  FSaveToBuffer := false;
  FVolumeOut := 0;

  FMute := false;
  FillChar(FMuteVoice[0], SizeOf(FMuteVoice), 0);

  FTempo := 0;
  FDurationLimit := 0;

  FVoiceQuality := TVoiceQuality.Create;

  FSpeexDecoder := TSpeexDecoder.Create(Self);
  FSpeexDecoder.OnData := on_DataDecode;

  FSoundTouch := TSoundTouch.Create(_Channels, _SampleRate);
  FSoundTouch.Tempo := 10;
  FSoundTouch.OnData := on_SoundTouch;

  FWaveOut := TWaveOut.Create(Self);
  FWaveOut.Channels := _Channels;
  FWaveOut.SampleRate := _SampleRate;
  FWaveOut.OnPlayed := on_VoicePlayed;

  FBuffer := TVoiceBuffer.Create;
  FMemoryReader := TMemoryReader.Create;

  FRepeater := TSimpleThread.Create(on_Repeat);
  FRepeater.Name := 'TVoicePlayer';
end;

procedure TVoicePlayer.DataIn(AData: pointer; ASize: integer);
begin
  if ASize > 0 then FSpeexDecoder.Excute(AData, ASize);

  FVoiceQuality.Add( FBuffer.Duration );
end;

procedure TVoicePlayer.DataIn(AStream: TStream);
var
  Data : pointer;
begin
  if not FWaveOut.Active then Exit;

  if AStream.Size = 0 then Exit;

  GetMem(Data, AStream.Size);
  try
    AStream.Position := 0;
    AStream.Read(Data^, AStream.Size);

    DataIn(Data, AStream.Size);
  finally
    FreeMem(Data);
  end;
end;

destructor TVoicePlayer.Destroy;
begin
  Stop;

  FRepeater.Terminate;

  FreeAndNil(FVoiceQuality);
  FreeAndNil(FSpeexDecoder);
  FreeAndNil(FSoundTouch);
  FreeAndNil(FWaveOut);
  FreeAndNil(FBuffer);
  FreeAndNil(FMemoryReader);

  inherited;
end;

function TVoicePlayer.GetDuration: integer;
begin
  Result := FBuffer.Duration + (FWaveOut.DataInBuffer * _FrameTime);
end;

function TVoicePlayer.GetDurationLimit: integer;
begin
  Result := FDurationLimit;
end;

function TVoicePlayer.GetIsBusy: boolean;
const
  VOICEPLAYER_IS_BUSY = 200;
begin
  Result := Duration > VOICEPLAYER_IS_BUSY;
end;

function TVoicePlayer.GetTempo: integer;
begin
  Result := FTempo;
end;

function TVoicePlayer.GetVoiceQuality: integer;
begin
  Result := FVoiceQuality.Quality;
end;

function TVoicePlayer.GetVolume: Single;
begin
  Result := FSpeexDecoder.Volume;
end;

function TVoicePlayer.GetVolumeOut: integer;
begin
  if FWaveOut.DataInBuffer = 0 then Result := 0
  else Result := FVolumeOut;
end;

function TVoicePlayer.get_VoiceData(var AData: pointer;
  var ASize: integer): boolean;
var
  Data : pointer;
  Size : integer;
begin
  while FMemoryReader.Size < _FrameSize do begin
    if FBuffer.Get(Data, Size)  then begin
      try
        FMemoryReader.Write(Data, Size);
      finally
        if Data <> nil then FreeMem(Data);
      end;
    end else begin
      Break;
    end;
  end;

  Result := FMemoryReader.Read(AData, _FrameSize);
  if Result then ASize := _FrameSize;
end;

function TVoicePlayer.GetMute: Boolean;
begin
  Result := FMute;
end;

procedure TVoicePlayer.on_DataDecode(Sender: TObject;
  AData: pointer; ASize, AVolume: integer);
var
  iTempo : integer;
begin
  FVolumeOut := AVolume;

  if FTempo <> 0 then begin
    iTempo := FTempo;
  end else begin
    if (not FSaveToBuffer) and (FDurationLimit > 0) and (GetDuration > FDurationLimit) then iTempo := 10
    else iTempo := 0;
  end;

  if iTempo <> FSoundTouch.Tempo then FSoundTouch.Tempo := iTempo;

  FSoundTouch.DataIn(AData, ASize);
end;

procedure TVoicePlayer.on_Repeat(Sender: TObject);
var
  Data : pointer;
  Size : integer;
begin
  while not FRepeater.Terminated do begin
    if not SaveToBuffer then begin
      while FWaveOut.DataInBuffer < 8 do begin
        if get_VoiceData(Data, Size) then begin
          try
            if not FMute then FWaveOut.Play(Data, Size)
            else FWaveOut.Play(@FMuteVoice, _FrameSize);
          finally
            if Data <> nil then FreeMem(Data);
          end;
        end else begin
          Break;
        end;
      end;
    end;

    FRepeater.SleepTight;
  end;
end;

procedure TVoicePlayer.on_SoundTouch(Sender: TObject; AData: pointer;
  ASize: integer);
begin
  FBuffer.Add(AData, ASize);
  FRepeater.WakeUp;
end;

procedure TVoicePlayer.on_VoicePlayed(Sender: TObject; AData: pointer;
  ASize: integer);
begin
  FRepeater.WakeUp;
  if Assigned(FOnVoicePlayed) then FOnVoicePlayed(Self);  
end;

procedure TVoicePlayer.SetDurationLimit(const Value: integer);
begin
  FDurationLimit := Value;
end;

procedure TVoicePlayer.SetMute(const Value: Boolean);
begin
  FMute := Value;
end;

procedure TVoicePlayer.SetTempo(const Value: integer);
begin
  FTempo := Value;
end;

procedure TVoicePlayer.SetVolume(const Value: Single);
begin
  FSpeexDecoder.Volume := Value;
end;

procedure TVoicePlayer.Start;
begin
  FBuffer.Clear;
  FMemoryReader.Clear;
  FVoiceQuality.Clear;

  try
    FWaveOut.Start;
  except
    Trace('Error: TCore.Create: FVoiceOut.Start');
    Exit;
  end;

  FSpeexDecoder.Start;
  FRepeater.WakeUp;
end;

procedure TVoicePlayer.Stop;
begin
  FVolumeOut := 0;
  FWaveOut.Stop;
  FBuffer.Clear;
  FMemoryReader.Clear;
end;

{ TFakeVoicePlayer }

procedure TFakeVoicePlayer.Clear;
begin

end;

constructor TFakeVoicePlayer.Create(AOwner: TComponent);
begin
  inherited;

  FTickCount := 0;
  FOldTick := GetTickCount;

  FRepeater := TSimpleThread.Create(on_Repeat);
  FRepeater.Name := 'TFakeVoicePlayer';
end;

procedure TFakeVoicePlayer.DataIn(AData: pointer; ASize: integer);
begin
  InterlockedExchangeAdd(FTickCount, 20);
  FRepeater.WakeUp;
end;

destructor TFakeVoicePlayer.Destroy;
begin
  FRepeater.Terminate;

  inherited;
end;

function TFakeVoicePlayer.GetDuration: integer;
begin
  Result := FTickCount;
  if Result < 0 then Result := 0;
end;

function TFakeVoicePlayer.GetDurationLimit: integer;
begin
  Result := 0;
end;

function TFakeVoicePlayer.GetTempo: integer;
begin
  Result := 0;
end;

function TFakeVoicePlayer.GetVolume: Single;
begin
  Result := 0;
end;

function TFakeVoicePlayer.GetVolumeOut: integer;
begin
  Result := 0;
end;

function TFakeVoicePlayer.GetMute: Boolean;
begin
  Result := true;
end;

procedure TFakeVoicePlayer.on_Repeat(Sender: TObject);
var
  Tick : Cardinal;
begin
  while not FRepeater.Terminated do begin
    while FTickCount > 0 do begin
      Tick := GetTickCount;

      if Tick > FOldTick then InterlockedExchangeAdd(FTickCount, -(Tick - FOldTick));
      FOldTick := Tick;

      if FTickCount < 0 then FTickCount := 0
      else if FTickCount > 0 then Sleep(5);
    end;

    FRepeater.SleepTight;
  end;
end;

procedure TFakeVoicePlayer.SetDurationLimit(const Value: integer);
begin
  //
end;

procedure TFakeVoicePlayer.SetMute(const Value: Boolean);
begin
  //
end;

procedure TFakeVoicePlayer.SetTempo(const Value: integer);
begin
  // TODO: ���� ó��
end;

procedure TFakeVoicePlayer.SetVolume(const Value: Single);
begin
  //
end;

procedure TFakeVoicePlayer.Start;
begin
  FTickCount := 0;
  FOldTick := GetTickCount;
end;

procedure TFakeVoicePlayer.Stop;
begin
  //
end;

end.
