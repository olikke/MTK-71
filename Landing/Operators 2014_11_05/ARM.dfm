object fm_ARM: Tfm_ARM
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 610
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel7: TPanel
    Left = 8
    Top = 79
    Width = 338
    Height = 110
    Constraints.MinHeight = 30
    TabOrder = 0
    object Panel8: TPanel
      Left = 1
      Top = 1
      Width = 336
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
        Width = 334
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
        Width = 334
        Height = 25
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'Ship system'
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
      Width = 336
      Height = 81
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Edit1: TEdit
        Left = 4
        Top = 6
        Width = 245
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = ' OLS "Luna-3E"'
      end
      object Edit2: TEdit
        Left = 247
        Top = 6
        Width = 85
        Height = 24
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '  Yes'
      end
      object Edit3: TEdit
        Left = 5
        Top = 30
        Width = 245
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = ' NS "Ilmen-71"'
      end
      object Edit4: TEdit
        Left = 247
        Top = 30
        Width = 85
        Height = 24
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = '  Yes'
      end
      object Edit5: TEdit
        Left = 4
        Top = 54
        Width = 245
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = ' RACS'
      end
      object Edit6: TEdit
        Left = 247
        Top = 54
        Width = 85
        Height = 24
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = '  Yes'
      end
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 195
    Width = 338
    Height = 65
    Constraints.MinHeight = 30
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 336
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
        Width = 334
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
        Width = 334
        Height = 25
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'Video state'
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
    object Panel3: TPanel
      Left = 1
      Top = 28
      Width = 336
      Height = 36
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Edit7: TEdit
        Left = 4
        Top = 6
        Width = 245
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = ' Presence of video  signal'
      end
      object Edit8: TEdit
        Left = 247
        Top = 6
        Width = 85
        Height = 24
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '  Yes'
      end
    end
  end
  object Panel4: TPanel
    Left = 8
    Top = 266
    Width = 338
    Height = 220
    Constraints.MinHeight = 30
    TabOrder = 2
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 336
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
        Width = 334
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
        Width = 334
        Height = 25
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'Hard disk space'
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
      Width = 336
      Height = 191
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object StringGrid3: TStringGrid
        Left = 1
        Top = 1
        Width = 334
        Height = 82
        Align = alTop
        Color = clWhite
        ColCount = 4
        DefaultColWidth = 80
        FixedCols = 0
        RowCount = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnDrawCell = StringGrid1DrawCell
      end
    end
  end
  object Panel10: TPanel
    Left = 8
    Top = 492
    Width = 338
    Height = 110
    Constraints.MinHeight = 30
    TabOrder = 3
    object Panel11: TPanel
      Left = 1
      Top = 1
      Width = 336
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
        Width = 334
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
        Width = 334
        Height = 25
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'LAN connection'
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
      Width = 336
      Height = 81
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object StringGrid4: TStringGrid
        Left = 1
        Top = 1
        Width = 334
        Height = 80
        Align = alTop
        Color = clWhite
        ColCount = 2
        DefaultColWidth = 164
        Enabled = False
        FixedCols = 0
        RowCount = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ScrollBars = ssNone
        TabOrder = 0
        OnDrawCell = StringGrid2DrawCell
      end
    end
  end
  object Panel13: TPanel
    Left = 8
    Top = 8
    Width = 338
    Height = 65
    Constraints.MinHeight = 30
    TabOrder = 4
    object Panel14: TPanel
      Left = 1
      Top = 1
      Width = 336
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
        Width = 334
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
        Width = 334
        Height = 25
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'Data exchange'
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
    object Panel15: TPanel
      Left = 1
      Top = 28
      Width = 336
      Height = 36
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Edit9: TEdit
        Left = 4
        Top = 6
        Width = 245
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = ' Data exchange'
      end
      object Edit10: TEdit
        Left = 247
        Top = 6
        Width = 85
        Height = 24
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '  Yes'
      end
    end
  end
end
