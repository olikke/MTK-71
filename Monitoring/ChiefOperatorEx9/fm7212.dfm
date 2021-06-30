object fModulator: TfModulator
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Modulator'
  ClientHeight = 522
  ClientWidth = 707
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Im: TImage
    Left = 0
    Top = 0
    Width = 707
    Height = 522
    Align = alClient
    ExplicitLeft = -7
    ExplicitTop = -8
  end
  object XiPanel2: TXiPanel
    Left = 371
    Top = 176
    Width = 329
    Height = 338
    ColorFace = clWhite
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csSilver
    FillDirection = fdVertical
    TabOrder = 0
    UseDockManager = True
    object RichEdit1: TRichEdit
      Left = 1
      Top = 1
      Width = 327
      Height = 336
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = []
      Lines.Strings = (
        'RichEdit1')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      WantTabs = True
    end
  end
  object p7212: TMyPanel
    Left = 200
    Top = 24
    Width = 165
    Height = 490
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = '       EM-7212-1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    UseDockManager = True
    object Label1: TLabel
      Left = 64
      Top = 258
      Width = 60
      Height = 19
      Caption = '(A28/A5)'
    end
    object x1: TMyPanel
      Left = 5
      Top = 3
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X1'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      UseDockManager = True
    end
    object X2: TMyPanel
      Left = 5
      Top = 38
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X2'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      UseDockManager = True
    end
    object x3: TMyPanel
      Left = 5
      Top = 73
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X3'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      UseDockManager = True
    end
    object x4: TMyPanel
      Left = 5
      Top = 108
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X4'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      UseDockManager = True
    end
    object x5: TMyPanel
      Left = 5
      Top = 143
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X5'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      UseDockManager = True
    end
    object x6: TMyPanel
      Left = 5
      Top = 178
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X6'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      UseDockManager = True
    end
    object x7: TMyPanel
      Left = 5
      Top = 213
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X7'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      UseDockManager = True
    end
    object x8: TMyPanel
      Left = 5
      Top = 248
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X8'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      UseDockManager = True
    end
    object x9: TMyPanel
      Left = 5
      Top = 283
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X9'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      UseDockManager = True
    end
    object x10: TMyPanel
      Left = 5
      Top = 319
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X10'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      UseDockManager = True
    end
    object x11: TMyPanel
      Left = 5
      Top = 354
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X11'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      UseDockManager = True
    end
    object x12: TMyPanel
      Left = 5
      Top = 389
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X12'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      UseDockManager = True
    end
    object x13: TMyPanel
      Left = 5
      Top = 424
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X13'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      UseDockManager = True
    end
    object x14: TMyPanel
      Left = 5
      Top = 459
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X14'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
      UseDockManager = True
    end
    object X15: TMyPanel
      Left = 125
      Top = 4
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X15'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
      UseDockManager = True
    end
    object X16: TMyPanel
      Left = 125
      Top = 39
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X16'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
      UseDockManager = True
    end
    object X17: TMyPanel
      Left = 125
      Top = 108
      Width = 33
      Height = 29
      ColorFace = 14344414
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      TextPosition = tpCenter
      Caption = 'X17'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
      UseDockManager = True
    end
  end
  object p1: TMyPanel
    Left = 8
    Top = 28
    Width = 149
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' NOT USE'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    UseDockManager = True
    OnClick = p1Click
  end
  object p2: TMyPanel
    Tag = 1
    Left = 8
    Top = 63
    Width = 149
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' NOT USE'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    UseDockManager = True
    OnClick = p1Click
  end
  object p3: TMyPanel
    Tag = 2
    Left = 8
    Top = 98
    Width = 149
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' NOT USE'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    UseDockManager = True
    OnClick = p1Click
  end
  object p4: TMyPanel
    Tag = 3
    Left = 8
    Top = 133
    Width = 149
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' NOT USE'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    UseDockManager = True
    OnClick = p1Click
  end
  object p5: TMyPanel
    Tag = 4
    Left = 8
    Top = 168
    Width = 149
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' NOT USE'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    UseDockManager = True
    OnClick = p1Click
  end
  object p6: TMyPanel
    Tag = 5
    Left = 8
    Top = 203
    Width = 149
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' NOT USE'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    UseDockManager = True
    OnClick = p1Click
  end
  object p7: TMyPanel
    Tag = 6
    Left = 8
    Top = 238
    Width = 149
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' NOT USE'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    UseDockManager = True
    OnClick = p1Click
  end
  object p8: TMyPanel
    Tag = 7
    Left = 8
    Top = 273
    Width = 149
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' NOT USE'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    UseDockManager = True
    OnClick = p1Click
  end
  object p9: TMyPanel
    Tag = 8
    Left = 8
    Top = 308
    Width = 149
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' NOT USE'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    UseDockManager = True
    OnClick = p1Click
  end
  object p10: TMyPanel
    Tag = 9
    Left = 8
    Top = 343
    Width = 149
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' NOT USE'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    UseDockManager = True
    OnClick = p1Click
  end
  object p11: TMyPanel
    Tag = 10
    Left = 8
    Top = 378
    Width = 149
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' NOT USE'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    UseDockManager = True
    OnClick = p1Click
  end
  object p12: TMyPanel
    Tag = 11
    Left = 8
    Top = 413
    Width = 149
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' NOT USE'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    UseDockManager = True
    OnClick = p1Click
  end
  object p13: TMyPanel
    Tag = 12
    Left = 8
    Top = 448
    Width = 149
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' NOT USE'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    UseDockManager = True
    OnClick = p1Click
  end
  object p14: TMyPanel
    Tag = 13
    Left = 8
    Top = 483
    Width = 149
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' NOT USE'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    UseDockManager = True
    OnClick = p1Click
  end
  object p15: TMyPanel
    Left = 400
    Top = 28
    Width = 299
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' TM-2409-1 (A28/A3)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    UseDockManager = True
    OnClick = p15Click
  end
  object p16: TMyPanel
    Left = 400
    Top = 63
    Width = 299
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' TM-2409-1 (A28/A4)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    UseDockManager = True
    OnClick = p16Click
  end
  object p17: TMyPanel
    Left = 400
    Top = 132
    Width = 299
    Height = 29
    ColorFace = 14344414
    ColorGrad = 14344414
    ColorLight = 8224125
    ColorDark = 6447714
    ColorScheme = csDesert
    FillDirection = fdVertical
    DeviceState = dsGray
    TextPosition = tpCenter
    Caption = ' EM-7302-1 (A28/A7)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
    UseDockManager = True
    OnClick = p17Click
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 8
  end
  object Timer2: TTimer
    Interval = 100
    OnTimer = Timer2Timer
    Left = 40
  end
end
