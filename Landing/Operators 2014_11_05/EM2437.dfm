object fm2437: Tfm2437
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fm2437'
  ClientHeight = 688
  ClientWidth = 1092
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1092
    Height = 688
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Panel3: TPanel
      Left = 9
      Top = 12
      Width = 393
      Height = 662
      Constraints.MinHeight = 30
      TabOrder = 0
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 391
        Height = 27
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'WS and VRD'
        Color = clActiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object i1: TImage
          Left = 1
          Top = 1
          Width = 389
          Height = 25
          Align = alClient
          ExplicitLeft = 80
          ExplicitTop = 0
          ExplicitWidth = 105
          ExplicitHeight = 105
        end
        object Label8: TLabel
          Left = 1
          Top = 1
          Width = 389
          Height = 25
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = 'Device state'
          Color = clMedGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          ExplicitLeft = 55
          ExplicitTop = 11
          ExplicitWidth = 42
          ExplicitHeight = 18
        end
      end
      object Panel6: TPanel
        Left = 1
        Top = 28
        Width = 391
        Height = 633
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
        object Edit13: TEdit
          Left = 5
          Top = 5
          Width = 275
          Height = 24
          Color = clMedGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '  Parameters'
        end
        object Edit14: TEdit
          Left = 280
          Top = 5
          Width = 106
          Height = 24
          Color = clMedGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '  State'
        end
        object Edit15: TEdit
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
          TabOrder = 2
          Text = '  Data exchange'
        end
        object e1: TEdit
          Left = 280
          Top = 30
          Width = 106
          Height = 24
          Color = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '  NO'
        end
        object Edit16: TEdit
          Left = 5
          Top = 55
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
          Text = '  Device type code'
        end
        object Edit17: TEdit
          Left = 5
          Top = 80
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
          Text = '  Hardware version'
        end
        object Edit18: TEdit
          Left = 5
          Top = 105
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
          Text = '  Software version'
        end
        object Edit19: TEdit
          Left = 5
          Top = 130
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
          Text = '  Serial number'
        end
        object Edit20: TEdit
          Left = 5
          Top = 155
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
          Text = '  Device manufactoring date'
        end
        object Edit21: TEdit
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
          TabOrder = 9
          Text = '  Turn/off power supply unit 1'
        end
        object Edit22: TEdit
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
          TabOrder = 10
          Text = '  Turn/off power supply unit 2'
        end
        object m3: TEdit
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
          TabOrder = 11
          Text = '  Gain factor in the channel 2'
        end
        object m4: TEdit
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
          TabOrder = 12
          Text = '  Equalization factor in the channel 2'
        end
        object m2: TEdit
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
          TabOrder = 13
          Text = '  Equalization factor in the channel 1'
        end
        object m1: TEdit
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
          TabOrder = 14
          Text = '  Gain factor in the channel 1'
        end
        object m5: TEdit
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
          TabOrder = 15
          Text = '  Gain factor in the channel 3'
        end
        object m6: TEdit
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
          TabOrder = 16
          Text = '  Equalization factor in the channel 3'
        end
        object m7: TEdit
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
          TabOrder = 17
          Text = '  Gain factor in the channel 4'
        end
        object m8: TEdit
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
          TabOrder = 18
          Text = '  Equalization factor in the channel 4'
        end
        object e2: TEdit
          Left = 280
          Top = 55
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 19
        end
        object e3: TEdit
          Left = 280
          Top = 80
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 20
        end
        object e4: TEdit
          Left = 280
          Top = 105
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 21
        end
        object e5: TEdit
          Left = 280
          Top = 130
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 22
        end
        object e6: TEdit
          Left = 280
          Top = 155
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 23
        end
        object e7: TEdit
          Left = 280
          Top = 180
          Width = 106
          Height = 24
          Color = clMedGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 24
          Text = '  no use'
        end
        object e8: TEdit
          Left = 280
          Top = 205
          Width = 106
          Height = 24
          Color = clMedGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 25
          Text = '  no use'
        end
        object e9: TEdit
          Left = 280
          Top = 230
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 26
        end
        object e10: TEdit
          Left = 280
          Top = 255
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 27
        end
        object e11: TEdit
          Left = 280
          Top = 280
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 28
        end
        object e12: TEdit
          Left = 280
          Top = 305
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 29
        end
        object e13: TEdit
          Left = 280
          Top = 330
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 30
        end
        object e14: TEdit
          Left = 280
          Top = 355
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 31
        end
        object e15: TEdit
          Left = 280
          Top = 380
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 32
        end
        object e16: TEdit
          Left = 280
          Top = 405
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 33
        end
        object d1: TEdit
          Left = 5
          Top = 430
          Width = 275
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 34
          Text = '  Alarm threshold of power supply unit 11'
        end
        object d2: TEdit
          Left = 5
          Top = 455
          Width = 275
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 35
          Text = '  Alarm threshold of power supply unit 12'
        end
        object d3: TEdit
          Left = 5
          Top = 480
          Width = 275
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 36
          Text = '  Alarm threshold of power supply unit 21'
        end
        object d4: TEdit
          Left = 5
          Top = 505
          Width = 275
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 37
          Text = '  Alarm threshold of power supply unit 22'
        end
        object d5: TEdit
          Left = 5
          Top = 530
          Width = 275
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 38
          Text = '  Voltage level of power supply unit 11'
        end
        object d6: TEdit
          Left = 5
          Top = 555
          Width = 275
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 39
          Text = '  Voltage level of power supply unit 12'
        end
        object d7: TEdit
          Left = 5
          Top = 580
          Width = 275
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 40
          Text = '  Voltage level of power supply unit 21'
        end
        object d8: TEdit
          Left = 5
          Top = 605
          Width = 275
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 41
          Text = '  Voltage level of power supply unit 22'
        end
        object k1: TEdit
          Left = 280
          Top = 430
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 42
        end
        object k2: TEdit
          Left = 280
          Top = 455
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 43
        end
        object k3: TEdit
          Left = 280
          Top = 480
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 44
        end
        object k4: TEdit
          Left = 280
          Top = 505
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 45
        end
        object k5: TEdit
          Left = 280
          Top = 530
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 46
        end
        object k6: TEdit
          Left = 280
          Top = 555
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 47
        end
        object k7: TEdit
          Left = 280
          Top = 580
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 48
        end
        object k8: TEdit
          Left = 280
          Top = 605
          Width = 106
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 49
        end
      end
    end
    object Panel7: TPanel
      Left = 406
      Top = 12
      Width = 212
      Height = 165
      Constraints.MinHeight = 30
      TabOrder = 1
      object Panel8: TPanel
        Left = 1
        Top = 1
        Width = 210
        Height = 27
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'WS and VRD'
        Color = clActiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object i2: TImage
          Left = 1
          Top = 1
          Width = 208
          Height = 25
          Align = alClient
          ExplicitLeft = 80
          ExplicitTop = 0
          ExplicitWidth = 105
          ExplicitHeight = 105
        end
        object Label9: TLabel
          Left = 1
          Top = 1
          Width = 208
          Height = 25
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = 'Status of signals'
          Color = clMedGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          ExplicitLeft = 55
          ExplicitTop = 11
          ExplicitWidth = 42
          ExplicitHeight = 18
        end
      end
      object Panel9: TPanel
        Left = 1
        Top = 28
        Width = 210
        Height = 136
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
        object Edit23: TEdit
          Left = 5
          Top = 5
          Width = 100
          Height = 24
          Color = clMedGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '  Channel'
        end
        object Edit24: TEdit
          Left = 105
          Top = 5
          Width = 50
          Height = 24
          Color = clMedGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '  Out 1'
        end
        object Edit25: TEdit
          Left = 5
          Top = 30
          Width = 100
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = '  Ch N 1'
        end
        object Edit39: TEdit
          Left = 5
          Top = 55
          Width = 100
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '  Ch N 2'
        end
        object Edit40: TEdit
          Left = 5
          Top = 80
          Width = 100
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = '  Ch N 3'
        end
        object Edit41: TEdit
          Left = 5
          Top = 105
          Width = 100
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          Text = '  Ch N 4'
        end
        object Edit42: TEdit
          Left = 155
          Top = 5
          Width = 50
          Height = 24
          Color = clMedGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          Text = '  Out 1'
        end
        object Panel10: TPanel
          Left = 105
          Top = 30
          Width = 50
          Height = 25
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          TabOrder = 7
          object out11: TShape
            Left = 12
            Top = 3
            Width = 25
            Height = 20
            Brush.Color = clMedGray
            ParentShowHint = False
            Shape = stCircle
            ShowHint = True
          end
        end
        object Panel11: TPanel
          Left = 105
          Top = 55
          Width = 50
          Height = 25
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          TabOrder = 8
          object out21: TShape
            Left = 12
            Top = 3
            Width = 25
            Height = 20
            Hint = 'no use'
            Brush.Color = clMedGray
            ParentShowHint = False
            Shape = stCircle
            ShowHint = True
          end
        end
        object Panel12: TPanel
          Left = 105
          Top = 80
          Width = 50
          Height = 25
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          TabOrder = 9
          object out31: TShape
            Left = 12
            Top = 3
            Width = 25
            Height = 20
            Hint = 'no use'
            Brush.Color = clMedGray
            ParentShowHint = False
            Shape = stCircle
            ShowHint = True
          end
        end
        object Panel13: TPanel
          Left = 105
          Top = 105
          Width = 50
          Height = 25
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          TabOrder = 10
          object out41: TShape
            Left = 12
            Top = 3
            Width = 25
            Height = 20
            Hint = 'no use'
            Brush.Color = clMedGray
            ParentShowHint = False
            Shape = stCircle
            ShowHint = True
          end
        end
        object Panel14: TPanel
          Left = 155
          Top = 30
          Width = 50
          Height = 25
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          TabOrder = 11
          object out12: TShape
            Left = 12
            Top = 3
            Width = 25
            Height = 20
            Brush.Color = clMedGray
            ParentShowHint = False
            Shape = stCircle
            ShowHint = True
          end
        end
        object Panel15: TPanel
          Left = 155
          Top = 55
          Width = 50
          Height = 25
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          TabOrder = 12
          object out22: TShape
            Left = 12
            Top = 3
            Width = 25
            Height = 20
            Hint = 'no use'
            Brush.Color = clMedGray
            ParentShowHint = False
            Shape = stCircle
            ShowHint = True
          end
        end
        object Panel16: TPanel
          Left = 155
          Top = 80
          Width = 50
          Height = 25
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          TabOrder = 13
          object out32: TShape
            Left = 12
            Top = 3
            Width = 25
            Height = 20
            Hint = 'no use'
            Brush.Color = clMedGray
            ParentShowHint = False
            Shape = stCircle
            ShowHint = True
          end
        end
        object Panel17: TPanel
          Left = 155
          Top = 105
          Width = 50
          Height = 25
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          TabOrder = 14
          object out42: TShape
            Left = 12
            Top = 3
            Width = 25
            Height = 20
            Hint = 'no use'
            Brush.Color = clMedGray
            ParentShowHint = False
            Shape = stCircle
            ShowHint = True
          end
        end
      end
    end
    object Panel18: TPanel
      Left = 406
      Top = 182
      Width = 212
      Height = 492
      Constraints.MinHeight = 30
      TabOrder = 2
      Visible = False
      object Panel19: TPanel
        Left = 1
        Top = 1
        Width = 210
        Height = 27
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'WS and VRD'
        Color = clActiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object i4: TImage
          Left = 1
          Top = 1
          Width = 208
          Height = 25
          Align = alClient
          ExplicitLeft = 80
          ExplicitTop = 0
          ExplicitWidth = 105
          ExplicitHeight = 105
        end
        object Label4: TLabel
          Left = 1
          Top = 1
          Width = 208
          Height = 25
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = 'Control'
          Color = clMedGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          ExplicitLeft = 55
          ExplicitTop = 11
          ExplicitWidth = 42
          ExplicitHeight = 18
        end
      end
      object Panel20: TPanel
        Left = 1
        Top = 28
        Width = 210
        Height = 463
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
        object XiButton5: TXiButton
          Left = 120
          Top = 88
          Width = 75
          Height = 25
          ColorFace = 15987699
          ColorGrad = 12369084
          ColorDark = 10987431
          ColorLight = 16250871
          ColorBorder = 6447714
          ColorText = clBlack
          OverColorFace = 15790320
          OverColorGrad = 10921638
          OverColorDark = 10658466
          OverColorLight = 15658734
          OverColorBorder = 7697781
          OverColorText = clBlack
          DownColorFace = 13290186
          DownColorGrad = 14342874
          DownColorDark = 15329769
          DownColorLight = 8158332
          DownColorBorder = 5131854
          DownColorText = clBlack
          DisabledColorFace = 15658734
          DisabledColorGrad = clWhite
          DisabledColorDark = 13816530
          DisabledColorLight = clWhite
          DisabledColorBorder = clGray
          DisabledColorText = clGray
          ColorFocusRect = 11382189
          ColorScheme = csNeoSilver
          Ctl3D = True
          Layout = blGlyphLeft
          Spacing = 4
          TransparentGlyph = True
          Gradient = True
          HotTrack = True
          Caption = 'Applay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = XiButton5Click
        end
        object XiButton6: TXiButton
          Left = 120
          Top = 119
          Width = 75
          Height = 25
          ColorFace = 15987699
          ColorGrad = 12369084
          ColorDark = 10987431
          ColorLight = 16250871
          ColorBorder = 6447714
          ColorText = clBlack
          OverColorFace = 15790320
          OverColorGrad = 10921638
          OverColorDark = 10658466
          OverColorLight = 15658734
          OverColorBorder = 7697781
          OverColorText = clBlack
          DownColorFace = 13290186
          DownColorGrad = 14342874
          DownColorDark = 15329769
          DownColorLight = 8158332
          DownColorBorder = 5131854
          DownColorText = clBlack
          DisabledColorFace = 15658734
          DisabledColorGrad = clWhite
          DisabledColorDark = 13816530
          DisabledColorLight = clWhite
          DisabledColorBorder = clGray
          DisabledColorText = clGray
          ColorFocusRect = 11382189
          ColorScheme = csNeoSilver
          Ctl3D = True
          Layout = blGlyphLeft
          Spacing = 4
          TransparentGlyph = True
          Gradient = True
          HotTrack = True
          Caption = 'Cancel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = XiButton6Click
        end
        object XiButton7: TXiButton
          Left = 120
          Top = 150
          Width = 75
          Height = 25
          ColorFace = 15987699
          ColorGrad = 12369084
          ColorDark = 10987431
          ColorLight = 16250871
          ColorBorder = 6447714
          ColorText = clBlack
          OverColorFace = 15790320
          OverColorGrad = 10921638
          OverColorDark = 10658466
          OverColorLight = 15658734
          OverColorBorder = 7697781
          OverColorText = clBlack
          DownColorFace = 13290186
          DownColorGrad = 14342874
          DownColorDark = 15329769
          DownColorLight = 8158332
          DownColorBorder = 5131854
          DownColorText = clBlack
          DisabledColorFace = 15658734
          DisabledColorGrad = clWhite
          DisabledColorDark = 13816530
          DisabledColorLight = clWhite
          DisabledColorBorder = clGray
          DisabledColorText = clGray
          ColorFocusRect = 11382189
          ColorScheme = csNeoSilver
          Ctl3D = True
          Layout = blGlyphLeft
          Spacing = 4
          TransparentGlyph = True
          Gradient = True
          HotTrack = True
          Caption = 'Close'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = XiButton7Click
        end
        object p1: TPanel
          Left = 5
          Top = 60
          Width = 100
          Height = 100
          TabOrder = 3
          object t9: TEdit
            Left = 0
            Top = 0
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = '0'
          end
          object t10: TEdit
            Left = 0
            Top = 25
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Text = '0'
          end
          object u9: TUpDown
            Left = 50
            Top = 0
            Width = 16
            Height = 24
            Associate = t9
            Max = 255
            TabOrder = 2
            OnClick = u9Click
          end
          object u10: TUpDown
            Left = 50
            Top = 25
            Width = 16
            Height = 24
            Associate = t10
            Max = 255
            TabOrder = 3
            OnClick = u9Click
          end
          object b1: TXiButton
            Left = 69
            Top = 0
            Width = 30
            Height = 50
            ColorFace = 15987699
            ColorGrad = 12369084
            ColorDark = 10987431
            ColorLight = 16250871
            ColorBorder = 6447714
            ColorText = clBlack
            OverColorFace = 15790320
            OverColorGrad = 10921638
            OverColorDark = 10658466
            OverColorLight = 15658734
            OverColorBorder = 7697781
            OverColorText = clBlack
            DownColorFace = 13290186
            DownColorGrad = 14342874
            DownColorDark = 15329769
            DownColorLight = 8158332
            DownColorBorder = 5131854
            DownColorText = clBlack
            DisabledColorFace = 15658734
            DisabledColorGrad = clWhite
            DisabledColorDark = 13816530
            DisabledColorLight = clWhite
            DisabledColorBorder = clGray
            DisabledColorText = clGray
            ColorFocusRect = 11382189
            ColorScheme = csNeoSilver
            Ctl3D = True
            Layout = blGlyphLeft
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000230B0000230B000010000000100000000080000000A0
              0000984E00000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000222222222222
              2222222222002222222222222011022222222222201102222222222201111022
              2222222011011022222222010020110222222000222201022222222222220110
              2222222222222010222222222222220102222222222222201022222222222222
              0002222222222222222222222222222222222222222222222222}
            Spacing = 4
            TransparentGlyph = True
            Gradient = True
            HotTrack = True
            TabOrder = 4
            OnClick = b1Click
          end
          object t11: TEdit
            Left = 0
            Top = 50
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            Text = '0'
          end
          object t12: TEdit
            Left = 0
            Top = 75
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            Text = '0'
          end
          object u11: TUpDown
            Left = 50
            Top = 50
            Width = 16
            Height = 24
            Associate = t11
            Max = 255
            TabOrder = 7
            OnClick = u9Click
          end
          object u12: TUpDown
            Left = 50
            Top = 75
            Width = 16
            Height = 24
            Associate = t12
            Max = 255
            TabOrder = 8
            OnClick = u9Click
          end
          object b2: TXiButton
            Left = 69
            Top = 50
            Width = 30
            Height = 50
            ColorFace = 15987699
            ColorGrad = 12369084
            ColorDark = 10987431
            ColorLight = 16250871
            ColorBorder = 6447714
            ColorText = clBlack
            OverColorFace = 15790320
            OverColorGrad = 10921638
            OverColorDark = 10658466
            OverColorLight = 15658734
            OverColorBorder = 7697781
            OverColorText = clBlack
            DownColorFace = 13290186
            DownColorGrad = 14342874
            DownColorDark = 15329769
            DownColorLight = 8158332
            DownColorBorder = 5131854
            DownColorText = clBlack
            DisabledColorFace = 15658734
            DisabledColorGrad = clWhite
            DisabledColorDark = 13816530
            DisabledColorLight = clWhite
            DisabledColorBorder = clGray
            DisabledColorText = clGray
            ColorFocusRect = 11382189
            ColorScheme = csNeoSilver
            Ctl3D = True
            Layout = blGlyphLeft
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000230B0000230B000010000000100000000080000000A0
              0000984E00000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000222222222222
              2222222222002222222222222011022222222222201102222222222201111022
              2222222011011022222222010020110222222000222201022222222222220110
              2222222222222010222222222222220102222222222222201022222222222222
              0002222222222222222222222222222222222222222222222222}
            Spacing = 4
            TransparentGlyph = True
            Gradient = True
            HotTrack = True
            TabOrder = 9
            OnClick = b2Click
          end
        end
        object p2: TPanel
          Left = 5
          Top = 160
          Width = 100
          Height = 100
          TabOrder = 4
          object t13: TEdit
            Left = 0
            Top = 0
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = '0'
          end
          object t14: TEdit
            Left = 0
            Top = 25
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Text = '0'
          end
          object u13: TUpDown
            Left = 50
            Top = 0
            Width = 16
            Height = 24
            Associate = t13
            Max = 255
            TabOrder = 2
            OnClick = u9Click
          end
          object u14: TUpDown
            Left = 50
            Top = 25
            Width = 16
            Height = 24
            Associate = t14
            Max = 255
            TabOrder = 3
            OnClick = u9Click
          end
          object b3: TXiButton
            Left = 69
            Top = 0
            Width = 30
            Height = 50
            ColorFace = 15987699
            ColorGrad = 12369084
            ColorDark = 10987431
            ColorLight = 16250871
            ColorBorder = 6447714
            ColorText = clBlack
            OverColorFace = 15790320
            OverColorGrad = 10921638
            OverColorDark = 10658466
            OverColorLight = 15658734
            OverColorBorder = 7697781
            OverColorText = clBlack
            DownColorFace = 13290186
            DownColorGrad = 14342874
            DownColorDark = 15329769
            DownColorLight = 8158332
            DownColorBorder = 5131854
            DownColorText = clBlack
            DisabledColorFace = 15658734
            DisabledColorGrad = clWhite
            DisabledColorDark = 13816530
            DisabledColorLight = clWhite
            DisabledColorBorder = clGray
            DisabledColorText = clGray
            ColorFocusRect = 11382189
            ColorScheme = csNeoSilver
            Ctl3D = True
            Layout = blGlyphLeft
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000230B0000230B000010000000100000000080000000A0
              0000984E00000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000222222222222
              2222222222002222222222222011022222222222201102222222222201111022
              2222222011011022222222010020110222222000222201022222222222220110
              2222222222222010222222222222220102222222222222201022222222222222
              0002222222222222222222222222222222222222222222222222}
            Spacing = 4
            TransparentGlyph = True
            Gradient = True
            HotTrack = True
            TabOrder = 4
            OnClick = b3Click
          end
          object t15: TEdit
            Left = 0
            Top = 50
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            Text = '0'
          end
          object t16: TEdit
            Left = 0
            Top = 75
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            Text = '0'
          end
          object u15: TUpDown
            Left = 50
            Top = 50
            Width = 16
            Height = 24
            Associate = t15
            Max = 255
            TabOrder = 7
            OnClick = u9Click
          end
          object u16: TUpDown
            Left = 50
            Top = 75
            Width = 16
            Height = 24
            Associate = t16
            Max = 255
            TabOrder = 8
            OnClick = u9Click
          end
          object b4: TXiButton
            Left = 69
            Top = 50
            Width = 30
            Height = 50
            ColorFace = 15987699
            ColorGrad = 12369084
            ColorDark = 10987431
            ColorLight = 16250871
            ColorBorder = 6447714
            ColorText = clBlack
            OverColorFace = 15790320
            OverColorGrad = 10921638
            OverColorDark = 10658466
            OverColorLight = 15658734
            OverColorBorder = 7697781
            OverColorText = clBlack
            DownColorFace = 13290186
            DownColorGrad = 14342874
            DownColorDark = 15329769
            DownColorLight = 8158332
            DownColorBorder = 5131854
            DownColorText = clBlack
            DisabledColorFace = 15658734
            DisabledColorGrad = clWhite
            DisabledColorDark = 13816530
            DisabledColorLight = clWhite
            DisabledColorBorder = clGray
            DisabledColorText = clGray
            ColorFocusRect = 11382189
            ColorScheme = csNeoSilver
            Ctl3D = True
            Layout = blGlyphLeft
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000230B0000230B000010000000100000000080000000A0
              0000984E00000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000222222222222
              2222222222002222222222222011022222222222201102222222222201111022
              2222222011011022222222010020110222222000222201022222222222220110
              2222222222222010222222222222220102222222222222201022222222222222
              0002222222222222222222222222222222222222222222222222}
            Spacing = 4
            TransparentGlyph = True
            Gradient = True
            HotTrack = True
            TabOrder = 9
            OnClick = b4Click
          end
        end
        object XiButton1: TXiButton
          Left = 5
          Top = 10
          Width = 97
          Height = 23
          ColorFace = 15987699
          ColorGrad = 12369084
          ColorDark = 10987431
          ColorLight = 16250871
          ColorBorder = 6447714
          ColorText = clBlack
          OverColorFace = 15790320
          OverColorGrad = 10921638
          OverColorDark = 10658466
          OverColorLight = 15658734
          OverColorBorder = 7697781
          OverColorText = clBlack
          DownColorFace = 13290186
          DownColorGrad = 14342874
          DownColorDark = 15329769
          DownColorLight = 8158332
          DownColorBorder = 5131854
          DownColorText = clBlack
          DisabledColorFace = 15658734
          DisabledColorGrad = clWhite
          DisabledColorDark = 13816530
          DisabledColorLight = clWhite
          DisabledColorBorder = clGray
          DisabledColorText = clGray
          ColorFocusRect = 11382189
          ColorScheme = csNeoSilver
          Ctl3D = True
          Layout = blGlyphLeft
          Spacing = 4
          TransparentGlyph = True
          Gradient = True
          HotTrack = True
          Caption = 'ON / OFF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = XiButton1Click
        end
        object XiButton2: TXiButton
          Left = 5
          Top = 35
          Width = 97
          Height = 23
          ColorFace = 15987699
          ColorGrad = 12369084
          ColorDark = 10987431
          ColorLight = 16250871
          ColorBorder = 6447714
          ColorText = clBlack
          OverColorFace = 15790320
          OverColorGrad = 10921638
          OverColorDark = 10658466
          OverColorLight = 15658734
          OverColorBorder = 7697781
          OverColorText = clBlack
          DownColorFace = 13290186
          DownColorGrad = 14342874
          DownColorDark = 15329769
          DownColorLight = 8158332
          DownColorBorder = 5131854
          DownColorText = clBlack
          DisabledColorFace = 15658734
          DisabledColorGrad = clWhite
          DisabledColorDark = 13816530
          DisabledColorLight = clWhite
          DisabledColorBorder = clGray
          DisabledColorText = clGray
          ColorFocusRect = 11382189
          ColorScheme = csNeoSilver
          Ctl3D = True
          Layout = blGlyphLeft
          Spacing = 4
          TransparentGlyph = True
          Gradient = True
          HotTrack = True
          Caption = 'ON / OFF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnClick = XiButton2Click
        end
        object Panel21: TPanel
          Left = 5
          Top = 260
          Width = 100
          Height = 100
          TabOrder = 7
          object t17: TEdit
            Left = 0
            Top = 0
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = '0'
          end
          object t18: TEdit
            Left = 0
            Top = 25
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Text = '0'
          end
          object u17: TUpDown
            Left = 50
            Top = 0
            Width = 16
            Height = 24
            Associate = t17
            Max = 255
            TabOrder = 2
            OnClick = u9Click
          end
          object u18: TUpDown
            Left = 50
            Top = 25
            Width = 16
            Height = 24
            Associate = t18
            Max = 255
            TabOrder = 3
            OnClick = u9Click
          end
          object XiButton3: TXiButton
            Left = 69
            Top = 0
            Width = 30
            Height = 25
            ColorFace = 15987699
            ColorGrad = 12369084
            ColorDark = 10987431
            ColorLight = 16250871
            ColorBorder = 6447714
            ColorText = clBlack
            OverColorFace = 15790320
            OverColorGrad = 10921638
            OverColorDark = 10658466
            OverColorLight = 15658734
            OverColorBorder = 7697781
            OverColorText = clBlack
            DownColorFace = 13290186
            DownColorGrad = 14342874
            DownColorDark = 15329769
            DownColorLight = 8158332
            DownColorBorder = 5131854
            DownColorText = clBlack
            DisabledColorFace = 15658734
            DisabledColorGrad = clWhite
            DisabledColorDark = 13816530
            DisabledColorLight = clWhite
            DisabledColorBorder = clGray
            DisabledColorText = clGray
            ColorFocusRect = 11382189
            ColorScheme = csNeoSilver
            Ctl3D = True
            Layout = blGlyphLeft
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000230B0000230B000010000000100000000080000000A0
              0000984E00000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000222222222222
              2222222222002222222222222011022222222222201102222222222201111022
              2222222011011022222222010020110222222000222201022222222222220110
              2222222222222010222222222222220102222222222222201022222222222222
              0002222222222222222222222222222222222222222222222222}
            Spacing = 4
            TransparentGlyph = True
            Gradient = True
            HotTrack = True
            TabOrder = 4
            OnClick = XiButton3Click
          end
          object t19: TEdit
            Left = 0
            Top = 50
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            Text = '0'
          end
          object t20: TEdit
            Left = 0
            Top = 75
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            Text = '0'
          end
          object u19: TUpDown
            Left = 50
            Top = 50
            Width = 16
            Height = 24
            Associate = t19
            Max = 255
            TabOrder = 7
            OnClick = u9Click
          end
          object u20: TUpDown
            Left = 50
            Top = 75
            Width = 16
            Height = 24
            Associate = t20
            Max = 255
            TabOrder = 8
            OnClick = u9Click
          end
          object XiButton4: TXiButton
            Left = 69
            Top = 50
            Width = 30
            Height = 25
            ColorFace = 15987699
            ColorGrad = 12369084
            ColorDark = 10987431
            ColorLight = 16250871
            ColorBorder = 6447714
            ColorText = clBlack
            OverColorFace = 15790320
            OverColorGrad = 10921638
            OverColorDark = 10658466
            OverColorLight = 15658734
            OverColorBorder = 7697781
            OverColorText = clBlack
            DownColorFace = 13290186
            DownColorGrad = 14342874
            DownColorDark = 15329769
            DownColorLight = 8158332
            DownColorBorder = 5131854
            DownColorText = clBlack
            DisabledColorFace = 15658734
            DisabledColorGrad = clWhite
            DisabledColorDark = 13816530
            DisabledColorLight = clWhite
            DisabledColorBorder = clGray
            DisabledColorText = clGray
            ColorFocusRect = 11382189
            ColorScheme = csNeoSilver
            Ctl3D = True
            Layout = blGlyphLeft
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000230B0000230B000010000000100000000080000000A0
              0000984E00000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000222222222222
              2222222222002222222222222011022222222222201102222222222201111022
              2222222011011022222222010020110222222000222201022222222222220110
              2222222222222010222222222222220102222222222222201022222222222222
              0002222222222222222222222222222222222222222222222222}
            Spacing = 4
            TransparentGlyph = True
            Gradient = True
            HotTrack = True
            TabOrder = 9
            OnClick = XiButton4Click
          end
          object XiButton8: TXiButton
            Left = 69
            Top = 25
            Width = 30
            Height = 25
            ColorFace = 15987699
            ColorGrad = 12369084
            ColorDark = 10987431
            ColorLight = 16250871
            ColorBorder = 6447714
            ColorText = clBlack
            OverColorFace = 15790320
            OverColorGrad = 10921638
            OverColorDark = 10658466
            OverColorLight = 15658734
            OverColorBorder = 7697781
            OverColorText = clBlack
            DownColorFace = 13290186
            DownColorGrad = 14342874
            DownColorDark = 15329769
            DownColorLight = 8158332
            DownColorBorder = 5131854
            DownColorText = clBlack
            DisabledColorFace = 15658734
            DisabledColorGrad = clWhite
            DisabledColorDark = 13816530
            DisabledColorLight = clWhite
            DisabledColorBorder = clGray
            DisabledColorText = clGray
            ColorFocusRect = 11382189
            ColorScheme = csNeoSilver
            Ctl3D = True
            Layout = blGlyphLeft
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000230B0000230B000010000000100000000080000000A0
              0000984E00000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000222222222222
              2222222222002222222222222011022222222222201102222222222201111022
              2222222011011022222222010020110222222000222201022222222222220110
              2222222222222010222222222222220102222222222222201022222222222222
              0002222222222222222222222222222222222222222222222222}
            Spacing = 4
            TransparentGlyph = True
            Gradient = True
            HotTrack = True
            TabOrder = 10
            OnClick = XiButton8Click
          end
          object XiButton9: TXiButton
            Left = 69
            Top = 75
            Width = 30
            Height = 25
            ColorFace = 15987699
            ColorGrad = 12369084
            ColorDark = 10987431
            ColorLight = 16250871
            ColorBorder = 6447714
            ColorText = clBlack
            OverColorFace = 15790320
            OverColorGrad = 10921638
            OverColorDark = 10658466
            OverColorLight = 15658734
            OverColorBorder = 7697781
            OverColorText = clBlack
            DownColorFace = 13290186
            DownColorGrad = 14342874
            DownColorDark = 15329769
            DownColorLight = 8158332
            DownColorBorder = 5131854
            DownColorText = clBlack
            DisabledColorFace = 15658734
            DisabledColorGrad = clWhite
            DisabledColorDark = 13816530
            DisabledColorLight = clWhite
            DisabledColorBorder = clGray
            DisabledColorText = clGray
            ColorFocusRect = 11382189
            ColorScheme = csNeoSilver
            Ctl3D = True
            Layout = blGlyphLeft
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000230B0000230B000010000000100000000080000000A0
              0000984E00000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000222222222222
              2222222222002222222222222011022222222222201102222222222201111022
              2222222011011022222222010020110222222000222201022222222222220110
              2222222222222010222222222222220102222222222222201022222222222222
              0002222222222222222222222222222222222222222222222222}
            Spacing = 4
            TransparentGlyph = True
            Gradient = True
            HotTrack = True
            TabOrder = 11
            OnClick = XiButton9Click
          end
        end
      end
    end
    object Panel22: TPanel
      Left = 623
      Top = 12
      Width = 453
      Height = 662
      Constraints.MinHeight = 30
      TabOrder = 3
      object Panel23: TPanel
        Left = 1
        Top = 1
        Width = 451
        Height = 27
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'WS and VRD'
        Color = clActiveBorder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object i3: TImage
          Left = 1
          Top = 1
          Width = 449
          Height = 25
          Align = alClient
          ExplicitLeft = 80
          ExplicitTop = 0
          ExplicitWidth = 105
          ExplicitHeight = 105
        end
        object Label3: TLabel
          Left = 1
          Top = 1
          Width = 449
          Height = 25
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = 'Messages'
          Color = clMedGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          ExplicitLeft = 55
          ExplicitTop = 11
          ExplicitWidth = 42
          ExplicitHeight = 18
        end
      end
      object Panel24: TPanel
        Left = 1
        Top = 28
        Width = 451
        Height = 633
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
        object RichEdit1: TRichEdit
          Left = 1
          Top = 1
          Width = 449
          Height = 631
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Cambria'
          Font.Style = []
          Lines.Strings = (
            '')
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
end
