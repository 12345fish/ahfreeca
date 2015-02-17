unit ClientUnit;

interface

uses
  CoreInterface,
  ClientUnit.TextClient,
  ClientUnit.VoiceClient,
  ClientUnit.VideoClient,
  Config, Protocol,
  RyuLibBase,
  SysUtils, Classes;

type
  {*
    Ŭ���̾�Ʈ ���ϵ��� ������ �������� ���� Ŭ�����̴�.
    ������ Text, Voice, Video �� ���� �ٸ� ��Ʈ�� ����ϰ� �ִ�.
  }
  TClientUnit = class
  private
    FTextClient : TTextClient;
  private
    FVoiceClient : TVoiceClient;
  private
    FVideoClient : TVideoClient;
    function GetTextClient: ITextClient;
    function GetVoiceClient: IVoiceClient;
    function GetVideoClient: IVideoClient;
  public
    constructor Create;
    destructor Destroy; override;

    class function Obj:TClientUnit;

    procedure Initialize;
    procedure Finalize;

    {*
      ������ �����Ѵ�.
      Text, Voice, Video ���� ���ΰ� ���ӵ��� ������ ����ó�� �Ѵ�.
      ����ó���� sp_Terminate�� �̿��ؼ� ���α׷��� �����ϵ��� View �޽����� ������.
    }
    procedure Connect;

    /// ���� ������ �����Ѵ�.
    procedure Disconnect;
  public
    property TextClient : ITextClient read GetTextClient;
    property VoiceClient : IVoiceClient read GetVoiceClient;
    property VideoClient : IVideoClient read GetVideoClient;
  end;

implementation

uses
  Core;

{ TClientUnit }

var
  MyObject : TClientUnit = nil;

class function TClientUnit.Obj: TClientUnit;
begin
  if MyObject = nil then MyObject := TClientUnit.Create;
  Result := MyObject;
end;

procedure TClientUnit.Connect;
begin
  if not FTextClient.Connect then begin
    TCore.Obj.View.sp_Terminate( '������ ���� �� ���� �����ϴ�.' );
    Exit;
  end;

  if not FVoiceClient.Connect then begin
    TCore.Obj.View.sp_Terminate( '������ ���� �� ���� �����ϴ�.' );
    Exit;
  end;

  if not FVideoClient.Connect then begin
    TCore.Obj.View.sp_Terminate( '������ ���� �� ���� �����ϴ�.' );
    Exit;
  end;

  FTextClient.sp_Login;
end;

constructor TClientUnit.Create;
begin
  inherited;

  FTextClient := TTextClient.Create;
  FVoiceClient := TVoiceClient.Create;
  FVideoClient := TVideoClient.Create;
end;

destructor TClientUnit.Destroy;
begin
  Disconnect;

  FreeAndNil(FTextClient);
  FreeAndNil(FVoiceClient);
  FreeAndNil(FVideoClient);

  inherited;
end;

procedure TClientUnit.Disconnect;
begin

end;

procedure TClientUnit.Finalize;
begin
  Disconnect;
end;

function TClientUnit.GetTextClient: ITextClient;
begin
  Result := FTextClient;
end;

function TClientUnit.GetVideoClient: IVideoClient;
begin
  Result := FVideoClient as IVideoClient;
end;

function TClientUnit.GetVoiceClient: IVoiceClient;
begin
  Result := FVoiceClient as IVoiceClient;
end;

procedure TClientUnit.Initialize;
begin
  //
end;

initialization
  MyObject := TClientUnit.Create;
end.