object RACS: TRACS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'RACS'
  ClientHeight = 292
  ClientWidth = 532
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 532
    Height = 292
    Align = alClient
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Edit2: TEdit
      Left = 10
      Top = 10
      Width = 300
      Height = 22
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = ' Parameters'
    end
    object n1: TEdit
      Left = 10
      Top = 35
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 1
      Text = ' Data Exchange'
    end
    object n2: TEdit
      Left = 10
      Top = 60
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 2
      Text = ' Tracking sign'
    end
    object n3: TEdit
      Left = 10
      Top = 85
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 3
      Text = ' Landing point type'
    end
    object n4: TEdit
      Left = 10
      Top = 110
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 4
      Text = ' SAC No'
    end
    object n5: TEdit
      Left = 10
      Top = 135
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 5
      Text = ' Distance'
    end
    object n6: TEdit
      Left = 10
      Top = 160
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 6
      Text = ' Course angle [degrees]'
    end
    object n7: TEdit
      Left = 10
      Top = 185
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 7
      Text = ' Angle of altitude [degrees]'
    end
    object n8: TEdit
      Left = 10
      Top = 210
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 8
      Text = ' SAC speed'
    end
    object n9: TEdit
      Left = 10
      Top = 235
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 9
      Text = ' SAC vertical speed'
    end
    object n10: TEdit
      Left = 10
      Top = 260
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 10
      Text = ' Glidepath angle'
    end
    object Edit12: TEdit
      Left = 315
      Top = 10
      Width = 100
      Height = 22
      Color = clMedGray
      ReadOnly = True
      TabOrder = 11
      Text = ' Channel 1'
    end
    object e1: TEdit
      Left = 315
      Top = 35
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 12
    end
    object e2: TEdit
      Left = 315
      Top = 60
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 13
    end
    object e3: TEdit
      Left = 315
      Top = 85
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 14
    end
    object e4: TEdit
      Left = 315
      Top = 110
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 15
    end
    object e5: TEdit
      Left = 315
      Top = 135
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 16
    end
    object e6: TEdit
      Left = 315
      Top = 160
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 17
    end
    object e7: TEdit
      Left = 315
      Top = 185
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 18
    end
    object e8: TEdit
      Left = 315
      Top = 210
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 19
    end
    object e9: TEdit
      Left = 315
      Top = 235
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 20
    end
    object e10: TEdit
      Left = 314
      Top = 260
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 21
    end
    object Edit13: TEdit
      Left = 420
      Top = 10
      Width = 100
      Height = 22
      Color = clMedGray
      ReadOnly = True
      TabOrder = 22
      Text = ' Channel 1'
    end
    object f1: TEdit
      Left = 420
      Top = 35
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 23
    end
    object f2: TEdit
      Left = 420
      Top = 60
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 24
    end
    object f3: TEdit
      Left = 420
      Top = 85
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 25
    end
    object f4: TEdit
      Left = 420
      Top = 110
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 26
    end
    object f5: TEdit
      Left = 420
      Top = 135
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 27
    end
    object f6: TEdit
      Left = 420
      Top = 160
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 28
    end
    object f7: TEdit
      Left = 420
      Top = 185
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 29
    end
    object f8: TEdit
      Left = 420
      Top = 210
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 30
    end
    object f9: TEdit
      Left = 420
      Top = 235
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 31
    end
    object f10: TEdit
      Left = 420
      Top = 260
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 32
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 32
    Top = 16
  end
end
