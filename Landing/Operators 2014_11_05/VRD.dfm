object fm_VRD: Tfm_VRD
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 384
  ClientWidth = 356
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
  object Panel1: TPanel
    Left = 8
    Top = 76
    Width = 338
    Height = 65
    Constraints.MinHeight = 30
    TabOrder = 0
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
    Top = 147
    Width = 338
    Height = 113
    Constraints.MinHeight = 30
    TabOrder = 1
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
      Height = 84
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitHeight = 191
      object StringGrid1: TStringGrid
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
    Top = 266
    Width = 338
    Height = 110
    Constraints.MinHeight = 30
    TabOrder = 2
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
      object StringGrid2: TStringGrid
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
  object Panel7: TPanel
    Left = 10
    Top = 8
    Width = 335
    Height = 62
    Constraints.MinHeight = 28
    TabOrder = 3
    object Panel8: TPanel
      Left = 1
      Top = 1
      Width = 333
      Height = 25
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'WS and VRD'
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 316
      object i3: TImage
        Left = 1
        Top = 1
        Width = 331
        Height = 23
        Align = alClient
        ExplicitWidth = 314
      end
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 331
        Height = 23
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'Data exchange'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 314
      end
    end
    object Panel9: TPanel
      Left = 1
      Top = 26
      Width = 333
      Height = 35
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 316
      object Edit3: TEdit
        Left = 4
        Top = 6
        Width = 245
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = ' Data exchange'
      end
      object Edit4: TEdit
        Left = 247
        Top = 6
        Width = 85
        Height = 23
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Text = '  Yes'
      end
    end
  end
end
