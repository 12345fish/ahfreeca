object FormURL: TFormURL
  Left = 306
  Top = 147
  BorderStyle = bsDialog
  Caption = 'Drag '#39'n'#39' Drop  Demo - URL & Bitmap'
  ClientHeight = 373
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object LabelURL: TLabel
    Left = 13
    Top = 130
    Width = 171
    Height = 13
    Caption = 'http://melander.dk/delphi/dragdrop'
  end
  object Panel1: TPanel
    Left = 10
    Top = 8
    Width = 350
    Height = 30
    BevelOuter = bvNone
    BorderWidth = 1
    BorderStyle = bsSingle
    Caption = 'TDropURLSource, TDropURLTarget'
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Shell Dlg 2'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object ButtonClose: TButton
    Left = 10
    Top = 317
    Width = 350
    Height = 30
    Cancel = True
    Caption = '&Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Shell Dlg 2'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = ButtonCloseClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 354
    Width = 372
    Height = 19
    Panels = <>
    ParentFont = True
    SimplePanel = True
    SizeGrip = False
    UseSystemFont = False
  end
  object Memo2: TMemo
    Left = 10
    Top = 49
    Width = 350
    Height = 48
    TabStop = False
    Alignment = taCenter
    Color = clBtnFace
    Lines.Strings = (
      
        'This demonstrates a very simple drag operation which allows drag' +
        'ging '
      
        'the edit control URL TO and FROM other applications which accept' +
        ' '
      'Drag'#39'n'#39'Drop URL shortcuts (eg Firefox, IE or the Desktop). ')
    ReadOnly = True
    TabOrder = 3
    WantReturns = False
  end
  object PanelImageTarget: TPanel
    Left = 237
    Top = 255
    Width = 58
    Height = 54
    BorderWidth = 2
    Caption = 'Drop Here'
    TabOrder = 4
    object ImageTarget: TImage
      Left = 3
      Top = 3
      Width = 52
      Height = 48
      Hint = 'Right click for clipboard operations'
      Align = alClient
      PopupMenu = PopupMenu1
      Stretch = True
    end
  end
  object Panel3: TPanel
    Left = 10
    Top = 156
    Width = 350
    Height = 30
    BevelOuter = bvNone
    BorderWidth = 1
    BorderStyle = bsSingle
    Caption = 'TDropBMPSource, TDropBMPTarget'
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Shell Dlg 2'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object Memo1: TMemo
    Left = 9
    Top = 198
    Width = 350
    Height = 51
    TabStop = False
    Alignment = taCenter
    Color = clBtnFace
    Lines.Strings = (
      'Drag either picture on the left to the panel on the '
      'right or run a second DragDropDemo session and drag to it.'
      'Also demonstrates how to display images during a drag.')
    ReadOnly = True
    TabOrder = 6
    WantReturns = False
  end
  object PanelImageSource2: TPanel
    Left = 114
    Top = 255
    Width = 58
    Height = 54
    BorderWidth = 2
    TabOrder = 7
    object ImageSource2: TImage
      Left = 3
      Top = 3
      Width = 52
      Height = 48
      Hint = 'Right click for clipboard operations'
      Align = alClient
      AutoSize = True
      Center = True
      Picture.Data = {
        07544269746D61705E0E0000424D5E0E00000000000036040000280000003200
        0000320000000100080000000000280A0000CE0E0000D80E0000000100000000
        0000000000000000330000006600000099000000CC000000FF00003300000033
        330000336600003399000033CC000033FF000066000000663300006666000066
        99000066CC000066FF00009900000099330000996600009999000099CC000099
        FF0000CC000000CC330000CC660000CC990000CCCC0000CCFF0000FF000000FF
        330000FF660000FF990000FFCC0000FFFF003300000033003300330066003300
        99003300CC003300FF00333300003333330033336600333399003333CC003333
        FF00336600003366330033666600336699003366CC003366FF00339900003399
        330033996600339999003399CC003399FF0033CC000033CC330033CC660033CC
        990033CCCC0033CCFF0033FF000033FF330033FF660033FF990033FFCC0033FF
        FF00660000006600330066006600660099006600CC006600FF00663300006633
        330066336600663399006633CC006633FF006666000066663300666666006666
        99006666CC006666FF00669900006699330066996600669999006699CC006699
        FF0066CC000066CC330066CC660066CC990066CCCC0066CCFF0066FF000066FF
        330066FF660066FF990066FFCC0066FFFF009900000099003300990066009900
        99009900CC009900FF00993300009933330099336600993399009933CC009933
        FF00996600009966330099666600996699009966CC009966FF00999900009999
        330099996600999999009999CC009999FF0099CC000099CC330099CC660099CC
        990099CCCC0099CCFF0099FF000099FF330099FF660099FF990099FFCC0099FF
        FF00CC000000CC003300CC006600CC009900CC00CC00CC00FF00CC330000CC33
        3300CC336600CC339900CC33CC00CC33FF00CC660000CC663300CC666600CC66
        9900CC66CC00CC66FF00CC990000CC993300CC996600CC999900CC99CC00CC99
        FF00CCCC0000CCCC3300CCCC6600CCCC9900CCCCCC00CCCCFF00CCFF0000CCFF
        3300CCFF6600CCFF9900CCFFCC00CCFFFF00FF000000FF003300FF006600FF00
        9900FF00CC00FF00FF00FF330000FF333300FF336600FF339900FF33CC00FF33
        FF00FF660000FF663300FF666600FF669900FF66CC00FF66FF00FF990000FF99
        3300FF996600FF999900FF99CC00FF99FF00FFCC0000FFCC3300FFCC6600FFCC
        9900FFCCCC00FFCCFF00FFFF0000FFFF3300FFFF6600FFFF9900FFFFCC00FFFF
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000D7A1A1A1A1A1A1A1A17D7D59353535353535352F2F53532F2F2F2F2F2F6B
        6B6B6B6B6B6B7777A1A1A1A1A1A1A166A1666677000066666666A1A1A1A1A17D
        7D5935353535353535352F2F2F2F35353535352F6B6B6B6B6B6B7777A1A1A1A1
        A1C5C56666C566660000A16666A16666A1A1A17D7D593535353535353535352F
        353535353535352F6B6B6B6B6B6B7777A1A1A1A1C5C5C5C56666C5660000A1A1
        A166A1A1A1A17D7D7D5935353535353535352F2F35353535352F2F6B6B6B6B6B
        6B6B7777A1A1A1A16666C5C566C5666600006666666666A1A1A17D7D59593535
        353535352F2F2F2F2F2F2F2F2F2F6B6B6B6B6B6B6B6B6B7777A1A1A1C5C56666
        666666A1000066666666A166A17D7D5953532F2F2F2F2F2F6B6B6B6B6B6B6B6B
        6B6B6B6B6B6B6B6B6B6B6B7777A1A1A166C56666666666A10000666666A166A1
        A17D5353ADAD5353535389ADAD6B6B6B6BADADAD6B6B6B6BD7D7D7D7D76B6B77
        7DA1A1A166666666666666660000A1A1666666A17D7753D70000D75353D70000
        00D76B6BAD010100D76BD7D70000000000D7D7777DA1A1A1A1C5C56666666666
        0000A166A166A1A1A177B390CC0000D7B390C6CC00D76BB390C6CC00D7D700BA
        C6C6C6CC000025D1A1A1A1A1A16666666666C56600006666C566A166A177B390
        9CCC0000D7909CC60000D7B3909CC600D790C69C9C9C9C9CC6CC25D1A1A1A1A1
        A1A1C5666666C5C50000C5C5C5A16666A17777B3909CCC00D7909C9CCC0000D7
        909CC600D7909C9CC6C6C6909CC62550D1A1A1A1A1A1C566666666C50000C5C5
        C5C5A1A17D776BB3909CC60000C69C9C9CCC00D7909CC600D7909CC6000000D7
        BAC6B4D7777DA1A1A1A1C5C56666C5660000C5C56666A1A177776B6BB3909CCC
        00C69C9C9CC60000C69CC600D7909C9CC6CC00000000D7D77777777DA1A1C5C5
        C5C566660000C5C5C5C5A17D776B6B6BB3909CC600CC9C9CC69CCC00C69CC600
        D7909C9C9CC6C6C6CC000000D7537777A16666C5C566C5C50000C5C5C5C5A177
        6B6B6B6B6BB3909CCC00C6C600C6C600CC9CC600D7B3909CC600CCC6C6CCCC00
        00D76B6B77A1A16666C566660000C5C5C5C5A1776B6B6B6B6B6BB3909CC69CC6
        00CC9CCC00C6C600D7ACB3909CCC00000000C6CC00D76B6B77A1A166C5C56666
        0000C5C5C5C5A1776B6B6B6B6B6BB3909C9C9CC60000BA9CC69CC600D7ACB390
        9C9CC6C6C6C69CC600D76B6B7777A1A166C566C50000C5C5C5A19B6B6B6B6B6B
        6B6B6BB3909C9C9CCC00D7909C9CC60000D76BB390909C9C9C9C9C90D76B6B6B
        6B77A1A1A1C566C50000C5C5C5A1776B6B6B6B6B6B6B6BB3909C9C9CC600D790
        9C9C9CCC00D76B6BB3B36D6D919090B36B6B6B6B6B6677A166A166A10000C5C5
        A1A1776B6B6B6B2F6B6B6B6BB3909C9CC600D7B3909C9CC600D76B6B6B6B8989
        8989B36B6B6B6B6B6B6B6B77A1A1A1A10000A1A1A1776B6B6B2F2F35352F6B6B
        B3909C9CC600D7B3909C9CC600B36B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B
        777777770000A1A177776B6B6B2F353535352F6B6BB3909CC600D76BB3909CC7
        01AD6B6B2F2F2F2F6B6B6B6B6B6B6B6B6B6B6B6B6B77777700007777776B6B6B
        2F3535353535356B6B6BB39090D76B6B6BB36D7483532F2F353535352F6B6B6B
        6B6B6B6B6B6B6B6B6B6B6B6B000077776B6B6B6B6B3535353535352F6B6B6BB3
        B36B6B6B6B6B5F5F2F2F3535353535352F6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B
        00006B6B6B6B6B6B6B2F353535352F6B6B6B6B6B6B6B6B6B2F2F2F2F35353535
        3535352F6B6BADB3D7D7D76B6B6B6B6B6B6B6B6B00006B6B6B6B6B6B6B6B2F35
        352F2F6B6B6B6B6B6B6B6B2F353535353535353535352F2F6BAD0100000000D7
        D76B6B6B6B6B6B6B00006B6B6B6B6B6B6B6B6B6B2F6B6B6B6B6B6B6B6B6B2F35
        35353535353535352F2F6B6B896DC7C6C6CC000000D76B6B6B6B6B6B00006B6B
        6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B2F353535353535352F2F6B6B6B6B
        B3909C9C9C9CC6CC0000D76B6B6B6B6B00006B6B6B6B6B6BD7D7D7B3ADAD6B6B
        6B6B6B6BAD6B2F35353535352F2F8383ADADD76BD7BAC69090909C9CCC00D76B
        6B6B6B6B00006B6B6B6BD7D7000000000000D7D76B6B6BB308832F2F3535352F
        2F830801010000D7000000D7B3D7BA9CC60000D76B6B6B6B00006B6B6BD700BA
        C6C6C6C6CC000000D76BB3B40108832F2F2F2F53896DC7C6C6CC00BAC6CC00D7
        D70000C69CCC00D76B6B6B6B00006B6BB390C69C9C9C9C9C9CC6CC0000D7909C
        CD01AD6B6B6B6B89919C9C9C9C9CC69C9CC600D790C6C69C9CC600D76B6B6B6B
        00006B6BB3909C9C9CC69090909C9CCC0000CC9CC60001AD6B6B6BB3909C9CC6
        9090909C9CC600BA9C9C9C9C9CC60000D76B6B6B00006B6B6BB3909CC600D7B3
        B3909C9CCC0000C69CCC00D76B6B6BB3909CC600D7B3B3909CC600C69C9CC690
        9C9CCC00D76B6B6B00006B6B6BB3909CC600D76B6BB3909C9CCC00C69CC600D7
        6B6B6BD7909CC600D76BB3909CC600C69CC600D7909CC60000D76B6B00006B6B
        6BB3909CC60000D76B6BB3909CC600CC9CC60000D7D7D700CC9CC60000D7D790
        9CC600CC9CC60000D7909CCC00D76B6B00006B6B6B6BB3909CCC00D76B6B6BB3
        909CCC00C69CCC000000BACC00CC9CCC000000D7909CCC00C69CCC0000D790C6
        0000D76B00006B6B6B6BB3909CC600D76B6B6BB3909CC600C69C9CC6CC00C69C
        CC00C69CC6CC0000C69CC600CC9C9CCC0000C69CCC00D76B00006B6B6B6BB390
        9CC60000D76B6BB3909CC600BA9C9C9C9CC69C9CC600BA909C9CC6C69C9CC600
        00BA9C9CC6C69C9CC60000D700006B6B6B6B6BB3909CCC00D7D7B3909C9C90D7
        B3909C9C909C9C9C9CB4B3B390909C9C9C9C90B4D7B390909C9C9C9C90B5D777
        00006B6B6B6B6BB3909CC600D700BA9C9C90B36BB3909090B390909090B36B6B
        B3B390909090B3B36B6BB3B390909091B3AD777700006B6B6B6B6BB3909CC600
        BAC69C9C90B36B6B6BB3B3B36BB3B3B3B36B6B6B6B6BB3B3B3B36B6B6B6B6B6B
        B3B3B3AD7DA1A1A1000077776B6B6B6BB3909CC69C9C9090B36B6B6B6B6B6B6B
        6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B77A1A1A1A1A10000669B
        77776B6BB3909C9C9090B3B36B6B6B6B6B2F2F2F2F2F2F2F2F6B6B6B6B6B6B6B
        6B6B6B6B6B6B77777777A1A166C5C5C5000066A1A1A1777753B39090B3B36B6B
        6B6B6B2F2F3535353535353535352F6B6B6B6B6B7777777777777777A1A1A1A1
        C566C5C50000C5C5C566A1A17D77ADAD7777777D595959595959595935353535
        353535356B6B7777777777777777A1A1A1A1C5C5C5666666000066C5C56666A1
        A1A1A1A1A1A17D7D7D7DA17DA17D7D7D5959353535353559597D7DA1A1A1A1A1
        A1A1A1A1A1C56666666666C50000C566C5666666A1A1A1A1A1A1A1A1A1A1A1A1
        A1A1A17D7D593535353559597D7DA1A1A1A1A1A1A1A1A1A1C5C5C5C5666666C5
        0000666666666666C5C5C5A1A1A1A1A1A1A1A1A1A1A1A1A17D7D59353535597D
        7DA1A1A1A1C5A1A1A1A1A1A1C5C5C566666666C50000C5C56666C5C566C5C5C5
        C5C5A1A1A1C5C5C5C5A1A1A1A17D59353535597D7DA1A1A1C5C5A1A1A1A1A1A1
        A1A1A1666666C5660000}
      PopupMenu = PopupMenu1
      Transparent = True
      OnMouseDown = ImageMouseDown
    end
  end
  object PanelImageSource1: TPanel
    Left = 53
    Top = 255
    Width = 58
    Height = 54
    BorderWidth = 2
    TabOrder = 8
    object ImageSource1: TImage
      Left = 3
      Top = 3
      Width = 52
      Height = 48
      Hint = 'Right click for clipboard operations'
      Align = alClient
      AutoSize = True
      Center = True
      Picture.Data = {
        07544269746D6170EE050000424DEE0500000000000076000000280000003200
        0000320000000100040000000000780500000000000000000000100000001000
        000000000000310000009C000000315D0000639C00009C6300009C9C0000CE9C
        00003CB27B00CDCE68009C00FF0099BADE000063FF0000E6FF0031CDFF00FFFF
        FF00F44444444446777777777667777772222222444444444A4AA4000000AAAA
        44444446777777777777777777222222444444433AA3AA0000004AA4AA444446
        7777777777777777772222224444443333AA3A000000444A4444444677777777
        7777777772222222444444AA33A3AA000000AAAAA44444667777777777777777
        2222222224444433AAAAA4000000AAAA4A444666777777222222222222222222
        244444A3AAAAA4000000AAA4A4446633666633322223332222000002244444AA
        AAAAAA00000044AAA44460FF0660FFF0223FFF0200FFFFF0044444433AAAAA00
        00004A4A44441ECFF01ECCF021ECCF00FDCCCCFFF044444AAAAA3A000000AA3A
        4A441EECFF0EECFF01EECF0ECEEEEECCF04444443AAA330000003334AA4441EE
        CF0EEECFF0EECF0EEECCCEECFB0444443AAAA30000003333444421EECFFCEEEC
        F0EECF0EECFFF0DCD044444433AA3A00000033AA4444221EECFCEEECFFCECF0E
        EECCFFFF004444443333AA00000033334442221EECFCEECECFCECF0EEEECCCCF
        FF06444AA33A33000000333344222221EECFCCFCCFCECF01EECFCCCCCFF02244
        4AA3AA0000003333442222221EECECFCECFCCF031EECFFFFCCF022444A33AA00
        00003333442222221EEEECFFDECECF031EEECCCCECF0224444A3A30000003334
        4222222221EEEECF0EEECFF021EEEEEEEE0222244443A3000000333442222222
        21EEEECF0EEEECF02211BBEEE122222A44A4A4000000334442222722221EEECF
        01EEECF02222333312222222244444000000444422277777221EEECF01EEECF1
        22222222222222222244440000004444222777777221EECF021EECF322777722
        2222222222244400000044422277777772221EE02221B8367777777222222222
        2222220000004422222777777722211222225577777777722222222222222200
        0000222222277777722222222277777777777722310002222222220000002222
        22227777722222222777777777777723FFFFF002222222000000222222222272
        22222222777777777777223BCCCCFFF022222200000022222222222222222222
        777777777722221EEEEECCFF0222220000002222220001332222223277777777
        3333020DCEEEEECF022222000000222200FFFFFF00222193777777739FFFF0FF
        F010DECFF022220000002220FDCCCCCFFF021DF93777763BCCCCFDCCF00FFCEC
        F02222000000221ECEEEEEECCFF0EECF322223EEEEEECEECF0ECCEECF0222200
        0000221EEEECEEEEECFFCECFF32221EEECEEEEECFDEEEEECFF02220000002221
        EECF011EEECFFCECF02221EECF011EECFCEECEEECF02220000002221EECF0221
        EEECFCECF02220EECF021EECFCECF0EECFF0220000002221EECFF0221EECFCEC
        FF000FCECFF00EECFCECFF0EECF02200000022221EECF02221EECFCECFFFDCFC
        ECFFF0EECFCECFF0ECFF0200000022221EECF02221EECFCEECCFCECFCECCFFCE
        CFCEECFFCECF0200000022221EECFF0221EECFDEEEECEECFDEEECCEECFFDEECC
        EECFF0000000222221EECF001EEEE01EEEEEEEED11EEEEEEED01EEEEEEED0400
        0000222221EECF0FDEEE121EEE1EEEE12211EEEE112211EEEE13440000002222
        21EECFDCEEE122211121111222221111222222111344440000004422221EECEE
        EE122222222222222222222222222222444444000000A444221EEEEE11222227
        77777772222222222222444444A333000000A4444461EE112222277777777777
        7222224444444444443A33000000333A44443344446666666677777777224444
        44444444333AAA000000A33AA444444444444444446677777664444444444443
        AAAAA30000003A3AAA4444444444444444467777664444444444443333AAA300
        0000AAAAAA333444444444444444677764444443444444333AAAA300000033AA
        33A33333444333344444677764444433444444444AAA3A000000}
      PopupMenu = PopupMenu1
      Transparent = True
      OnMouseDown = ImageMouseDown
    end
  end
  object PanelURL: TPanel
    Left = 10
    Top = 108
    Width = 350
    Height = 22
    Cursor = crHandPoint
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 4
    BorderStyle = bsSingle
    Caption = 'The Drag and Drop Component Suite for Delphi'
    Color = clWindow
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Shell Dlg 2'
    Font.Style = [fsUnderline]
    ParentFont = False
    TabOrder = 9
    OnMouseDown = URLMouseDown
  end
  object DropURLTarget1: TDropURLTarget
    DragTypes = [dtCopy, dtLink]
    GetDataOnEnter = True
    OnDrop = DropURLTarget1Drop
    Left = 184
    Top = 96
  end
  object DropURLSource1: TDropURLSource
    DragTypes = [dtCopy, dtLink]
    Images = ImageList1
    ImageIndex = 1
    ShowImage = True
    ImageHotSpotX = 50
    ImageHotSpotY = 30
    Left = 152
    Top = 96
  end
  object DropBMPSource1: TDropBMPSource
    DragTypes = [dtCopy, dtMove]
    OnPaste = DropBMPSource1Paste
    Images = ImageList1
    ShowImage = True
    ImageHotSpotX = 25
    ImageHotSpotY = 25
    Left = 176
    Top = 256
  end
  object DropBMPTarget1: TDropBMPTarget
    DragTypes = [dtCopy, dtMove]
    OnDrop = DropBMPTarget1Drop
    Target = PanelImageTarget
    Left = 304
    Top = 256
  end
  object ImageList1: TImageList
    BkColor = clFuchsia
    Height = 50
    Width = 50
    Left = 208
    Top = 256
  end
  object DropDummy1: TDropDummy
    DragTypes = []
    Left = 328
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 176
    Top = 288
    object MenuCopy: TMenuItem
      Caption = 'Copy'
      Enabled = False
      OnClick = MenuCutOrCopyClick
    end
    object MenuCut: TMenuItem
      Caption = 'Cut'
      Enabled = False
      OnClick = MenuCutOrCopyClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MenuPaste: TMenuItem
      Caption = 'Paste'
      Enabled = False
      OnClick = MenuPasteClick
    end
  end
end
