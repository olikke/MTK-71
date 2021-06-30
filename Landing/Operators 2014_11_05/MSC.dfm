object MS: TMS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Change measuring mode'
  ClientHeight = 389
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Left = 8
    Top = 8
    Width = 361
    Height = 56
    Constraints.MinHeight = 29
    ParentBackground = False
    TabOrder = 0
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 359
      Height = 22
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Image4: TImage
        Left = 1
        Top = 1
        Width = 357
        Height = 20
        Align = alClient
        ExplicitWidth = 181
        ExplicitHeight = 24
      end
      object Label161: TLabel
        Left = 1
        Top = 1
        Width = 357
        Height = 20
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'Distance measure'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 181
        ExplicitHeight = 24
      end
    end
    object Panel7: TPanel
      Left = 1
      Top = 23
      Width = 359
      Height = 32
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object rb1: TRadioButton
        Left = 16
        Top = 8
        Width = 113
        Height = 17
        Caption = 'Meters'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = rb1Click
      end
      object rb2: TRadioButton
        Left = 192
        Top = 8
        Width = 113
        Height = 17
        Caption = 'Nautical miles'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = rb1Click
      end
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 69
    Width = 361
    Height = 56
    Constraints.MinHeight = 29
    ParentBackground = False
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 359
      Height = 22
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Image1: TImage
        Left = 1
        Top = 1
        Width = 357
        Height = 20
        Align = alClient
        ExplicitWidth = 181
        ExplicitHeight = 24
      end
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 357
        Height = 20
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'Horizontal deviation measure'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 181
        ExplicitHeight = 24
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 23
      Width = 359
      Height = 32
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object rb3: TRadioButton
        Left = 16
        Top = 8
        Width = 113
        Height = 17
        Caption = 'Meters'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = rb3Click
      end
      object rb4: TRadioButton
        Left = 192
        Top = 8
        Width = 113
        Height = 17
        Caption = 'Feet'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = rb3Click
      end
    end
  end
  object Panel4: TPanel
    Left = 8
    Top = 131
    Width = 361
    Height = 56
    Constraints.MinHeight = 29
    ParentBackground = False
    TabOrder = 2
    object Panel8: TPanel
      Left = 1
      Top = 1
      Width = 359
      Height = 22
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Image2: TImage
        Left = 1
        Top = 1
        Width = 357
        Height = 20
        Align = alClient
        ExplicitWidth = 181
        ExplicitHeight = 24
      end
      object Label2: TLabel
        Left = 1
        Top = 1
        Width = 357
        Height = 20
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'Vertical deviation measure'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 181
        ExplicitHeight = 24
      end
    end
    object Panel9: TPanel
      Left = 1
      Top = 23
      Width = 359
      Height = 32
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object rb5: TRadioButton
        Left = 16
        Top = 8
        Width = 113
        Height = 17
        Caption = 'Meters'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = rb5Click
      end
      object rb6: TRadioButton
        Left = 192
        Top = 8
        Width = 113
        Height = 17
        Caption = 'Feet'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = rb5Click
      end
    end
  end
  object Panel10: TPanel
    Left = 8
    Top = 192
    Width = 361
    Height = 56
    Constraints.MinHeight = 29
    ParentBackground = False
    TabOrder = 3
    object Panel11: TPanel
      Left = 1
      Top = 1
      Width = 359
      Height = 22
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Image3: TImage
        Left = 1
        Top = 1
        Width = 357
        Height = 20
        Align = alClient
        ExplicitWidth = 181
        ExplicitHeight = 24
      end
      object Label3: TLabel
        Left = 1
        Top = 1
        Width = 357
        Height = 20
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'ASPD measure'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 181
        ExplicitHeight = 24
      end
    end
    object Panel12: TPanel
      Left = 1
      Top = 23
      Width = 359
      Height = 32
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object rb7: TRadioButton
        Left = 16
        Top = 8
        Width = 113
        Height = 17
        Caption = 'kmph'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = rb7Click
      end
      object rb8: TRadioButton
        Left = 192
        Top = 8
        Width = 113
        Height = 17
        Caption = 'knots'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = rb7Click
      end
    end
  end
  object Panel13: TPanel
    Left = 8
    Top = 254
    Width = 361
    Height = 56
    Constraints.MinHeight = 29
    ParentBackground = False
    TabOrder = 4
    object Panel14: TPanel
      Left = 1
      Top = 1
      Width = 359
      Height = 22
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Image5: TImage
        Left = 1
        Top = 1
        Width = 357
        Height = 20
        Align = alClient
        ExplicitWidth = 181
        ExplicitHeight = 24
      end
      object Label4: TLabel
        Left = 1
        Top = 1
        Width = 357
        Height = 20
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'VSPD measure'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 181
        ExplicitHeight = 24
      end
    end
    object Panel15: TPanel
      Left = 1
      Top = 23
      Width = 359
      Height = 32
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object rb10: TRadioButton
        Left = 192
        Top = 8
        Width = 113
        Height = 17
        Caption = 'feet/minute'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = rb9Click
      end
      object rb9: TRadioButton
        Left = 16
        Top = 8
        Width = 113
        Height = 17
        Caption = 'meters/second'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = rb9Click
      end
    end
  end
  object Panel16: TPanel
    Left = 8
    Top = 316
    Width = 361
    Height = 56
    Constraints.MinHeight = 29
    ParentBackground = False
    TabOrder = 5
    object Panel17: TPanel
      Left = 1
      Top = 1
      Width = 359
      Height = 22
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Image6: TImage
        Left = 1
        Top = 1
        Width = 357
        Height = 20
        Align = alClient
        ExplicitWidth = 181
        ExplicitHeight = 24
      end
      object Label5: TLabel
        Left = 1
        Top = 1
        Width = 357
        Height = 20
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'SPD measure'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 181
        ExplicitHeight = 24
      end
    end
    object Panel18: TPanel
      Left = 1
      Top = 23
      Width = 359
      Height = 32
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object rb11: TRadioButton
        Left = 16
        Top = 8
        Width = 113
        Height = 17
        Caption = 'kmph'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = rb11Click
      end
      object rb12: TRadioButton
        Left = 192
        Top = 8
        Width = 113
        Height = 17
        Caption = 'knots'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = rb11Click
      end
    end
  end
end
