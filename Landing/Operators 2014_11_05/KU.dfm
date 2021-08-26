object fm_KU: Tfm_KU
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fm_KU'
  ClientHeight = 558
  ClientWidth = 1048
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 410
    Top = 10
    Width = 304
    Height = 539
    BevelKind = bkFlat
    BevelOuter = bvNone
    Constraints.MinHeight = 30
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 300
      Height = 25
      Align = alTop
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
      Transparent = False
      ExplicitLeft = 55
      ExplicitTop = 11
      ExplicitWidth = 42
      ExplicitHeight = 18
    end
    object Panel7: TPanel
      Left = 5
      Top = 30
      Width = 290
      Height = 75
      BevelKind = bkFlat
      BevelOuter = bvNone
      Constraints.MinHeight = 30
      TabOrder = 0
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 286
        Height = 25
        Align = alTop
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
        Transparent = False
        ExplicitLeft = 55
        ExplicitTop = 11
        ExplicitWidth = 42
        ExplicitHeight = 18
      end
      object Button1: TButton
        Left = 16
        Top = 35
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
        Top = 35
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
    object Panel10: TPanel
      Left = 5
      Top = 103
      Width = 290
      Height = 75
      BevelKind = bkFlat
      BevelOuter = bvNone
      Constraints.MinHeight = 30
      TabOrder = 1
      object Label4: TLabel
        Left = 0
        Top = 0
        Width = 286
        Height = 25
        Align = alTop
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
        Transparent = False
        ExplicitLeft = 55
        ExplicitTop = 11
        ExplicitWidth = 42
        ExplicitHeight = 18
      end
      object Button3: TButton
        Left = 16
        Top = 35
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
        Top = 35
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
        Top = 35
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
    object Panel13: TPanel
      Left = 5
      Top = 177
      Width = 290
      Height = 75
      BevelKind = bkFlat
      BevelOuter = bvNone
      Constraints.MinHeight = 30
      TabOrder = 2
      object Label5: TLabel
        Left = 0
        Top = 0
        Width = 286
        Height = 25
        Align = alTop
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
        Transparent = False
        ExplicitLeft = 1
        ExplicitTop = 4
        ExplicitWidth = 302
      end
      object Button6: TButton
        Left = 16
        Top = 35
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
        Top = 35
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
        Top = 35
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
    object Panel16: TPanel
      Left = 5
      Top = 251
      Width = 290
      Height = 75
      BevelKind = bkFlat
      BevelOuter = bvNone
      Constraints.MinHeight = 30
      TabOrder = 3
      object Label6: TLabel
        Left = 0
        Top = 0
        Width = 286
        Height = 25
        Align = alTop
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
        Transparent = False
        ExplicitLeft = 55
        ExplicitTop = 11
        ExplicitWidth = 42
        ExplicitHeight = 18
      end
      object Button9: TButton
        Left = 16
        Top = 35
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
        Top = 35
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
    object Panel19: TPanel
      Left = 5
      Top = 325
      Width = 290
      Height = 75
      BevelKind = bkFlat
      BevelOuter = bvNone
      Constraints.MinHeight = 30
      TabOrder = 4
      Visible = False
      object Label7: TLabel
        Left = 0
        Top = 0
        Width = 286
        Height = 25
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Adjustment of cable correction "Y"'
        Color = clBackground
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        ExplicitLeft = 55
        ExplicitTop = 11
        ExplicitWidth = 42
        ExplicitHeight = 18
      end
      object Label10: TLabel
        Left = 10
        Top = 40
        Width = 31
        Height = 16
        Caption = 'YCG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 150
        Top = 40
        Width = 29
        Height = 16
        Caption = 'YCE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bYCG: TSpeedButton
        Left = 112
        Top = 35
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
      object bYCE: TSpeedButton
        Left = 252
        Top = 35
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
        Top = 35
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
      object eYCE: TEdit
        Left = 185
        Top = 35
        Width = 50
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '0'
      end
      object udYCG: TUpDown
        Left = 95
        Top = 35
        Width = 17
        Height = 25
        Max = 200
        TabOrder = 2
      end
      object udYCE: TUpDown
        Left = 235
        Top = 35
        Width = 17
        Height = 25
        TabOrder = 3
      end
    end
    object Panel22: TPanel
      Left = 5
      Top = 399
      Width = 290
      Height = 75
      BevelKind = bkFlat
      BevelOuter = bvNone
      Constraints.MinHeight = 30
      TabOrder = 5
      Visible = False
      object Label8: TLabel
        Left = 0
        Top = 0
        Width = 286
        Height = 25
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Adjustement of Cable correction "C"'
        Color = clBackground
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        ExplicitLeft = 55
        ExplicitTop = 11
        ExplicitWidth = 42
        ExplicitHeight = 18
      end
      object Label12: TLabel
        Left = 10
        Top = 40
        Width = 31
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
        Left = 112
        Top = 35
        Width = 26
        Height = 25
        Hint = 'To apply'
        Enabled = False
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
        Left = 150
        Top = 40
        Width = 29
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
        Left = 252
        Top = 35
        Width = 26
        Height = 25
        Hint = 'To apply'
        Enabled = False
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
        Top = 35
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
        Top = 35
        Width = 17
        Height = 24
        Enabled = False
        Max = 200
        TabOrder = 1
      end
      object eCCE: TEdit
        Left = 185
        Top = 35
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
        Left = 235
        Top = 35
        Width = 17
        Height = 24
        Enabled = False
        TabOrder = 3
      end
    end
    object Panel28: TPanel
      Left = 5
      Top = 480
      Width = 290
      Height = 50
      BevelOuter = bvNone
      Color = clMedGray
      TabOrder = 6
      Visible = False
      object Button15: TButton
        Left = 16
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
        Left = 104
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
        Left = 192
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
  object Panel2: TPanel
    Left = 9
    Top = 10
    Width = 396
    Height = 539
    BevelKind = bkFlat
    BevelOuter = bvNone
    Constraints.MinHeight = 30
    TabOrder = 1
    object Label3: TLabel
      Left = 0
      Top = 0
      Width = 392
      Height = 25
      Align = alTop
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
      Transparent = False
      ExplicitLeft = 55
      ExplicitTop = 11
      ExplicitWidth = 42
      ExplicitHeight = 18
    end
    object Panel4: TPanel
      Left = 0
      Top = 25
      Width = 392
      Height = 510
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 28
      ExplicitWidth = 391
      object Edit1: TEdit
        Left = 5
        Top = 5
        Width = 275
        Height = 22
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
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit2: TEdit
        Left = 282
        Top = 5
        Width = 106
        Height = 22
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
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit3: TEdit
        Left = 5
        Top = 30
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = '  Data exchange'
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e1: TEdit
        Left = 282
        Top = 30
        Width = 106
        Height = 22
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = '  YES'
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit5: TEdit
        Left = 5
        Top = 55
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = '  Power Supply of  TV device'
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit6: TEdit
        Left = 5
        Top = 80
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = '  TV device Voltage Supply (V) '
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit7: TEdit
        Left = 5
        Top = 105
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Text = '  Temperature in TVD Housing (degree C) '
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit8: TEdit
        Left = 5
        Top = 130
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        Text = '  Sign of authenticity of temperature'
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit9: TEdit
        Left = 5
        Top = 155
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Text = '  Humidity in TVD Housing  (%)'
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit10: TEdit
        Left = 5
        Top = 180
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        Text = '  Power Supply of FAN'
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit11: TEdit
        Left = 5
        Top = 205
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        Text = '  RPM of FAN'
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit12: TEdit
        Left = 5
        Top = 280
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
        Text = '  Sign of good condition of Heating'
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit13: TEdit
        Left = 5
        Top = 305
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        Text = '  Heater Operation Mode '
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit14: TEdit
        Left = 5
        Top = 255
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
        Text = '  Power Supply of Heater  '
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit15: TEdit
        Left = 5
        Top = 230
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
        Text = '  Fan Operation Mode  '
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit16: TEdit
        Left = 5
        Top = 480
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
        Text = '  "C" Channel Equalization (YCE) '
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit17: TEdit
        Left = 5
        Top = 330
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 16
        Text = '  "Y" Video Out (SYNC) '
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit19: TEdit
        Left = 5
        Top = 355
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 17
        Text = '  "C"  Video Out '
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit18: TEdit
        Left = 5
        Top = 380
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
        Text = '  Power Supply of test LED'
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit20: TEdit
        Left = 5
        Top = 405
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 19
        Text = '  "Y" Channel Gain (YCG)  '
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit21: TEdit
        Left = 5
        Top = 430
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 20
        Text = '  "Y"Channel Equalization  (YCE) '
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object Edit22: TEdit
        Left = 5
        Top = 455
        Width = 275
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 21
        Text = '  "C" Channel Gain (CCG) '
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e2: TEdit
        Left = 282
        Top = 55
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 22
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e3: TEdit
        Left = 282
        Top = 80
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 23
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e4: TEdit
        Left = 282
        Top = 105
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 24
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e5: TEdit
        Left = 282
        Top = 130
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 25
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e6: TEdit
        Left = 282
        Top = 155
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 26
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e7: TEdit
        Left = 282
        Top = 180
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 27
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e8: TEdit
        Left = 282
        Top = 205
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 28
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e9: TEdit
        Left = 282
        Top = 230
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 29
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e10: TEdit
        Left = 282
        Top = 255
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 30
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e11: TEdit
        Left = 282
        Top = 280
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 31
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e12: TEdit
        Left = 282
        Top = 305
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 32
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e13: TEdit
        Left = 282
        Top = 330
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 33
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e14: TEdit
        Left = 282
        Top = 355
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 34
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e15: TEdit
        Left = 282
        Top = 380
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 35
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e16: TEdit
        Left = 282
        Top = 405
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 36
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e17: TEdit
        Left = 282
        Top = 430
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 37
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e18: TEdit
        Left = 282
        Top = 455
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 38
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
      object e19: TEdit
        Left = 282
        Top = 480
        Width = 106
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 39
        OnEnter = Edit1Enter
        OnExit = Edit1Exit
      end
    end
  end
  object Panel25: TPanel
    Left = 719
    Top = 10
    Width = 320
    Height = 539
    BevelKind = bkFlat
    BevelOuter = bvNone
    Constraints.MinHeight = 30
    TabOrder = 2
    object Label9: TLabel
      Left = 0
      Top = 0
      Width = 316
      Height = 25
      Align = alTop
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
      Transparent = False
      ExplicitLeft = 55
      ExplicitTop = 11
      ExplicitWidth = 42
      ExplicitHeight = 18
    end
    object RichEdit1: TRichEdit
      Left = 0
      Top = 25
      Width = 316
      Height = 510
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
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 443
      ExplicitHeight = 338
    end
  end
end
