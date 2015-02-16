/// TCore가 정의되고 구현된 유닛이다.
unit Core;

interface

uses
  CoreInterface,
  View, Option, ValueList,
  SysUtils, Classes;

type
  /// Application의 핵심 기능을 모아둔 클래스 이다.
  TCore = class (TComponent)
  private
    FIsInitialized : boolean;
    FIsfinalized : boolean;
  private
    FView: TView;
    FOption: TOption;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    class function Obj:TCore;

    /// TCore에서 사용하는 객체들에 대한 초기화.
    procedure Initialize;

    /// TCore에서 사용하는 객체들에 대한 종료 처리.
    procedure Finalize;

    /// 방송을 시작한다.
    procedure StartShow;

    /// 방송을 종료한다.
    procedure StopShow;
  published
    property View: TView read FView;
    property Option : TOption read FOption;
  end;

implementation

uses
  ClientUnit, VoiceSender, VoiceReceiver;

var
  MyObject : TCore = nil;

{ TCore }

constructor TCore.Create(AOwner: TComponent);
begin
  inherited;

  FIsInitialized := false;
  FIsfinalized := false;

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

  FView.sp_Initialize;
end;

class function TCore.Obj: TCore;
begin
  if MyObject = nil then MyObject := TCore.Create(nil);
  Result := MyObject;
end;

procedure TCore.StartShow;
begin
  // TODO:
  TVoiceSender.Obj.Start;

  FView.sp_StartShow;
end;

procedure TCore.StopShow;
begin
  // TODO:
  TVoiceSender.Obj.Stop;

  FView.sp_StopShow;
end;

end.
