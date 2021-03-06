object fLanding: TfLanding
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'LANDING STATE'
  ClientHeight = 452
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 8
    Top = 8
    Width = 329
    Height = 438
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    object Edit7: TEdit
      Left = 5
      Top = 30
      Width = 275
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '  Ship power supply system state'
    end
    object Edit9: TEdit
      Left = 5
      Top = 80
      Width = 235
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '  OLS "Luna-3E"'
    end
    object Edit10: TEdit
      Left = 5
      Top = 105
      Width = 235
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '  RACS '
    end
    object Edit11: TEdit
      Left = 5
      Top = 130
      Width = 235
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = '  NS "Ilmen'#39'"'
    end
    object Edit12: TEdit
      Left = 5
      Top = 205
      Width = 275
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = '  TM-2322-2 (A9)      WSL'
    end
    object Edit13: TEdit
      Left = 5
      Top = 230
      Width = 275
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = '  TM-2322-2 (A10)   WSR'
    end
    object Edit14: TEdit
      Left = 5
      Top = 180
      Width = 275
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      Text = '  TM-2322-2 (A7)      WSP'
    end
    object Edit16: TEdit
      Left = 5
      Top = 405
      Width = 275
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Text = '  TM-2402-3  (A5)'
    end
    object Edit17: TEdit
      Left = 5
      Top = 255
      Width = 275
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      Text = '  TM-2408-1 (A8)      VRD'
    end
    object Edit19: TEdit
      Left = 5
      Top = 280
      Width = 275
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
      Text = '  TM-2220-1 (A1)      TVD1  (Left)'
    end
    object Edit18: TEdit
      Left = 5
      Top = 305
      Width = 275
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
      Text = '  TM-2220-1 (A2)      TVD2 (Axial1)'
    end
    object Edit20: TEdit
      Left = 5
      Top = 330
      Width = 275
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
      Text = '  TM-2220-1 (A3)      TVD3 (Axial2)'
    end
    object Edit21: TEdit
      Left = 5
      Top = 355
      Width = 275
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
      Text = '  TM-2220-1 (A4)      TVD4 (Right)'
    end
    object Edit22: TEdit
      Left = 5
      Top = 380
      Width = 275
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
      Text = '  TM-2320     (A11)    Printing device'
    end
    object e1: TMyPanel
      Left = 280
      Top = 30
      Width = 40
      Height = 25
      ColorFace = 6741282
      ColorGrad = 65314
      ColorLight = 1404727
      ColorDark = 1404727
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
      UseDockManager = True
    end
    object e3: TMyPanel
      Left = 280
      Top = 80
      Width = 40
      Height = 25
      ColorFace = 6741282
      ColorGrad = 65314
      ColorLight = 1404727
      ColorDark = 1404727
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGreen
      Caption = 'ch2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
      UseDockManager = True
    end
    object e5: TMyPanel
      Left = 280
      Top = 105
      Width = 40
      Height = 25
      ColorFace = clWhite
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      Caption = 'ch2'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMedGray
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
      UseDockManager = True
    end
    object e7: TMyPanel
      Left = 280
      Top = 130
      Width = 40
      Height = 25
      ColorFace = 6741282
      ColorGrad = 65314
      ColorLight = 1404727
      ColorDark = 1404727
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGreen
      Caption = 'ch2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 17
      UseDockManager = True
    end
    object e8: TMyPanel
      Left = 280
      Top = 180
      Width = 40
      Height = 25
      ColorFace = 6741282
      ColorGrad = 65314
      ColorLight = 1404727
      ColorDark = 1404727
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
      UseDockManager = True
    end
    object e9: TMyPanel
      Left = 280
      Top = 205
      Width = 40
      Height = 25
      ColorFace = 6741282
      ColorGrad = 65314
      ColorLight = 1404727
      ColorDark = 1404727
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 19
      UseDockManager = True
    end
    object e10: TMyPanel
      Left = 280
      Top = 230
      Width = 40
      Height = 25
      ColorFace = 6741282
      ColorGrad = 65314
      ColorLight = 1404727
      ColorDark = 1404727
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 20
      UseDockManager = True
    end
    object e11: TMyPanel
      Left = 280
      Top = 255
      Width = 40
      Height = 25
      ColorFace = 6741282
      ColorGrad = 65314
      ColorLight = 1404727
      ColorDark = 1404727
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 21
      UseDockManager = True
    end
    object e12: TMyPanel
      Left = 280
      Top = 280
      Width = 40
      Height = 25
      ColorFace = 6741282
      ColorGrad = 65314
      ColorLight = 1404727
      ColorDark = 1404727
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 22
      UseDockManager = True
    end
    object e13: TMyPanel
      Left = 280
      Top = 305
      Width = 40
      Height = 25
      ColorFace = 6741282
      ColorGrad = 65314
      ColorLight = 1404727
      ColorDark = 1404727
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 23
      UseDockManager = True
    end
    object e14: TMyPanel
      Left = 280
      Top = 330
      Width = 40
      Height = 25
      ColorFace = 6741282
      ColorGrad = 65314
      ColorLight = 1404727
      ColorDark = 1404727
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 24
      UseDockManager = True
    end
    object e15: TMyPanel
      Left = 280
      Top = 355
      Width = 40
      Height = 25
      ColorFace = 6741282
      ColorGrad = 65314
      ColorLight = 1404727
      ColorDark = 1404727
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 25
      UseDockManager = True
    end
    object e2: TMyPanel
      Left = 240
      Top = 80
      Width = 40
      Height = 25
      ColorFace = 6741282
      ColorGrad = 65314
      ColorLight = 1404727
      ColorDark = 1404727
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGreen
      Caption = 'ch1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 26
      UseDockManager = True
    end
    object e4: TMyPanel
      Left = 240
      Top = 105
      Width = 40
      Height = 25
      ColorFace = clWhite
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      Caption = 'ch1'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMedGray
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 27
      UseDockManager = True
    end
    object e6: TMyPanel
      Left = 240
      Top = 130
      Width = 40
      Height = 25
      ColorFace = 6741282
      ColorGrad = 65314
      ColorLight = 1404727
      ColorDark = 1404727
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGreen
      Caption = 'ch1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 28
      UseDockManager = True
    end
    object e16: TMyPanel
      Left = 280
      Top = 380
      Width = 40
      Height = 25
      ColorFace = 6741282
      ColorGrad = 65314
      ColorLight = 1404727
      ColorDark = 1404727
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 29
      UseDockManager = True
    end
    object e17: TMyPanel
      Left = 280
      Top = 405
      Width = 40
      Height = 25
      ColorFace = 6741282
      ColorGrad = 65314
      ColorLight = 1404727
      ColorDark = 1404727
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 30
      UseDockManager = True
    end
    object e0: TMyPanel
      Left = 280
      Top = 5
      Width = 40
      Height = 25
      ColorFace = 6741282
      ColorGrad = 65314
      ColorLight = 1404727
      ColorDark = 1404727
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGreen
      Caption = 'YES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 31
      UseDockManager = True
    end
    object Edit5: TEdit
      Left = 5
      Top = 5
      Width = 275
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 32
      Text = '  Data exchange'
    end
    object MyPanel1: TMyPanel
      Left = 5
      Top = 55
      Width = 315
      Height = 25
      ColorFace = clWhite
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      Caption = 'Channels of data exchange with ship system         '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 33
      UseDockManager = True
    end
    object MyPanel2: TMyPanel
      Left = 5
      Top = 155
      Width = 315
      Height = 25
      ColorFace = clWhite
      ColorGrad = 14344414
      ColorLight = 8224125
      ColorDark = 6447714
      ColorScheme = csDesert
      FillDirection = fdVertical
      DeviceState = dsGray
      Caption = 
        'Main devices state                                              ' +
        '              '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 34
      UseDockManager = True
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 16
    Top = 8
  end
end
