object frmPro: TfrmPro
  Left = 300
  Top = 174
  BorderStyle = bsDialog
  Caption = 'Progress'
  ClientHeight = 277
  ClientWidth = 276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object proDlg: TVistaProBar
    Left = 8
    Top = 223
    Width = 257
    Height = 17
    MarqueeSize = 40
    MarqueeFade = 30
    MarqueeSpeed = 25
    AltMode = False
    Percentage = False
    Position = 0
    ShowPosText = False
    Color = clLime
  end
  object ieThumb: TImageEnView
    Left = 8
    Top = 8
    Width = 257
    Height = 209
    Cursor = crDefault
    Background = clWhite
    Ctl3D = False
    ParentCtl3D = False
    ZoomFilter = rfFastLinear
    ScrollBars = ssNone
    AutoShrink = True
    ImageEnVersion = '3.1.1'
    EnableInteractionHints = True
    TabOrder = 0
  end
  object btnClose: TButton
    Left = 190
    Top = 246
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Close'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
end
