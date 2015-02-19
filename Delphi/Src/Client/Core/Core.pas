/// TCore�� ���ǵǰ� ������ �����̴�.
unit Core;

interface

uses
  CoreInterface,
  View, Option, ValueList,
  SysUtils, Classes;

type
  /// Application�� �ٽ� ����� ��Ƶ� Ŭ���� �̴�.
  TCore = class (TComponent)
  private
    FIsInitialized : boolean;
    FIsfinalized : boolean;
  private
    FView: TView;
    FOption: TOption;
  private
    FIsShowStarted: boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    class function Obj:TCore;

    /// TCore���� ����ϴ� ��ü�鿡 ���� �ʱ�ȭ.
    procedure Initialize;

    /// TCore���� ����ϴ� ��ü�鿡 ���� ���� ó��.
    procedure Finalize;

    /// ����� �����Ѵ�.
    procedure StartShow;

    /// ����� �����Ѵ�.
    procedure StopShow;
  published
    property View: TView read FView;
    property Option : TOption read FOption;
  published
    /// ��� ���� ��?
    property IsShowStarted : boolean read FIsShowStarted;
  end;

implementation

uses
  ClientUnit, VoiceSender, VoiceReceiver, VideoSender;

var
  MyObject : TCore = nil;

{ TCore }

constructor TCore.Create(AOwner: TComponent);
begin
  inherited;

  FIsInitialized := false;
  FIsfinalized := false;

  FIsShowStarted := false;

  FOption := TOption.Create;

  FView := TView.Create(Self);
  FView.Add(Self);
end;

destructor TCore.Destroy;
begin
  Finalize;

  FreeAndNil(FOption);
  FreeAndNil(FView);

  inherited;
end;

procedure TCore.Finalize;
begin
  if FIsfinalized then Exit;
  FIsfinalized := true;

  FView.Remove(Self);
  FView.sp_Finalize;
  FView.Active := false;

  TVideoSender.Obj.Finalize;
  TVoiceReceiver.Obj.Finalize;
  TVoiceSender.Obj.Finalize;
  TClientUnit.Obj.Finalize;
end;

procedure TCore.Initialize;
begin
  if FIsfinalized then Exit;

  if FIsInitialized then Exit;
  FIsInitialized := true;

  TClientUnit.Obj.Initialize;
  TVoiceSender.Obj.Initialize;
  TVoiceReceiver.Obj.Initialize;
  TVideoSender.Obj.Initialize;

  FView.sp_Initialize;
end;

class function TCore.Obj: TCore;
begin
  if MyObject = nil then MyObject := TCore.Create(nil);
  Result := MyObject;
end;

procedure TCore.StartShow;
begin
  TVoiceSender.Obj.Start;
  TVideoSender.Obj.Start;

  FView.sp_StartShow;

  TClientUnit.Obj.TextClient.sp_OnAir;

  FIsShowStarted := true;
end;

procedure TCore.StopShow;
begin
  FIsShowStarted := false;

  TVoiceSender.Obj.Stop;
  TVideoSender.Obj.Stop;

  FView.sp_StopShow;

  TClientUnit.Obj.TextClient.sp_OffAir;
end;

end.
