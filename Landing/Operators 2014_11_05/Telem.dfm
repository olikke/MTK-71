object Telemetric: TTelemetric
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'NS " Ilmen-71 "'
  ClientHeight = 1009
  ClientWidth = 924
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
    Width = 925
    Height = 1009
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Edit2: TEdit
      Left = 10
      Top = 30
      Width = 482
      Height = 22
      Color = clMedGray
      ReadOnly = True
      TabOrder = 0
      Text = '            Parameters'
    end
    object Edit3: TEdit
      Left = 10
      Top = 55
      Width = 482
      Height = 22
      ReadOnly = True
      TabOrder = 1
      Text = '            Data Exchange'
    end
    object Edit9: TEdit
      Left = 37
      Top = 80
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 2
      Text = 
        ' Geographical coordinates on Krasovsky ellipsoid (CK-42) [degree' +
        's]'
    end
    object pp: TPanel
      Left = 10
      Top = 80
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 3
      object i1: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Edit4: TEdit
      Left = 37
      Top = 105
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 4
      Text = 
        ' Geographical coordinates on Krasovsky ellipsoid (CK-42) [degree' +
        's]'
    end
    object Edit5: TEdit
      Left = 37
      Top = 130
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 5
      Text = ' North components of ship speed relatively sea bed [m/s]'
    end
    object Edit6: TEdit
      Left = 37
      Top = 155
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 6
      Text = ' East components of ship speed relatively sea bed [m/s]'
    end
    object Edit7: TEdit
      Left = 37
      Top = 180
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 7
      Text = ' Speed from log [m/s]'
    end
    object Edit8: TEdit
      Left = 37
      Top = 205
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 8
      Text = ' Course [degrees]'
    end
    object Edit10: TEdit
      Left = 37
      Top = 230
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 9
      Text = ' Angular rates of course variation [degrees/s]'
    end
    object Edit11: TEdit
      Left = 37
      Top = 255
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 10
      Text = 
        ' Pitch angle (positive angle corresponds to ship trim to aft) [d' +
        'egrees]'
    end
    object Edit12: TEdit
      Left = 37
      Top = 280
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 11
      Text = ' Angular rates of pitch variation [degrees/s]'
    end
    object Edit13: TEdit
      Left = 37
      Top = 305
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 12
      Text = 
        ' Roll angle (positive angle corresponds to ship heel STB) [degre' +
        'es]'
    end
    object Edit14: TEdit
      Left = 37
      Top = 330
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 13
      Text = ' Angular rates of roll variation [degrees/s]'
    end
    object Edit15: TEdit
      Left = 37
      Top = 355
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 14
      Text = 
        ' North components ship linear speed in geographical system coord' +
        'inates'
    end
    object Edit16: TEdit
      Left = 37
      Top = 380
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 15
      Text = 
        ' East components ship linear speed in geographical system coordi' +
        'nates'
    end
    object Edit17: TEdit
      Left = 37
      Top = 405
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 16
      Text = 
        ' Vertical components ship linear speed in geographical system co' +
        'ordinates'
    end
    object Edit18: TEdit
      Left = 37
      Top = 430
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 17
      Text = ' North ship movement due to rolling and orbital movement [m]'
    end
    object Edit19: TEdit
      Left = 37
      Top = 455
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 18
      Text = ' East ship movement due to rolling and orbital movement [m]'
    end
    object Edit20: TEdit
      Left = 37
      Top = 480
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 19
      Text = ' Vertical ship movement due to rolling and orbital movement [m]'
    end
    object Edit21: TEdit
      Left = 37
      Top = 505
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 20
      Text = ' Total angle of ship deck inclination [degrees]'
    end
    object Edit22: TEdit
      Left = 37
      Top = 530
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 21
      Text = ' Current Greenwich time'
    end
    object Edit30: TEdit
      Left = 37
      Top = 555
      Width = 455
      Height = 22
      ReadOnly = True
      TabOrder = 22
      Text = ' Date (Year, month, date)'
    end
    object Panel41: TPanel
      Left = 10
      Top = 105
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 23
      object i2: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel42: TPanel
      Left = 10
      Top = 130
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 24
      object i3: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel43: TPanel
      Left = 10
      Top = 155
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 25
      object i4: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel44: TPanel
      Left = 10
      Top = 180
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 26
      object i5: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel45: TPanel
      Left = 10
      Top = 205
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 27
      object i6: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel46: TPanel
      Left = 10
      Top = 230
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 28
      object i7: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel47: TPanel
      Left = 10
      Top = 255
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 29
      object i8: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel48: TPanel
      Left = 10
      Top = 280
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 30
      object i9: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel49: TPanel
      Left = 10
      Top = 305
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 31
      object i10: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel50: TPanel
      Left = 10
      Top = 330
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 32
      object i11: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel51: TPanel
      Left = 10
      Top = 355
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 33
      object i12: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel58: TPanel
      Left = 10
      Top = 380
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 34
      object i13: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel59: TPanel
      Left = 10
      Top = 405
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 35
      object i14: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel60: TPanel
      Left = 10
      Top = 430
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 36
      object i15: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel61: TPanel
      Left = 10
      Top = 455
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 37
      object i16: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel62: TPanel
      Left = 10
      Top = 480
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 38
      object i17: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel63: TPanel
      Left = 10
      Top = 505
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 39
      object i18: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel64: TPanel
      Left = 10
      Top = 530
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 40
      object i19: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object Panel65: TPanel
      Left = 10
      Top = 555
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 41
      object i20: TImage
        Left = 0
        Top = -7
        Width = 25
        Height = 25
      end
    end
    object e0: TEdit
      Left = 495
      Top = 55
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 42
    end
    object e1: TEdit
      Left = 495
      Top = 80
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 43
    end
    object e2: TEdit
      Left = 495
      Top = 105
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 44
    end
    object e3: TEdit
      Left = 495
      Top = 130
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 45
    end
    object e4: TEdit
      Left = 495
      Top = 155
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 46
    end
    object e5: TEdit
      Left = 495
      Top = 180
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 47
    end
    object e6: TEdit
      Left = 495
      Top = 205
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 48
    end
    object e7: TEdit
      Left = 495
      Top = 230
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 49
    end
    object e8: TEdit
      Left = 495
      Top = 255
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 50
    end
    object e9: TEdit
      Left = 495
      Top = 280
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 51
    end
    object e10: TEdit
      Left = 495
      Top = 305
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 52
    end
    object e11: TEdit
      Left = 495
      Top = 330
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 53
    end
    object e12: TEdit
      Left = 495
      Top = 355
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 54
    end
    object e13: TEdit
      Left = 495
      Top = 380
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 55
    end
    object e14: TEdit
      Left = 495
      Top = 405
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 56
    end
    object e15: TEdit
      Left = 495
      Top = 430
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 57
    end
    object e16: TEdit
      Left = 495
      Top = 455
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 58
    end
    object e17: TEdit
      Left = 495
      Top = 480
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 59
    end
    object e18: TEdit
      Left = 495
      Top = 505
      Width = 65
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 60
    end
    object e19: TEdit
      Left = 495
      Top = 530
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 61
    end
    object e20: TEdit
      Left = 495
      Top = 555
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 62
    end
    object d0: TEdit
      Left = 565
      Top = 55
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 63
    end
    object d1: TEdit
      Left = 565
      Top = 80
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 64
    end
    object d2: TEdit
      Left = 565
      Top = 105
      Width = 65
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 65
    end
    object d3: TEdit
      Left = 565
      Top = 130
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 66
    end
    object d4: TEdit
      Left = 565
      Top = 155
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 67
    end
    object d5: TEdit
      Left = 565
      Top = 180
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 68
    end
    object d6: TEdit
      Left = 565
      Top = 205
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 69
    end
    object d7: TEdit
      Left = 565
      Top = 230
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 70
    end
    object d8: TEdit
      Left = 565
      Top = 255
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 71
    end
    object d9: TEdit
      Left = 565
      Top = 280
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 72
    end
    object d10: TEdit
      Left = 565
      Top = 305
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 73
    end
    object d11: TEdit
      Left = 565
      Top = 330
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 74
    end
    object d12: TEdit
      Left = 565
      Top = 355
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 75
    end
    object d13: TEdit
      Left = 565
      Top = 380
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 76
    end
    object d14: TEdit
      Left = 565
      Top = 405
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 77
    end
    object d15: TEdit
      Left = 565
      Top = 430
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 78
    end
    object d16: TEdit
      Left = 565
      Top = 455
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 79
    end
    object d17: TEdit
      Left = 565
      Top = 480
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 80
    end
    object d18: TEdit
      Left = 565
      Top = 505
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 81
    end
    object d19: TEdit
      Left = 565
      Top = 530
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 82
    end
    object d20: TEdit
      Left = 565
      Top = 555
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 83
    end
    object f0: TEdit
      Left = 635
      Top = 55
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 84
    end
    object f1: TEdit
      Left = 635
      Top = 80
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 85
    end
    object f2: TEdit
      Left = 635
      Top = 105
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 86
    end
    object f3: TEdit
      Left = 635
      Top = 130
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 87
    end
    object f4: TEdit
      Left = 635
      Top = 155
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 88
    end
    object f5: TEdit
      Left = 635
      Top = 180
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 89
    end
    object f6: TEdit
      Left = 635
      Top = 205
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 90
    end
    object f7: TEdit
      Left = 635
      Top = 230
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 91
    end
    object f8: TEdit
      Left = 635
      Top = 255
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 92
    end
    object f9: TEdit
      Left = 635
      Top = 280
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 93
    end
    object f10: TEdit
      Left = 635
      Top = 305
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 94
    end
    object f11: TEdit
      Left = 635
      Top = 330
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 95
    end
    object f12: TEdit
      Left = 635
      Top = 355
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 96
    end
    object f13: TEdit
      Left = 635
      Top = 380
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 97
    end
    object f14: TEdit
      Left = 635
      Top = 405
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 98
    end
    object f15: TEdit
      Left = 635
      Top = 430
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 99
    end
    object f16: TEdit
      Left = 635
      Top = 455
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 100
    end
    object f17: TEdit
      Left = 635
      Top = 480
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 101
    end
    object f18: TEdit
      Left = 636
      Top = 505
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 102
    end
    object f19: TEdit
      Left = 635
      Top = 530
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 103
    end
    object t0: TEdit
      Left = 705
      Top = 55
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 104
    end
    object t1: TEdit
      Left = 705
      Top = 80
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 105
    end
    object t2: TEdit
      Left = 705
      Top = 105
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 106
    end
    object t3: TEdit
      Left = 705
      Top = 130
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 107
    end
    object t4: TEdit
      Left = 705
      Top = 155
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 108
    end
    object t5: TEdit
      Left = 705
      Top = 180
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 109
    end
    object t6: TEdit
      Left = 705
      Top = 205
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 110
    end
    object t7: TEdit
      Left = 705
      Top = 230
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 111
    end
    object t8: TEdit
      Left = 705
      Top = 255
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 112
    end
    object t9: TEdit
      Left = 705
      Top = 280
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 113
    end
    object t10: TEdit
      Left = 705
      Top = 305
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 114
    end
    object t11: TEdit
      Left = 705
      Top = 330
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 115
    end
    object t12: TEdit
      Left = 705
      Top = 355
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 116
    end
    object t13: TEdit
      Left = 705
      Top = 380
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 117
    end
    object t14: TEdit
      Left = 705
      Top = 405
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 118
    end
    object t15: TEdit
      Left = 705
      Top = 430
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 119
    end
    object t16: TEdit
      Left = 705
      Top = 455
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 120
    end
    object t17: TEdit
      Left = 705
      Top = 480
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 121
    end
    object t18: TEdit
      Left = 705
      Top = 505
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 122
    end
    object t19: TEdit
      Left = 705
      Top = 530
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 123
    end
    object w0: TEdit
      Left = 775
      Top = 55
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 124
    end
    object w1: TEdit
      Left = 775
      Top = 80
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 125
    end
    object w2: TEdit
      Left = 775
      Top = 105
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 126
    end
    object w3: TEdit
      Left = 775
      Top = 130
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 127
    end
    object w4: TEdit
      Left = 775
      Top = 155
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 128
    end
    object w5: TEdit
      Left = 775
      Top = 180
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 129
    end
    object w6: TEdit
      Left = 775
      Top = 205
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 130
    end
    object w7: TEdit
      Left = 775
      Top = 230
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 131
    end
    object w8: TEdit
      Left = 776
      Top = 255
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 132
    end
    object w9: TEdit
      Left = 775
      Top = 280
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 133
    end
    object w10: TEdit
      Left = 775
      Top = 305
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 134
    end
    object w11: TEdit
      Left = 775
      Top = 330
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 135
    end
    object w12: TEdit
      Left = 775
      Top = 355
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 136
    end
    object w13: TEdit
      Left = 775
      Top = 380
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 137
    end
    object w14: TEdit
      Left = 775
      Top = 405
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 138
    end
    object w15: TEdit
      Left = 775
      Top = 430
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 139
    end
    object w16: TEdit
      Left = 775
      Top = 455
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 140
    end
    object w17: TEdit
      Left = 775
      Top = 480
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 141
    end
    object w18: TEdit
      Left = 775
      Top = 505
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 142
    end
    object w19: TEdit
      Left = 775
      Top = 530
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 143
    end
    object k0: TEdit
      Left = 845
      Top = 55
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 144
    end
    object k1: TEdit
      Left = 845
      Top = 80
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 145
    end
    object k2: TEdit
      Left = 845
      Top = 105
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 146
    end
    object k3: TEdit
      Left = 845
      Top = 130
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 147
    end
    object k4: TEdit
      Left = 845
      Top = 155
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 148
    end
    object k5: TEdit
      Left = 845
      Top = 180
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 149
    end
    object k6: TEdit
      Left = 845
      Top = 205
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 150
    end
    object k7: TEdit
      Left = 845
      Top = 230
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 151
    end
    object k8: TEdit
      Left = 845
      Top = 255
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 152
    end
    object k9: TEdit
      Left = 845
      Top = 280
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 153
    end
    object k10: TEdit
      Left = 845
      Top = 305
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 154
    end
    object k11: TEdit
      Left = 845
      Top = 330
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 155
    end
    object k12: TEdit
      Left = 845
      Top = 355
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 156
    end
    object k13: TEdit
      Left = 845
      Top = 380
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 157
    end
    object k14: TEdit
      Left = 845
      Top = 405
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 158
    end
    object k15: TEdit
      Left = 845
      Top = 430
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 159
    end
    object k16: TEdit
      Left = 845
      Top = 455
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 160
    end
    object k17: TEdit
      Left = 845
      Top = 480
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 161
    end
    object k18: TEdit
      Left = 845
      Top = 505
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 162
    end
    object k19: TEdit
      Left = 845
      Top = 530
      Width = 65
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 163
    end
    object Edit31: TEdit
      Left = 495
      Top = 30
      Width = 65
      Height = 22
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 164
      Text = '  Central '
    end
    object Edit36: TEdit
      Left = 705
      Top = 30
      Width = 65
      Height = 22
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 165
      Text = '  Central '
    end
    object Edit61: TEdit
      Left = 565
      Top = 30
      Width = 65
      Height = 22
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 166
      Text = '     Fore'
    end
    object Edit62: TEdit
      Left = 775
      Top = 30
      Width = 65
      Height = 22
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 167
      Text = '    Fore'
    end
    object Edit63: TEdit
      Left = 635
      Top = 30
      Width = 65
      Height = 22
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 168
      Text = '       Aft'
    end
    object Edit64: TEdit
      Left = 845
      Top = 30
      Width = 65
      Height = 22
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 169
      Text = '       Aft'
    end
    object Edit65: TEdit
      Left = 495
      Top = 5
      Width = 204
      Height = 22
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 170
      Text = '                         Channel 1'
    end
    object Edit66: TEdit
      Left = 705
      Top = 5
      Width = 204
      Height = 22
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 171
      Text = '                         Channel 2'
    end
    object f20: TEdit
      Left = 635
      Top = 555
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 172
    end
    object t20: TEdit
      Left = 705
      Top = 555
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 173
    end
    object w20: TEdit
      Left = 775
      Top = 555
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 174
    end
    object k20: TEdit
      Left = 845
      Top = 555
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 175
    end
    object Edit71: TEdit
      Left = 10
      Top = 580
      Width = 903
      Height = 22
      Color = clMedGray
      ReadOnly = True
      TabOrder = 176
      Text = 
        '            Sign of data validity  (To find out the state of par' +
        'ameter set  "mouse" cursor on it)'
    end
    object Edit72: TEdit
      Left = 10
      Top = 605
      Width = 481
      Height = 22
      ReadOnly = True
      TabOrder = 177
      Text = ' Navigation system operation mode'
    end
    object Edit73: TEdit
      Left = 10
      Top = 630
      Width = 423
      Height = 22
      ReadOnly = True
      TabOrder = 178
      Text = ' Validity of processes coordinates'
    end
    object Edit74: TEdit
      Left = 10
      Top = 655
      Width = 423
      Height = 22
      ReadOnly = True
      TabOrder = 179
      Text = ' Validity of absolute speed components'
    end
    object Edit75: TEdit
      Left = 10
      Top = 680
      Width = 452
      Height = 22
      ReadOnly = True
      TabOrder = 180
      Text = ' Validity of speed from log'
    end
    object Edit76: TEdit
      Left = 10
      Top = 755
      Width = 481
      Height = 22
      ReadOnly = True
      TabOrder = 181
      Text = ' Validity of stabilization parameters'
    end
    object Edit77: TEdit
      Left = 10
      Top = 705
      Width = 452
      Height = 22
      ReadOnly = True
      TabOrder = 182
      Text = ' Source of course  information'
    end
    object Edit78: TEdit
      Left = 10
      Top = 730
      Width = 452
      Height = 22
      ReadOnly = True
      TabOrder = 183
      Text = ' Validity of course'
    end
    object Panel67: TPanel
      Left = 437
      Top = 630
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 184
      object p1: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel68: TPanel
      Left = 467
      Top = 655
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 185
      object p4: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel69: TPanel
      Left = 437
      Top = 655
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 186
      object p3: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel70: TPanel
      Left = 467
      Top = 680
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 187
      object p5: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel71: TPanel
      Left = 467
      Top = 705
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 188
      object p6: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel72: TPanel
      Left = 467
      Top = 730
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 189
      object p66: TImage
        Left = 5
        Top = -22
        Width = 17
        Height = 25
      end
    end
    object Panel73: TPanel
      Left = 10
      Top = 780
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 190
      object p7: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel74: TPanel
      Left = 41
      Top = 780
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 191
      object p8: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel75: TPanel
      Left = 72
      Top = 780
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 192
      object p9: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel76: TPanel
      Left = 103
      Top = 780
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 193
      object p10: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel77: TPanel
      Left = 134
      Top = 780
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 194
      object p11: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel78: TPanel
      Left = 165
      Top = 780
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 195
      object p12: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel79: TPanel
      Left = 196
      Top = 780
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 196
      object p13: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel80: TPanel
      Left = 227
      Top = 780
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 197
      object p14: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel81: TPanel
      Left = 258
      Top = 780
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 198
      object p15: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel82: TPanel
      Left = 289
      Top = 780
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 199
      object p16: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel83: TPanel
      Left = 320
      Top = 780
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 200
      object p17: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel84: TPanel
      Left = 351
      Top = 780
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 201
      object p18: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel66: TPanel
      Left = 467
      Top = 630
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 202
      object p2: TImage
        Left = 9
        Top = -6
        Width = 17
        Height = 25
      end
    end
    object esw1: TEdit
      Left = 495
      Top = 605
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 203
      Text = '     SW1'
    end
    object esw2: TEdit
      Left = 495
      Top = 630
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 204
      Text = '     SW2'
    end
    object esw3: TEdit
      Left = 495
      Top = 655
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 205
      Text = '     SW3'
    end
    object esw4: TEdit
      Left = 495
      Top = 680
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 206
      Text = '     SW4'
    end
    object esw6: TEdit
      Left = 495
      Top = 705
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 207
      Text = '     SW6'
    end
    object esw5: TEdit
      Left = 495
      Top = 755
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 208
      Text = '     SW5'
    end
    object esw7: TEdit
      Left = 495
      Top = 730
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 209
      Text = '     SW7'
    end
    object dsw1: TEdit
      Left = 565
      Top = 605
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 210
      Text = '     SW1'
    end
    object dsw2: TEdit
      Left = 565
      Top = 630
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 211
      Text = '     SW2'
    end
    object dsw3: TEdit
      Left = 565
      Top = 655
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 212
      Text = '     SW3'
    end
    object dsw4: TEdit
      Left = 565
      Top = 680
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 213
      Text = '     SW4'
    end
    object dsw6: TEdit
      Left = 565
      Top = 705
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 214
      Text = '     SW6'
    end
    object dsw7: TEdit
      Left = 565
      Top = 730
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 215
      Text = '     SW7'
    end
    object dsw5: TEdit
      Left = 565
      Top = 755
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 216
      Text = '     SW5'
    end
    object fsw1: TEdit
      Left = 635
      Top = 605
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 217
      Text = '     SW1'
    end
    object fsw2: TEdit
      Left = 635
      Top = 630
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 218
      Text = '     SW2'
    end
    object fsw3: TEdit
      Left = 635
      Top = 655
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 219
      Text = '     SW3'
    end
    object fsw4: TEdit
      Left = 635
      Top = 680
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 220
      Text = '     SW4'
    end
    object fsw6: TEdit
      Left = 634
      Top = 705
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 221
      Text = '     SW6'
    end
    object fsw7: TEdit
      Left = 635
      Top = 730
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 222
      Text = '     SW7'
    end
    object fsw5: TEdit
      Left = 635
      Top = 755
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 223
      Text = '     SW5'
    end
    object tsw1: TEdit
      Left = 705
      Top = 605
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 224
      Text = '     SW1'
    end
    object tsw2: TEdit
      Left = 705
      Top = 630
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 225
      Text = '     SW2'
    end
    object tsw3: TEdit
      Left = 705
      Top = 655
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 226
      Text = '     SW3'
    end
    object tsw4: TEdit
      Left = 705
      Top = 680
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 227
      Text = '     SW4'
    end
    object tsw6: TEdit
      Left = 705
      Top = 705
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 228
      Text = '     SW6'
    end
    object tsw7: TEdit
      Left = 705
      Top = 730
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 229
      Text = '     SW7'
    end
    object tsw5: TEdit
      Left = 705
      Top = 755
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 230
      Text = '     SW5'
    end
    object wsw1: TEdit
      Left = 775
      Top = 605
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 231
      Text = '     SW1'
    end
    object wsw2: TEdit
      Left = 775
      Top = 630
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 232
      Text = '     SW2'
    end
    object wsw3: TEdit
      Left = 775
      Top = 655
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 233
      Text = '     SW3'
    end
    object wsw4: TEdit
      Left = 775
      Top = 680
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 234
      Text = '     SW4'
    end
    object wsw6: TEdit
      Left = 775
      Top = 705
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 235
      Text = '     SW6'
    end
    object wsw7: TEdit
      Left = 775
      Top = 730
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 236
      Text = '     SW7'
    end
    object wsw5: TEdit
      Left = 775
      Top = 755
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 237
      Text = '     SW5'
    end
    object ksw1: TEdit
      Left = 845
      Top = 605
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 238
      Text = '     SW1'
    end
    object ksw2: TEdit
      Left = 845
      Top = 630
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 239
      Text = '     SW2'
    end
    object ksw3: TEdit
      Left = 845
      Top = 655
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 240
      Text = '     SW3'
    end
    object ksw4: TEdit
      Left = 845
      Top = 680
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 241
      Text = '     SW4'
    end
    object ksw6: TEdit
      Left = 845
      Top = 705
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 242
      Text = '     SW6'
    end
    object ksw7: TEdit
      Left = 845
      Top = 730
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 243
      Text = '     SW7'
    end
    object ksw5: TEdit
      Left = 845
      Top = 755
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 244
      Text = '     SW5'
    end
    object Edit1: TEdit
      Left = 10
      Top = 805
      Width = 903
      Height = 22
      Color = clMedGray
      ReadOnly = True
      TabOrder = 245
      Text = '            Average data (accumulation time = 6 min)'
    end
    object Edit23: TEdit
      Left = 10
      Top = 830
      Width = 452
      Height = 22
      ReadOnly = True
      TabOrder = 246
      Text = '  Pitch angle  [degrees]'
    end
    object Edit24: TEdit
      Left = 10
      Top = 855
      Width = 452
      Height = 22
      ReadOnly = True
      TabOrder = 247
      Text = '  Roll angle   [degrees]'
    end
    object Edit25: TEdit
      Left = 10
      Top = 880
      Width = 452
      Height = 22
      ReadOnly = True
      TabOrder = 248
      Text = '  North ship movement      [m]'
    end
    object Edit26: TEdit
      Left = 10
      Top = 905
      Width = 452
      Height = 22
      ReadOnly = True
      TabOrder = 249
      Text = '  East ship movement         [m]'
    end
    object Edit27: TEdit
      Left = 10
      Top = 930
      Width = 452
      Height = 22
      ReadOnly = True
      TabOrder = 250
      Text = '  Vertical ship movement  [m]'
    end
    object Panel2: TPanel
      Left = 467
      Top = 830
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 251
      object li8: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel3: TPanel
      Left = 467
      Top = 855
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 252
      object li10: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel4: TPanel
      Left = 467
      Top = 880
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 253
      object li15: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel5: TPanel
      Left = 467
      Top = 905
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 254
      object li16: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Panel6: TPanel
      Left = 467
      Top = 930
      Width = 25
      Height = 22
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 255
      object li17: TImage
        Left = 16
        Top = -8
        Width = 17
        Height = 25
      end
    end
    object Edit28: TEdit
      Left = 10
      Top = 955
      Width = 481
      Height = 22
      ReadOnly = True
      TabOrder = 256
      Text = '  Sign of validity'
    end
    object Edit29: TEdit
      Left = 10
      Top = 980
      Width = 481
      Height = 22
      ReadOnly = True
      TabOrder = 257
      Text = '  Accumulation time'
    end
    object ea1: TEdit
      Left = 495
      Top = 830
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 258
    end
    object ea2: TEdit
      Left = 495
      Top = 855
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 259
    end
    object ea3: TEdit
      Left = 495
      Top = 880
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 260
    end
    object ea4: TEdit
      Left = 495
      Top = 905
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 261
    end
    object ea5: TEdit
      Left = 495
      Top = 930
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 262
    end
    object ea6: TEdit
      Left = 495
      Top = 955
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 263
    end
    object ea7: TEdit
      Left = 495
      Top = 980
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 264
    end
    object da1: TEdit
      Left = 565
      Top = 830
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 265
    end
    object da2: TEdit
      Left = 565
      Top = 855
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 266
    end
    object da3: TEdit
      Left = 565
      Top = 880
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 267
    end
    object da4: TEdit
      Left = 565
      Top = 905
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 268
    end
    object da5: TEdit
      Left = 565
      Top = 930
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 269
    end
    object da6: TEdit
      Left = 565
      Top = 955
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 270
    end
    object da7: TEdit
      Left = 565
      Top = 980
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 271
    end
    object fa1: TEdit
      Left = 635
      Top = 830
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 272
    end
    object fa2: TEdit
      Left = 635
      Top = 855
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 273
    end
    object fa3: TEdit
      Left = 635
      Top = 880
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 274
    end
    object fa4: TEdit
      Left = 635
      Top = 905
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 275
    end
    object fa5: TEdit
      Left = 635
      Top = 930
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 276
    end
    object fa6: TEdit
      Left = 635
      Top = 955
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 277
    end
    object fa7: TEdit
      Left = 635
      Top = 980
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 278
    end
    object ta1: TEdit
      Left = 705
      Top = 830
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 279
    end
    object ta2: TEdit
      Left = 705
      Top = 855
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 280
    end
    object ta3: TEdit
      Left = 705
      Top = 880
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 281
    end
    object ta4: TEdit
      Left = 705
      Top = 905
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 282
    end
    object ta5: TEdit
      Left = 705
      Top = 930
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 283
    end
    object ta6: TEdit
      Left = 705
      Top = 955
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 284
    end
    object ta7: TEdit
      Left = 705
      Top = 980
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 285
    end
    object wa1: TEdit
      Left = 775
      Top = 830
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 286
    end
    object wa2: TEdit
      Left = 775
      Top = 855
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 287
    end
    object wa3: TEdit
      Left = 775
      Top = 880
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 288
    end
    object wa4: TEdit
      Left = 775
      Top = 905
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 289
    end
    object wa5: TEdit
      Left = 775
      Top = 930
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 290
    end
    object wa6: TEdit
      Left = 775
      Top = 955
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 291
    end
    object wa7: TEdit
      Left = 775
      Top = 980
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 292
    end
    object ka1: TEdit
      Left = 845
      Top = 830
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 293
    end
    object ka2: TEdit
      Left = 845
      Top = 855
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 294
    end
    object ka3: TEdit
      Left = 845
      Top = 880
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 295
    end
    object ka4: TEdit
      Left = 845
      Top = 905
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 296
    end
    object ka5: TEdit
      Left = 845
      Top = 930
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 297
    end
    object ka6: TEdit
      Left = 845
      Top = 955
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 298
    end
    object ka7: TEdit
      Left = 845
      Top = 980
      Width = 65
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Cambria'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 299
    end
    object Panel7: TPanel
      Left = 565
      Top = 830
      Width = 348
      Height = 174
      BevelOuter = bvNone
      TabOrder = 300
    end
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 504
    Top = 8
  end
end
