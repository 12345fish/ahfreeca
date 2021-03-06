unit _frControlBoxSender;

interface

uses
  Config,
  FrameBase, ValueList, Disk, RyuGraphics,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, MusicTrackBar, SwitchButton, Vcl.StdCtrls, BitmapTile,
  Vcl.Imaging.pngimage;

type
  TfrControlBoxSender = class(TFrame, IFrameBase)
    BitmapTile1: TBitmapTile;
    LevelMeterBack: TShape;
    LevelMeter: TShape;
    btMic: TSwitchButton;
    Volume: TMusicTrackBar;
    Timer: TTimer;
    lbVolume: TLabel;
    btOnAir: TSwitchButton;
    Image1: TImage;
    procedure btMicClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure VolumeChanged(Sender: TObject);
    procedure btOnAirClick(Sender: TObject);
  private
    procedure BeforeShow;
    procedure AfterShow;
    procedure BeforeClose;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses
  Core, VoiceSender;

{$R *.dfm}

{ TfrCamSender }

procedure TfrControlBoxSender.AfterShow;
begin

end;

procedure TfrControlBoxSender.BeforeClose;
begin

end;

procedure TfrControlBoxSender.BeforeShow;
begin

end;

procedure TfrControlBoxSender.btMicClick(Sender: TObject);
begin
  btMic.SwitchOn := not btMic.SwitchOn;
  TVoiceSender.Obj.IsMute := not btMic.SwitchOn;
end;

procedure TfrControlBoxSender.btOnAirClick(Sender: TObject);
begin
  btOnAir.SwitchOn := not btOnAir.SwitchOn;

  if btOnAir.SwitchOn then TCore.Obj.StartShow
  else TCore.Obj.StopShow;
end;

constructor TfrControlBoxSender.Create(AOwner: TComponent);
begin
  inherited;

  TCore.Obj.View.Add(Self);
end;

destructor TfrControlBoxSender.Destroy;
begin
  TCore.Obj.View.Remove(Self);

  inherited;
end;

procedure TfrControlBoxSender.TimerTimer(Sender: TObject);
var
  Color : TColor;
  iVolumeInPercent : integer;
begin
  Timer.Enabled := false;
  try
    iVolumeInPercent := 100 * TVoiceSender.Obj.VolumeIn div ($FFFF div 2);

    LevelMeter.Width := LevelMeterBack.Width * iVolumeInPercent div 100;

    if iVolumeInPercent > 80 then Color := clRed
    else if iVolumeInPercent > 60 then Color := clYellow
    else Color := $0019F81D;

    LevelMeter.Brush.Color := Color;
    LevelMeter.Pen.Color   := Color;
  finally
    Timer.Enabled := true;
  end;
end;

procedure TfrControlBoxSender.VolumeChanged(Sender: TObject);
begin
  TVoiceSender.Obj.Volume := Volume.Position / 100;
  lbVolume.Caption := Format( '%d%%', [Volume.Position div 10] );
end;

end.