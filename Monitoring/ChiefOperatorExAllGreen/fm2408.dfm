object f2408: Tf2408
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'f2408'
  ClientHeight = 553
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Cambria'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel7: TPanel
    Left = 10
    Top = 87
    Width = 318
    Height = 62
    Constraints.MinHeight = 28
    TabOrder = 0
    object Panel8: TPanel
      Left = 1
      Top = 1
      Width = 316
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
      object i3: TImage
        Left = 1
        Top = 1
        Width = 314
        Height = 23
        Align = alClient
      end
      object Label2: TLabel
        Left = 1
        Top = 1
        Width = 314
        Height = 23
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'Video state'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object Panel9: TPanel
      Left = 1
      Top = 26
      Width = 316
      Height = 35
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Edit1: TEdit
        Left = 4
        Top = 6
        Width = 230
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = ' Presence of video  signal'
      end
      object Edit2: TEdit
        Left = 232
        Top = 6
        Width = 80
        Height = 23
        Color = clLime
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
  object Panel2: TPanel
    Left = 10
    Top = 165
    Width = 318
    Height = 207
    Constraints.MinHeight = 28
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 316
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
      object i1: TImage
        Left = 1
        Top = 1
        Width = 314
        Height = 23
        Align = alClient
      end
      object Label3: TLabel
        Left = 1
        Top = 1
        Width = 314
        Height = 23
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'Hard disk space'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 26
      Width = 316
      Height = 180
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object StringGrid1: TStringGrid
        Left = 1
        Top = 1
        Width = 314
        Height = 97
        Align = alTop
        Color = clWhite
        ColCount = 4
        DefaultColWidth = 80
        FixedCols = 0
        RowCount = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnDrawCell = StringGrid1DrawCell
      end
    end
  end
  object Panel1: TPanel
    Left = 10
    Top = 385
    Width = 318
    Height = 155
    Constraints.MinHeight = 28
    TabOrder = 2
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 316
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
      object i2: TImage
        Left = 1
        Top = 1
        Width = 314
        Height = 23
        Align = alClient
      end
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 314
        Height = 23
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'LAN connection'
        Color = clMedGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 26
      Width = 316
      Height = 128
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object StringGrid2: TStringGrid
        Left = 1
        Top = 1
        Width = 314
        Height = 122
        Align = alTop
        Color = clWhite
        ColCount = 2
        DefaultColWidth = 164
        Enabled = False
        FixedCols = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ScrollBars = ssNone
        TabOrder = 0
        OnDrawCell = StringGrid2DrawCell
      end
    end
  end
  object Panel10: TPanel
    Left = 10
    Top = 8
    Width = 318
    Height = 62
    Constraints.MinHeight = 28
    TabOrder = 3
    object Panel11: TPanel
      Left = 1
      Top = 1
      Width = 316
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
      object i4: TImage
        Left = 1
        Top = 1
        Width = 314
        Height = 23
        Align = alClient
      end
      object Label4: TLabel
        Left = 1
        Top = 1
        Width = 314
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
      end
    end
    object Panel12: TPanel
      Left = 1
      Top = 26
      Width = 316
      Height = 35
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Edit3: TEdit
        Left = 4
        Top = 6
        Width = 230
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
        Left = 232
        Top = 6
        Width = 80
        Height = 23
        Color = clLime
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
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 8
    Top = 24
  end
end
