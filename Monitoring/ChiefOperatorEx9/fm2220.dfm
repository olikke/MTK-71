object fKU: TfKU
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'KU'
  ClientHeight = 557
  ClientWidth = 1066
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
    Left = 9
    Top = 10
    Width = 393
    Height = 539
    Constraints.MinHeight = 30
    TabOrder = 0
    object Panel3: TPanel
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
      object Label3: TLabel
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
    object Panel4: TPanel
      Left = 1
      Top = 28
      Width = 391
      Height = 510
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Edit1: TEdit
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
      object Edit2: TEdit
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
      object Edit3: TEdit
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
        Color = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = '  YES'
      end
      object Edit5: TEdit
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
        Text = '  Power Supply of  TV device'
      end
      object Edit6: TEdit
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
        Text = '  TV device Voltage Supply (V) '
      end
      object Edit7: TEdit
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
        Text = '  Temperature in TVD Housing (degree C) '
      end
      object Edit8: TEdit
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
        Text = '  Sign of authenticity of temperature'
      end
      object Edit9: TEdit
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
        Text = '  Humidity in TVD Housing  (%)'
      end
      object Edit10: TEdit
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
        Text = '  Power Supply of FAN'
      end
      object Edit11: TEdit
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
        Text = '  RPM of FAN'
      end
      object Edit12: TEdit
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
        Text = '  Sign of good condition of Heating'
      end
      object Edit13: TEdit
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
        Text = '  Heater Operation Mode '
      end
      object Edit14: TEdit
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
        Text = '  Power Supply of Heater  '
      end
      object Edit15: TEdit
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
        Text = '  Fan Operation Mode  '
      end
      object Edit16: TEdit
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
        TabOrder = 15
        Text = '  "C" Channel Equalization (?CE) '
      end
      object Edit17: TEdit
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
        TabOrder = 16
        Text = '  "Y" Video Out (SYNC) '
      end
      object Edit19: TEdit
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
        TabOrder = 17
        Text = '  "C"  Video Out '
      end
      object Edit18: TEdit
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
        TabOrder = 18
        Text = '  Power Supply of test LED'
      end
      object Edit20: TEdit
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
        TabOrder = 19
        Text = '  "Y" Channel Gain (YCG)  '
      end
      object Edit21: TEdit
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
        TabOrder = 20
        Text = '  "Y"Channel Equalization  (YCE) '
      end
      object Edit22: TEdit
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
        TabOrder = 21
        Text = '  "C" Channel Gain (CCG) '
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
        TabOrder = 22
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
        TabOrder = 23
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
        TabOrder = 24
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
        TabOrder = 25
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
        TabOrder = 26
      end
      object e7: TEdit
        Left = 280
        Top = 180
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
      object e8: TEdit
        Left = 280
        Top = 205
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
        TabOrder = 29
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
        TabOrder = 30
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
        TabOrder = 31
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
        TabOrder = 32
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
        TabOrder = 33
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
        TabOrder = 34
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
        TabOrder = 35
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
        TabOrder = 36
      end
      object e17: TEdit
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
        TabOrder = 37
      end
      object e18: TEdit
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
        TabOrder = 38
      end
      object e19: TEdit
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
        TabOrder = 39
      end
    end
  end
  object Panel1: TPanel
    Left = 407
    Top = 10
    Width = 322
    Height = 539
    Constraints.MinHeight = 30
    TabOrder = 1
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 320
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
        Width = 318
        Height = 25
        Align = alClient
        ExplicitLeft = 80
        ExplicitTop = 0
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 318
        Height = 25
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'Control'
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
      Width = 320
      Height = 510
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel7: TPanel
        Left = 6
        Top = 5
        Width = 306
        Height = 75
        Constraints.MinHeight = 30
        TabOrder = 0
        object Panel8: TPanel
          Left = 1
          Top = 1
          Width = 304
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
            Width = 302
            Height = 25
            Align = alClient
            ExplicitLeft = 80
            ExplicitTop = 0
            ExplicitWidth = 105
            ExplicitHeight = 105
          end
          object Label2: TLabel
            Left = 1
            Top = 1
            Width = 302
            Height = 25
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = 'TV device'
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
          Width = 304
          Height = 46
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object Button1: TButton
            Left = 16
            Top = 10
            Width = 75
            Height = 25
            Caption = 'ON'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 104
            Top = 10
            Width = 75
            Height = 25
            Caption = 'OFF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = Button2Click
          end
        end
      end
      object Panel10: TPanel
        Left = 6
        Top = 80
        Width = 306
        Height = 75
        Constraints.MinHeight = 30
        TabOrder = 1
        object Panel11: TPanel
          Left = 1
          Top = 1
          Width = 304
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
            Width = 302
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
            Width = 302
            Height = 25
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = 'FAN'
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
        object Panel12: TPanel
          Left = 1
          Top = 28
          Width = 304
          Height = 46
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object Button3: TButton
            Left = 16
            Top = 10
            Width = 75
            Height = 25
            Caption = 'ON'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = Button3Click
          end
          object Button4: TButton
            Left = 104
            Top = 10
            Width = 75
            Height = 25
            Caption = 'OFF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = Button4Click
          end
          object Button5: TButton
            Left = 192
            Top = 10
            Width = 75
            Height = 25
            Caption = 'AUTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = Button5Click
          end
        end
      end
      object Panel13: TPanel
        Left = 6
        Top = 155
        Width = 306
        Height = 75
        Constraints.MinHeight = 30
        TabOrder = 2
        object Panel14: TPanel
          Left = 1
          Top = 1
          Width = 304
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
          object i5: TImage
            Left = 1
            Top = 1
            Width = 302
            Height = 25
            Align = alClient
            ExplicitLeft = 80
            ExplicitTop = 0
            ExplicitWidth = 105
            ExplicitHeight = 105
          end
          object Label5: TLabel
            Left = 1
            Top = 1
            Width = 302
            Height = 25
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = 'Heater'
            Color = clMedGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            ExplicitTop = 4
          end
        end
        object Panel15: TPanel
          Left = 1
          Top = 28
          Width = 304
          Height = 46
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object Button6: TButton
            Left = 16
            Top = 10
            Width = 75
            Height = 25
            Caption = 'ON'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = Button6Click
          end
          object Button7: TButton
            Left = 104
            Top = 10
            Width = 75
            Height = 25
            Caption = 'OFF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = Button7Click
          end
          object Button8: TButton
            Left = 192
            Top = 10
            Width = 75
            Height = 25
            Caption = 'AUTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = Button8Click
          end
        end
      end
      object Panel16: TPanel
        Left = 6
        Top = 230
        Width = 306
        Height = 75
        Constraints.MinHeight = 30
        TabOrder = 3
        object Panel17: TPanel
          Left = 1
          Top = 1
          Width = 304
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
          object i6: TImage
            Left = 1
            Top = 1
            Width = 302
            Height = 25
            Align = alClient
            ExplicitLeft = 80
            ExplicitTop = 0
            ExplicitWidth = 105
            ExplicitHeight = 105
          end
          object Label6: TLabel
            Left = 1
            Top = 1
            Width = 302
            Height = 25
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = 'Test LED'
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
        object Panel18: TPanel
          Left = 1
          Top = 28
          Width = 304
          Height = 46
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object Button9: TButton
            Left = 16
            Top = 10
            Width = 75
            Height = 25
            Caption = 'ON'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = Button9Click
          end
          object Button10: TButton
            Left = 104
            Top = 10
            Width = 75
            Height = 25
            Caption = 'OFF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = Button10Click
          end
        end
      end
      object Panel19: TPanel
        Left = 6
        Top = 305
        Width = 306
        Height = 75
        Constraints.MinHeight = 30
        TabOrder = 4
        object Panel20: TPanel
          Left = 1
          Top = 1
          Width = 304
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
          object i7: TImage
            Left = 1
            Top = 1
            Width = 302
            Height = 25
            Align = alClient
            ExplicitLeft = 80
            ExplicitTop = 0
            ExplicitWidth = 105
            ExplicitHeight = 105
          end
          object Label7: TLabel
            Left = 1
            Top = 1
            Width = 302
            Height = 25
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = 'Adjustment of cable correction "Y"'
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
        object Panel21: TPanel
          Left = 1
          Top = 28
          Width = 304
          Height = 46
          Align = alClient
          BevelOuter = bvLowered
          Color = clMedGray
          TabOrder = 1
          object Label10: TLabel
            Left = 15
            Top = 15
            Width = 25
            Height = 16
            Caption = 'YCG'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object bYCG: TSpeedButton
            Left = 110
            Top = 11
            Width = 26
            Height = 25
            Hint = 'To apply'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555555555555555555555555555555555555555FF55555555555559055555
              55555555577FF5555555555599905555555555557777F5555555555599905555
              555555557777FF5555555559999905555555555777777F555555559999990555
              5555557777777FF5555557990599905555555777757777F55555790555599055
              55557775555777FF5555555555599905555555555557777F5555555555559905
              555555555555777FF5555555555559905555555555555777FF55555555555579
              05555555555555777FF5555555555557905555555555555777FF555555555555
              5990555555555555577755555555555555555555555555555555}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = bYCGClick
          end
          object Label11: TLabel
            Left = 170
            Top = 15
            Width = 24
            Height = 16
            Caption = 'YCE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object bYCE: TSpeedButton
            Left = 265
            Top = 11
            Width = 26
            Height = 25
            Hint = 'To apply'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555555555555555555555555555555555555555FF55555555555559055555
              55555555577FF5555555555599905555555555557777F5555555555599905555
              555555557777FF5555555559999905555555555777777F555555559999990555
              5555557777777FF5555557990599905555555777757777F55555790555599055
              55557775555777FF5555555555599905555555555557777F5555555555559905
              555555555555777FF5555555555559905555555555555777FF55555555555579
              05555555555555777FF5555555555557905555555555555777FF555555555555
              5990555555555555577755555555555555555555555555555555}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = bYCEClick
          end
          object eYCG: TEdit
            Left = 45
            Top = 11
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = '0'
          end
          object udYCG: TUpDown
            Left = 95
            Top = 11
            Width = 16
            Height = 24
            Associate = eYCG
            Max = 200
            TabOrder = 1
          end
          object eYCE: TEdit
            Left = 200
            Top = 11
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            Text = '0'
          end
          object udYCE: TUpDown
            Left = 250
            Top = 11
            Width = 16
            Height = 24
            Associate = eYCE
            TabOrder = 3
          end
        end
      end
      object Panel22: TPanel
        Left = 6
        Top = 380
        Width = 306
        Height = 75
        Constraints.MinHeight = 30
        TabOrder = 5
        object Panel23: TPanel
          Left = 1
          Top = 1
          Width = 304
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
          object i8: TImage
            Left = 1
            Top = 1
            Width = 302
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
            Width = 302
            Height = 25
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = 'Adjustement of Cable correction "C"'
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
        object Panel24: TPanel
          Left = 1
          Top = 28
          Width = 304
          Height = 46
          Align = alClient
          BevelOuter = bvLowered
          Color = clMedGray
          TabOrder = 1
          object Label12: TLabel
            Left = 15
            Top = 15
            Width = 25
            Height = 16
            Caption = 'CCG'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object bCCG: TSpeedButton
            Left = 110
            Top = 11
            Width = 26
            Height = 25
            Hint = 'To apply'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555555555555555555555555555555555555555FF55555555555559055555
              55555555577FF5555555555599905555555555557777F5555555555599905555
              555555557777FF5555555559999905555555555777777F555555559999990555
              5555557777777FF5555557990599905555555777757777F55555790555599055
              55557775555777FF5555555555599905555555555557777F5555555555559905
              555555555555777FF5555555555559905555555555555777FF55555555555579
              05555555555555777FF5555555555557905555555555555777FF555555555555
              5990555555555555577755555555555555555555555555555555}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = bCCGClick
          end
          object Label13: TLabel
            Left = 170
            Top = 15
            Width = 24
            Height = 16
            Caption = 'CCE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object bCCE: TSpeedButton
            Left = 265
            Top = 11
            Width = 26
            Height = 25
            Hint = 'To apply'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555555555555555555555555555555555555555FF55555555555559055555
              55555555577FF5555555555599905555555555557777F5555555555599905555
              555555557777FF5555555559999905555555555777777F555555559999990555
              5555557777777FF5555557990599905555555777757777F55555790555599055
              55557775555777FF5555555555599905555555555557777F5555555555559905
              555555555555777FF5555555555559905555555555555777FF55555555555579
              05555555555555777FF5555555555557905555555555555777FF555555555555
              5990555555555555577755555555555555555555555555555555}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = bCCEClick
          end
          object eCCG: TEdit
            Left = 45
            Top = 11
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = '0'
          end
          object udCCG: TUpDown
            Left = 95
            Top = 11
            Width = 16
            Height = 24
            Associate = eCCG
            Max = 200
            TabOrder = 1
          end
          object eCCE: TEdit
            Left = 200
            Top = 11
            Width = 50
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -14
            Font.Name = 'Cambria'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            Text = '0'
          end
          object udCCE: TUpDown
            Left = 250
            Top = 11
            Width = 16
            Height = 24
            Associate = eCCE
            TabOrder = 3
          end
        end
      end
      object Panel28: TPanel
        Left = 5
        Top = 455
        Width = 313
        Height = 50
        BevelOuter = bvNone
        Color = clMedGray
        TabOrder = 6
        object Button15: TButton
          Left = 14
          Top = 11
          Width = 75
          Height = 25
          Caption = 'Applay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = Button15Click
        end
        object Button11: TButton
          Left = 118
          Top = 11
          Width = 75
          Height = 25
          Caption = 'Cancel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = Button11Click
        end
        object Button12: TButton
          Left = 222
          Top = 11
          Width = 75
          Height = 25
          Caption = 'Close'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = Button12Click
        end
      end
    end
  end
  object Panel25: TPanel
    Left = 735
    Top = 10
    Width = 320
    Height = 539
    Constraints.MinHeight = 30
    TabOrder = 2
    object Panel26: TPanel
      Left = 1
      Top = 1
      Width = 318
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
      object i9: TImage
        Left = 1
        Top = 1
        Width = 316
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
        Width = 316
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
    object Panel27: TPanel
      Left = 1
      Top = 28
      Width = 318
      Height = 510
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object RichEdit1: TRichEdit
        Left = 1
        Top = 1
        Width = 316
        Height = 508
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
  object Timer2: TTimer
    Interval = 100
    OnTimer = Timer2Timer
    Left = 104
  end
end
