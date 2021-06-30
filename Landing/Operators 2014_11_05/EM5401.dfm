object fm5401: Tfm5401
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fm5401'
  ClientHeight = 554
  ClientWidth = 882
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
  object Panel6: TPanel
    Left = 5
    Top = 5
    Width = 500
    Height = 315
    Constraints.MinHeight = 30
    TabOrder = 0
    object Panel8: TPanel
      Left = 1
      Top = 1
      Width = 498
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
      ExplicitWidth = 427
      object i1: TImage
        Left = 1
        Top = 1
        Width = 496
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
        Width = 496
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
    object Panel11: TPanel
      Left = 1
      Top = 28
      Width = 498
      Height = 286
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 427
      ExplicitHeight = 186
      object Edit3: TEdit
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
      object Edit4: TEdit
        Left = 280
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
        TabOrder = 1
        Text = '  State'
      end
      object Edit5: TEdit
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
        Width = 100
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
      object Edit6: TEdit
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
      object Edit7: TEdit
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
      object Edit8: TEdit
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
      object Edit9: TEdit
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
      object Edit10: TEdit
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
      object e2: TEdit
        Left = 280
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
        TabOrder = 9
      end
      object e3: TEdit
        Left = 280
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
        TabOrder = 10
      end
      object e4: TEdit
        Left = 280
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
        TabOrder = 11
      end
      object e5: TEdit
        Left = 280
        Top = 130
        Width = 100
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object e6: TEdit
        Left = 280
        Top = 155
        Width = 100
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
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
        TabOrder = 14
        Text = '  Power supply level N 1'
      end
      object Edit20: TEdit
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
        TabOrder = 15
        Text = '  Threshold level of power supply N 1'
      end
      object Edit21: TEdit
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
        TabOrder = 16
        Text = '  Power supply level N 2'
      end
      object Edit22: TEdit
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
        TabOrder = 17
        Text = '  Threshold level of power supply N 2'
      end
      object e7: TEdit
        Left = 280
        Top = 180
        Width = 100
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
      end
      object e8: TEdit
        Left = 280
        Top = 205
        Width = 100
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
      object e9: TEdit
        Left = 280
        Top = 230
        Width = 100
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
      object e10: TEdit
        Left = 280
        Top = 255
        Width = 100
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
      object Panel1: TPanel
        Left = 380
        Top = 67
        Width = 114
        Height = 219
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = clSkyBlue
        TabOrder = 22
        Visible = False
        object Edit1: TEdit
          Left = 5
          Top = 135
          Width = 50
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -14
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '0'
          OnChange = Edit1Change
          OnClick = Edit1Click
          OnExit = Edit1Exit
        end
        object UpDown1: TUpDown
          Left = 55
          Top = 135
          Width = 16
          Height = 25
          Associate = Edit1
          Max = 255
          TabOrder = 1
          OnClick = UpDown1Click
        end
        object Edit2: TEdit
          Left = 5
          Top = 184
          Width = 50
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -14
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = '0'
          OnChange = Edit1Change
          OnClick = Edit1Click
          OnExit = Edit1Exit
        end
        object UpDown2: TUpDown
          Left = 55
          Top = 184
          Width = 16
          Height = 25
          Associate = Edit2
          Max = 255
          TabOrder = 3
          OnClick = UpDown1Click
        end
        object Button1: TButton
          Left = 25
          Top = 11
          Width = 64
          Height = 25
          Caption = 'Applay'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = Button1Click
        end
        object Button12: TButton
          Left = 25
          Top = 53
          Width = 64
          Height = 25
          Caption = 'Cancel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = Button12Click
        end
        object Button13: TButton
          Left = 25
          Top = 97
          Width = 64
          Height = 25
          Caption = 'Close'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnClick = Button13Click
        end
        object BitBtn1: TBitBtn
          Left = 75
          Top = 135
          Width = 23
          Height = 25
          TabOrder = 7
          OnClick = BitBtn1Click
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
        end
        object BitBtn2: TBitBtn
          Left = 75
          Top = 184
          Width = 23
          Height = 25
          TabOrder = 8
          OnClick = BitBtn2Click
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
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 5
    Top = 325
    Width = 500
    Height = 220
    Constraints.MinHeight = 30
    TabOrder = 1
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 498
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
      ExplicitWidth = 515
      object i2: TImage
        Left = 1
        Top = 1
        Width = 496
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
        Width = 496
        Height = 25
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'Synchrosignal status'
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
    object Panel7: TPanel
      Left = 1
      Top = 28
      Width = 498
      Height = 191
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitTop = 33
      ExplicitWidth = 515
      ExplicitHeight = 277
      object Edit11: TEdit
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
      object Edit12: TEdit
        Left = 280
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
        Text = '  State'
      end
      object Edit13: TEdit
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
        Text = '  Outputs permission'
      end
      object Edit15: TEdit
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
        TabOrder = 3
        Text = '  Synchrogenerator '
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
        TabOrder = 4
        Text = '  Synchrosignal 1 (SYNC 1)'
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
        TabOrder = 5
        Text = '  Synchrosignal 2 (SYNC 2)'
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
        TabOrder = 6
        Text = '  Synchrosignal 3 (SYNC 3)'
      end
      object Edit25: TEdit
        Left = 5
        Top = 155
        Width = 275
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        Text = '  Synchrosignal 4 (SYNC 4)'
      end
      object Panel10: TPanel
        Left = 280
        Top = 30
        Width = 50
        Height = 25
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Color = clWhite
        TabOrder = 8
        object shape1: TShape
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
      object Panel9: TPanel
        Left = 280
        Top = 55
        Width = 50
        Height = 25
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Color = clWhite
        TabOrder = 9
        object shape2: TShape
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
        Left = 280
        Top = 80
        Width = 50
        Height = 25
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Color = clWhite
        TabOrder = 10
        object shape4: TShape
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
        Left = 280
        Top = 105
        Width = 50
        Height = 25
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Color = clWhite
        TabOrder = 11
        object shape5: TShape
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
      object Panel15: TPanel
        Left = 280
        Top = 130
        Width = 50
        Height = 25
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Color = clWhite
        TabOrder = 12
        object shape6: TShape
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
        Left = 280
        Top = 155
        Width = 50
        Height = 25
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Color = clWhite
        TabOrder = 13
        object shape7: TShape
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
  object Panel22: TPanel
    Left = 509
    Top = 5
    Width = 364
    Height = 540
    Constraints.MinHeight = 30
    TabOrder = 2
    object Panel23: TPanel
      Left = 1
      Top = 1
      Width = 362
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
      ExplicitWidth = 451
      object i3: TImage
        Left = 1
        Top = 1
        Width = 360
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
        Width = 360
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
      Width = 362
      Height = 511
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 451
      ExplicitHeight = 633
      object RichEdit1: TRichEdit
        Left = 1
        Top = 1
        Width = 360
        Height = 509
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
        ExplicitWidth = 449
        ExplicitHeight = 631
      end
    end
  end
end
