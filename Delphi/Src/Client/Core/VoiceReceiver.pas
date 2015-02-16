unit VoiceReceiver;

interface

uses
  RyuLibBase, VoicePlayer, VoiceZipUtils,
  SysUtils, Classes;

type
  /// �����κ��� ������ ���� ��Ŷ�� ���ڵ� �� ����ϴ� Ŭ����
  TVoiceReceiver = class
  private
    FVoicePlayer : TVoicePlayer;
  private
    function GetIsMute:boolean;
    procedure SetIsMute(AValue:boolean);
    function GetVolume: Single;
    procedure SetVolume(const Value: Single);
    function GetVolumeOut:integer;
    function GetDelayedTime: integer;
  public
    constructor Create;
    destructor Destroy; override;

    class function Obj:TVoiceReceiver;

    procedure Initialize;
    procedure Finalize;

    /// ���� ����� �����Ѵ�.  (���� ��� ����̽� ����)
    procedure Start;

    /// ���� ����� �����.
    procedure Stop;

    {*
      ���� �� ��Ŷ�� ����Ѵ�.
      @param AData ���� �� �������� ������ �ּ�
      @Param ASize ���� �� �������� ����Ʈ ũ��
    }
    procedure DataIn(AData:pointer; ASize:integer);
  public
    /// ���Ұ�
    property IsMute : boolean read GetIsMute write SetIsMute;

    /// ��� ���� (Volume > 1.0 �̸� ����)
    property Volume: Single read GetVolume write SetVolume;

    /// ���� ����ǰ� �ִ� �Ҹ��� ũ��
    property VolumeOut : integer read GetVolumeOut;

    /// ���ۿ� �׿��� ���� ��µǰ� ���� �ʴ� �������� �� (ms ����)
    property DelayedTime : integer read GetDelayedTime;
  end;

implementation

{ TVoiceReceiver }

var
  MyObject : TVoiceReceiver = nil;

class function TVoiceReceiver.Obj: TVoiceReceiver;
begin
  if MyObject = nil then MyObject := TVoiceReceiver.Create;
  Result := MyObject;
end;

procedure TVoiceReceiver.SetIsMute(AValue: boolean);
begin
  FVoicePlayer.Mute := AValue;
end;

procedure TVoiceReceiver.SetVolume(const Value: Single);
begin
  FVoicePlayer.Volume := Value;
end;

procedure TVoiceReceiver.Start;
begin
  FVoicePlayer.Start;
end;

procedure TVoiceReceiver.Stop;
begin
  FVoicePlayer.Stop;
end;

constructor TVoiceReceiver.Create;
begin
  inherited;

  FVoicePlayer := TVoicePlayer.Create(nil);
  FVoicePlayer.Start;
end;

procedure TVoiceReceiver.DataIn(AData: pointer; ASize: integer);
begin
  FVoicePlayer.DataIn( AData, ASize );
end;

destructor TVoiceReceiver.Destroy;
begin
  Stop;

  FreeAndNil(FVoicePlayer);

  inherited;
end;

procedure TVoiceReceiver.Finalize;
begin
  Stop;
end;

function TVoiceReceiver.GetDelayedTime: integer;
begin
  Result := (FVoicePlayer as IAudioDecoder).DelayedTime;
end;

function TVoiceReceiver.GetIsMute: boolean;
begin
  Result := FVoicePlayer.Mute;
end;

function TVoiceReceiver.GetVolume: Single;
begin
  Result := FVoicePlayer.Volume;
end;

function TVoiceReceiver.GetVolumeOut: integer;
begin
  Result := FVoicePlayer.VolumeOut;
end;

procedure TVoiceReceiver.Initialize;
begin
  //
end;

initialization
  MyObject := TVoiceReceiver.Create;
end.