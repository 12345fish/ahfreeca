object frmEditor: TfrmEditor
  Left = 0
  Top = 0
  Width = 528
  Height = 243
  Align = alClient
  Color = clWhite
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  ExplicitWidth = 480
  object pnlTop: TrkVistaPanel
    Left = 0
    Top = 0
    Width = 528
    Height = 29
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BottomLine = False
    BottomColor = 12615680
    Color1 = clWhite
    Color2 = 15921906
    Color3 = 7091712
    Color4 = clWhite
    ColorFrame = clSilver
    Frames = [frBottom]
    ParentBackground = False
    Style = vgSimple
    ExplicitWidth = 451
    object btnSave: TrkGlassButton
      Left = 2
      Top = 0
      Width = 61
      Height = 24
      AltFocus = False
      AltRender = False
      Caption = 'Save'
      Color = clWhite
      ColorDown = clSilver
      ColorFocused = clWhite
      ColorFrame = clGray
      DropDownAlignment = paLeft
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glossy = True
      GlossyLevel = 37
      ImageIndex = 0
      Images = imglEditor
      LightHeight = 12
      ShadowStyle = ssNone
      TabOrder = 0
      TabStop = True
      TextAlign = taCenter
      OnClick = btnSaveClick
      SingleBorder = True
    end
    object btnOpen: TrkGlassButton
      Left = 69
      Top = 0
      Width = 61
      Height = 24
      AltFocus = False
      AltRender = False
      Caption = 'Open'
      Color = clWhite
      ColorDown = clSilver
      ColorFocused = clWhite
      ColorFrame = clGray
      DropDownAlignment = paLeft
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glossy = True
      GlossyLevel = 37
      ImageIndex = 1
      Images = imglEditor
      LightHeight = 12
      ShadowStyle = ssNone
      TabOrder = 1
      TabStop = True
      TextAlign = taCenter
      OnClick = btnOpenClick
      SingleBorder = True
    end
    object btnBold: TrkGlassButton
      Left = 156
      Top = 0
      Width = 29
      Height = 24
      AltFocus = False
      AltRender = False
      Caption = 'B'
      Color = clWhite
      ColorDown = clSilver
      ColorFocused = clWhite
      ColorFrame = clGray
      DropDownAlignment = paLeft
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      Glossy = True
      GlossyLevel = 37
      LightHeight = 12
      ShadowStyle = ssNone
      TabOrder = 2
      TabStop = True
      TextAlign = taCenter
      OnClick = btnBoldClick
      SingleBorder = True
    end
    object btnItalic: TrkGlassButton
      Left = 189
      Top = 0
      Width = 29
      Height = 24
      AltFocus = False
      AltRender = False
      Caption = 'I'
      Color = clWhite
      ColorDown = clSilver
      ColorFocused = clWhite
      ColorFrame = clGray
      DropDownAlignment = paLeft
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = 15
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      Glossy = True
      GlossyLevel = 37
      LightHeight = 12
      ShadowStyle = ssNone
      TabOrder = 3
      TabStop = True
      TextAlign = taCenter
      OnClick = btnItalicClick
      SingleBorder = True
    end
    object btnUnderline: TrkGlassButton
      Left = 221
      Top = 0
      Width = 29
      Height = 24
      AltFocus = False
      AltRender = False
      Caption = 'U'
      Color = clWhite
      ColorDown = clSilver
      ColorFocused = clWhite
      ColorFrame = clGray
      DropDownAlignment = paLeft
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = 15
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      Glossy = True
      GlossyLevel = 37
      LightHeight = 12
      ShadowStyle = ssNone
      TabOrder = 4
      TabStop = True
      TextAlign = taCenter
      OnClick = btnUnderlineClick
      SingleBorder = True
    end
  end
  object redtEditor: TRichEdit
    Left = 0
    Top = 29
    Width = 528
    Height = 214
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    OnChange = redtEditorChange
    OnKeyDown = redtEditorKeyDown
    OnSelectionChange = redtEditorSelectionChange
  end
  object dlgSave: TSaveDialog
    DefaultExt = '*.rtf'
    Filter = 
      'All supported formats|*.txt;*.rtf|Textfiles|*.txt|Rich-Text-Form' +
      'at Files|*.rtf'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 40
    Top = 40
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '*.rtf'
    Filter = 
      'All supported formats|*.txt;*.rtf|Textfiles|*.txt|Rich-Text-Form' +
      'at Files|*.rtf'
    Left = 104
    Top = 40
  end
  object imglEditor: TImageList
    ColorDepth = cd32Bit
    Masked = False
    Left = 172
    Top = 40
    Bitmap = {
      494C0101020008001C0010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000E0E0E0F141414171717171A1717
      171A1717171A1717171A1717171A1717171A1717171A1717171A1717171A1717
      171A1717171A1717171A141414170E0E0E0F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001A1A1A1E2525252E3E3E3E6E1515
      15E74040408A4040408A4040408A4040408A4040408A4040408A151515E71515
      15E7151515E7151515E7333333B71A1A1A1E05050506141414161717171A1717
      171A1717171A1717171A1717171A1717171A1717171A1717171A1717171A1717
      171A1717171A141414170E0E0E0F070707080000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003535354C1E1E1EDB3232
      32F7B9ABABFF414141FF414141FFB5A7A7FFB5A7A7FFB9ABABFF414141FF5353
      53FF505050FF666666FF1E1E1EDB000000003E55609130637EBD30637EBD3063
      7EBD30637EBD30637EBD30637EBD30637EBD30637EBD30637EBD30637EBD3063
      7EBD30637EBD3D5662981A1A1A1E0F0F0F100000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000272727CE646464FF3D3D
      3DFFBAB1B1FF3D3D3DFF3D3D3DFFB1A8A8FFB1A8A8FFBAB1B1FF3D3D3DFF5353
      53FF484848FF686868FF272727CE0000000036677FB068B7DAFF82CCEDFF82CC
      EDFF82CCEDFF82CCEDFF82CCEDFF82CCEDFF82CCEDFF82CCEDFF82CCEDFF82CC
      EDFF83CDEEFF48829DC930343640000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002A2A2AC9626262FF3939
      39FFC0BBBBFF252525FF252525FFB7B2B2FFB7B2B2FFC0BBBBFF393939FF5353
      53FF404040FF6A6A6AFF2A2A2AC9000000003A677FA254AACEFF80CBEBFF7CC9
      E9FF7CC9E9FF7CC9E9FF7CC9E9FF7CC9E9FF7CC9E9FF7CC9E9FF7CC9E9FF7CC9
      E9FF7CC9E9FF5E9FBBD93E515B6E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002C2C2CC5656565FF3535
      35FFC8C7C7FFC3C2C2FFC3C2C2FFC3C2C2FFC3C2C2FFC8C7C7FF353535FF5353
      53FF383838FF6D6D6DFF2C2C2CC5000000003C687D9D42A1CBFF8AD3EFFF83CD
      EBFF83CDEBFF83CDEBFF83CDEBFF83CDEBFF83CDEBFF83CDEBFF83CDEBFF83CD
      EBFF83CDEBFF80C4E0F23E627693000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002E2E2EC1696969FF3232
      32FF313131FF313131FF313131FF313131FF313131FF313131FF323232FF3232
      32FF323232FF717171FF2E2E2EC1000000003C677C9950B0D7FF85D2ECFF89D2
      EEFF89D2EEFF89D2EEFF89D2EEFF89D2EEFF89D2EEFF89D2EEFF89D2EEFF89D2
      EEFF89D2EEFF90D8F1FF47778EAA191B1B1D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303030BE6C6C6CFF6363
      63FF636363FF636363FF636363FF636363FF636363FF636363FF636363FF6363
      63FF636363FF6C6C6CFF303030BE000000003D677B9572CAE8FF72CAE8FF90D8
      F2FF8FD7F1FF8FD7F1FF8FD7F1FF8FD7F1FF8FD7F1FF8FD7F1FF8FD7F1FF8FD7
      F1FF8FD7F1FF91D8F2FF5A94ACC2323C40460000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000313131BB707070FFD4D4
      C9FFF4F4E4FFF4F4E4FFF4F4E4FFF4F4E4FFF4F4E4FFF4F4E4FFF4F4E4FFF4F4
      E4FFD4D4C9FF707070FF313131BB000000003E667B928FDDF4FF61C0E5FFA8EE
      FAFFA8EEFAFFA8EEFAFFA8EEFAFFA8EEFAFFA8EEFAFFA8EEFAFFA8EEFAFFA8EE
      FAFFA8EEFAFFA8EEFAFF82C0D1DE3F5865710000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000333333B8737373FFF6F6
      E9FFECECDFFFECECDFFFECECDFFFECECDFFFECECDFFFECECDFFFECECDFFFECEC
      DFFFF6F6E9FF737373FF333333B8000000003E66798EA7ECFCFF62C2E9FF4DB5
      E2FF4BB4E2FF4AB3E1FF49B2E0FF47B1DFFF46B0DFFF45AEDEFF43ADDDFF42AC
      DDFF44AEDFFF2B7CA4C73F6273813C4F59610000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000343434B5777777FFF8F8
      EFFFF1F1E7FFF1F1E7FFF1F1E7FFF1F1E7FFF1F1E7FFF1F1E7FFF1F1E7FFF1F1
      E7FFF8F8EFFF777777FF343434B5000000003E65788BABF0FEFFA4E9FCFFA2E7
      FBFF9FE5FAFF9CE3F8FF9AE1F7FF97DEF6FF94DCF4FF91D9F3FF8ED7F1FF8BD4
      F0FF90D8F3FF3E65788B00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000353535B27A7A7AFFFBFB
      F5FFF6F6F0FFF6F6F0FFF6F6F0FFF6F6F0FFF6F6F0FFF6F6F0FFF6F6F0FFF6F6
      F0FFFBFBF5FF7A7A7AFF353535B2000000003F647788ADF1FFFFA6EBFDFFA4E9
      FCFFA2E7FBFF9FE5FAFF9CE3F8FF9AE1F7FF97DEF6FF94DCF4FF91D9F3FF8ED7
      F1FF93DAF4FF3F64778800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000363636B07C7C7CFFFEFE
      FBFFFBFBF8FFFBFBF8FFFBFBF8FFFBFBF8FFFBFBF8FFFBFBF8FFFBFBF8FFFBFB
      F8FFFEFEFBFF7C7C7CFF363636B0000000003F637585B0F4FFFFADF1FFFFABF0
      FEFFA9EEFDFFA7ECFCFFA5EAFBFFA2E8FAFFA0E6F9FF9DE3F8FF9AE1F7FF98DF
      F6FF99E0F7FF3F63758500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000373737AE848484FFFFFF
      FFFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFF
      FEFFFFFFFFFF848484FF373737AE000000003C505A633F6374833F6374833F63
      74833F6374833F6374833F637483FEFEFDFFF5F5EEFFEBEBDDFFFEC93FFFF4B6
      2CFF3F6374833C505A6300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F3F3F81373737AC5151
      4A6651514A6651514A6651514A6651514A6651514A6651514A6651514A665151
      4A6651514A66373737AC3F3F3F81000000000000000000000000000000000000
      00000000000000000000252A2C2E3F6273813F6273813F6273813F6273813F62
      7381252A2C2E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF000000FFFF000000000000000000000000
      8001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000000000000000000000000000000000000000
      000000000000}
  end
end
