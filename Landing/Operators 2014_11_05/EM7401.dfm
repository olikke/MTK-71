object fm7401: Tfm7401
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fm7401'
  ClientHeight = 425
  ClientWidth = 906
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 19
  object Panel15: TPanel
    Left = 440
    Top = 5
    Width = 453
    Height = 416
    Constraints.MinHeight = 30
    TabOrder = 0
    object Panel16: TPanel
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
      object Label4: TLabel
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
    object Panel17: TPanel
      Left = 1
      Top = 28
      Width = 451
      Height = 387
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitHeight = 434
      object RichEdit1: TRichEdit
        Left = 1
        Top = 1
        Width = 449
        Height = 385
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
        ExplicitHeight = 432
      end
    end
  end
  object Panel6: TPanel
    Left = 5
    Top = 5
    Width = 429
    Height = 215
    Constraints.MinHeight = 30
    TabOrder = 1
    object Panel8: TPanel
      Left = 1
      Top = 1
      Width = 427
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
      ExplicitLeft = -1
      ExplicitTop = 0
      ExplicitWidth = 391
      object i1: TImage
        Left = 1
        Top = 1
        Width = 425
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
        Width = 425
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
      Width = 427
      Height = 186
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitLeft = -9
      ExplicitTop = 92
      ExplicitWidth = 391
      ExplicitHeight = 434
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
        Width = 140
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
        Width = 140
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
        Text = '  Device type code'
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
        Text = '  Hardware version'
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
        Text = '  Software version'
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
        Text = '  Serial number'
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
        Text = '  Device manufactoring date'
      end
      object e2: TEdit
        Left = 280
        Top = 55
        Width = 140
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
        Width = 140
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
        Width = 140
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
        Width = 140
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
        Width = 140
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
    end
  end
  object Panel12: TPanel
    Left = 5
    Top = 225
    Width = 429
    Height = 195
    Constraints.MinHeight = 30
    TabOrder = 2
    object Panel13: TPanel
      Left = 1
      Top = 1
      Width = 427
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
        Width = 425
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
        Width = 425
        Height = 25
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'Connects in Video Matrix Switch'
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
    object Panel14: TPanel
      Left = 1
      Top = 28
      Width = 427
      Height = 166
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitHeight = 186
      object Panel1: TPanel
        Left = -3
        Top = -23
        Width = 430
        Height = 209
        TabOrder = 0
        object Panel2: TPanel
          Left = 4
          Top = 25
          Width = 420
          Height = 176
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Image1: TImage
            Left = 0
            Top = 0
            Width = 420
            Height = 176
            Align = alClient
            ExplicitLeft = 2
          end
          object Label1: TLabel
            Left = 5
            Top = 0
            Width = 399
            Height = 17
            Caption = 
              'Source                 Input                Output       St     ' +
              '  Receiver'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Source1: TStaticText
            Left = 5
            Top = 32
            Width = 80
            Height = 25
            Align = alCustom
            Alignment = taCenter
            AutoSize = False
            BevelInner = bvSpace
            BevelKind = bkFlat
            BevelOuter = bvSpace
            BorderStyle = sbsSunken
            Caption = 'Axial 1'
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Cambria'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            Transparent = False
          end
          object Receiver1: TStaticText
            Left = 335
            Top = 32
            Width = 80
            Height = 25
            Align = alCustom
            Alignment = taCenter
            AutoSize = False
            BevelInner = bvSpace
            BevelKind = bkFlat
            BevelOuter = bvSpace
            BorderStyle = sbsSunken
            Caption = 'EM-3401'
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Cambria'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
            Transparent = False
          end
          object Source2: TStaticText
            Left = 4
            Top = 62
            Width = 80
            Height = 25
            Align = alCustom
            Alignment = taCenter
            AutoSize = False
            BevelInner = bvSpace
            BevelKind = bkFlat
            BevelOuter = bvSpace
            BorderStyle = sbsSunken
            Caption = 'Axial 1'
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Cambria'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 2
            Transparent = False
          end
          object Source3: TStaticText
            Left = 4
            Top = 92
            Width = 80
            Height = 25
            Align = alCustom
            Alignment = taCenter
            AutoSize = False
            BevelInner = bvSpace
            BevelKind = bkFlat
            BevelOuter = bvSpace
            BorderStyle = sbsSunken
            Caption = 'Right'
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Cambria'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 3
            Transparent = False
          end
          object Source4: TStaticText
            Left = 4
            Top = 122
            Width = 80
            Height = 25
            Align = alCustom
            Alignment = taCenter
            AutoSize = False
            BevelInner = bvSpace
            BevelKind = bkFlat
            BevelOuter = bvSpace
            BorderStyle = sbsSunken
            Caption = 'EM-3401'
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Cambria'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 4
            Transparent = False
          end
          object Receiver2: TStaticText
            Left = 335
            Top = 62
            Width = 80
            Height = 25
            Align = alCustom
            Alignment = taCenter
            AutoSize = False
            BevelInner = bvSpace
            BevelKind = bkFlat
            BevelOuter = bvSpace
            BorderStyle = sbsSunken
            Caption = 'CWS'
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Cambria'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 5
            Transparent = False
          end
          object Receiver3: TStaticText
            Left = 335
            Top = 92
            Width = 80
            Height = 25
            Align = alCustom
            Alignment = taCenter
            AutoSize = False
            BevelInner = bvSpace
            BevelKind = bkFlat
            BevelOuter = bvSpace
            BorderStyle = sbsSunken
            Caption = 'RWS'
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Cambria'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 6
            Transparent = False
          end
          object Receiver4: TStaticText
            Left = 335
            Top = 122
            Width = 80
            Height = 25
            Align = alCustom
            Alignment = taCenter
            AutoSize = False
            BevelInner = bvSpace
            BevelKind = bkFlat
            BevelOuter = bvSpace
            BorderStyle = sbsSunken
            Caption = 'Landing'
            Color = clSkyBlue
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Cambria'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 7
            Transparent = False
          end
          object Panel3: TPanel
            Left = 102
            Top = 25
            Width = 217
            Height = 131
            BevelKind = bkFlat
            BevelOuter = bvNone
            BevelWidth = 2
            TabOrder = 8
            object Image2: TImage
              Left = 0
              Top = 0
              Width = 213
              Height = 127
              Align = alClient
              ExplicitLeft = 88
              ExplicitTop = 56
              ExplicitWidth = 105
              ExplicitHeight = 105
            end
            object St1: TShape
              Left = 187
              Top = 7
              Width = 20
              Height = 20
              Hint = 'Presence of video of signals on the outputs of block'
              Brush.Color = clLime
              ParentShowHint = False
              Pen.Color = clNavy
              Shape = stCircle
              ShowHint = True
            end
            object St2: TShape
              Left = 187
              Top = 37
              Width = 20
              Height = 20
              Hint = 'Presence of video of signals on the outputs of block'
              Brush.Color = clLime
              ParentShowHint = False
              Pen.Color = clNavy
              Shape = stCircle
              ShowHint = True
            end
            object St3: TShape
              Left = 187
              Top = 67
              Width = 20
              Height = 20
              Hint = 'Presence of video of signals on the outputs of block'
              Brush.Color = clLime
              ParentShowHint = False
              Pen.Color = clNavy
              Shape = stCircle
              ShowHint = True
            end
            object St4: TShape
              Left = 187
              Top = 97
              Width = 20
              Height = 20
              Hint = 'Presence of video of signals on the outputs of block'
              Brush.Color = clLime
              ParentShowHint = False
              Pen.Color = clNavy
              Shape = stCircle
              ShowHint = True
            end
            object In1: TStaticText
              Left = 5
              Top = 5
              Width = 70
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 1'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Cambria'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              Transparent = False
            end
            object Out1: TStaticText
              Left = 110
              Top = 5
              Width = 70
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 1,2'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Cambria'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              Transparent = False
            end
            object In2: TStaticText
              Left = 5
              Top = 35
              Width = 70
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 1'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Cambria'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 2
              Transparent = False
            end
            object In3: TStaticText
              Left = 5
              Top = 65
              Width = 70
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 2'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Cambria'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 3
              Transparent = False
            end
            object In4: TStaticText
              Left = 5
              Top = 95
              Width = 70
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 5,6'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Cambria'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 4
              Transparent = False
            end
            object Out2: TStaticText
              Left = 110
              Top = 35
              Width = 70
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 3,4'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Cambria'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 5
              Transparent = False
            end
            object Out3: TStaticText
              Left = 110
              Top = 65
              Width = 70
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 5,6'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Cambria'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 6
              Transparent = False
            end
            object Out4: TStaticText
              Left = 110
              Top = 95
              Width = 70
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 7,8'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Cambria'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 7
              Transparent = False
            end
          end
        end
      end
    end
  end
  object Panel18: TPanel
    Left = 6
    Top = 426
    Width = 429
    Height = 319
    Constraints.MinHeight = 30
    TabOrder = 3
    object Panel19: TPanel
      Left = 1
      Top = 1
      Width = 427
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
        Width = 425
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
        Width = 425
        Height = 25
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'Connects in Video Matrix Switch (extended)'
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
      Width = 427
      Height = 290
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitHeight = 166
      object Panel21: TPanel
        Left = -3
        Top = -23
        Width = 430
        Height = 360
        TabOrder = 0
        object Panel4: TPanel
          Left = 0
          Top = 10
          Width = 430
          Height = 308
          Color = clSkyBlue
          TabOrder = 0
          object Image3: TImage
            Left = 59
            Top = 40
            Width = 91
            Height = 218
          end
          object Image4: TImage
            Left = 274
            Top = 40
            Width = 91
            Height = 218
          end
          object Label2: TLabel
            Left = 8
            Top = 16
            Width = 400
            Height = 17
            Caption = 
              'Input                         Output   Set    St                ' +
              '          Input'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel5: TPanel
            Left = 5
            Top = 40
            Width = 54
            Height = 218
            TabOrder = 0
            object In100: TStaticText
              Left = 2
              Top = 2
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 1'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              Transparent = False
            end
            object In101: TStaticText
              Left = 2
              Top = 29
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 2'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              Transparent = False
            end
            object In102: TStaticText
              Left = 2
              Top = 56
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 3'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 2
              Transparent = False
            end
            object In103: TStaticText
              Left = 2
              Top = 83
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 4'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 3
              Transparent = False
            end
            object In104: TStaticText
              Left = 2
              Top = 110
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 5'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 4
              Transparent = False
            end
            object In105: TStaticText
              Left = 2
              Top = 137
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 6'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 5
              Transparent = False
            end
            object In106: TStaticText
              Left = 2
              Top = 164
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 7'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 6
              Transparent = False
            end
            object In107: TStaticText
              Left = 2
              Top = 191
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 8'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 7
              Transparent = False
            end
          end
          object Panel7: TPanel
            Left = 150
            Top = 40
            Width = 124
            Height = 218
            TabOrder = 1
            object Out100: TStaticText
              Left = 2
              Top = 2
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 1'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              Transparent = False
            end
            object Out101: TStaticText
              Left = 2
              Top = 29
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 2'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              Transparent = False
            end
            object Out102: TStaticText
              Left = 2
              Top = 56
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 3'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 2
              Transparent = False
            end
            object Out103: TStaticText
              Left = 2
              Top = 83
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 4'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 3
              Transparent = False
            end
            object Out104: TStaticText
              Left = 2
              Top = 110
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 5'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 4
              Transparent = False
            end
            object Out105: TStaticText
              Left = 2
              Top = 137
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 6'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 5
              Transparent = False
            end
            object Out106: TStaticText
              Left = 2
              Top = 164
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 7'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 6
              Transparent = False
            end
            object Out107: TStaticText
              Left = 2
              Top = 191
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 8'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 7
              Transparent = False
            end
            object Set0: TComboBox
              Left = 54
              Top = 0
              Width = 40
              Height = 24
              DropDownCount = 16
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ItemHeight = 16
              ParentFont = False
              TabOrder = 8
              Text = '1'
              OnChange = Set0Change
              OnClick = Set0Click
              OnEnter = Set0Enter
              Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                '10'
                '11'
                '12'
                '13'
                '14'
                '15'
                '16')
            end
            object Set1: TComboBox
              Left = 54
              Top = 29
              Width = 40
              Height = 24
              DropDownCount = 16
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ItemHeight = 16
              ParentFont = False
              TabOrder = 9
              Text = '1'
              OnChange = Set0Change
              OnClick = Set0Click
              OnEnter = Set0Enter
              Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                '10'
                '11'
                '12'
                '13'
                '14'
                '15'
                '16')
            end
            object Set2: TComboBox
              Left = 54
              Top = 56
              Width = 40
              Height = 24
              DropDownCount = 16
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ItemHeight = 16
              ParentFont = False
              TabOrder = 10
              Text = '1'
              OnChange = Set0Change
              OnClick = Set0Click
              OnEnter = Set0Enter
              Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                '10'
                '11'
                '12'
                '13'
                '14'
                '15'
                '16')
            end
            object Set3: TComboBox
              Left = 54
              Top = 83
              Width = 40
              Height = 24
              DropDownCount = 16
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ItemHeight = 16
              ParentFont = False
              TabOrder = 11
              Text = '1'
              OnChange = Set0Change
              OnClick = Set0Click
              OnEnter = Set0Enter
              Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                '10'
                '11'
                '12'
                '13'
                '14'
                '15'
                '16')
            end
            object Set4: TComboBox
              Left = 54
              Top = 110
              Width = 40
              Height = 24
              DropDownCount = 16
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ItemHeight = 16
              ParentFont = False
              TabOrder = 12
              Text = '1'
              OnChange = Set0Change
              OnClick = Set0Click
              OnEnter = Set0Enter
              Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                '10'
                '11'
                '12'
                '13'
                '14'
                '15'
                '16')
            end
            object Set5: TComboBox
              Left = 54
              Top = 136
              Width = 40
              Height = 24
              DropDownCount = 16
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ItemHeight = 16
              ParentFont = False
              TabOrder = 13
              Text = '1'
              OnChange = Set0Change
              OnClick = Set0Click
              OnEnter = Set0Enter
              Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                '10'
                '11'
                '12'
                '13'
                '14'
                '15'
                '16')
            end
            object Set6: TComboBox
              Left = 54
              Top = 164
              Width = 40
              Height = 24
              DropDownCount = 16
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ItemHeight = 16
              ParentFont = False
              TabOrder = 14
              Text = '1'
              OnChange = Set0Change
              OnClick = Set0Click
              OnEnter = Set0Enter
              Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                '10'
                '11'
                '12'
                '13'
                '14'
                '15'
                '16')
            end
            object Set7: TComboBox
              Left = 54
              Top = 191
              Width = 40
              Height = 24
              DropDownCount = 16
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ItemHeight = 16
              ParentFont = False
              TabOrder = 15
              Text = '1'
              OnChange = Set0Change
              OnClick = Set0Click
              OnEnter = Set0Enter
              Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                '10'
                '11'
                '12'
                '13'
                '14'
                '15'
                '16')
            end
            object Panel10: TPanel
              Left = 95
              Top = 0
              Width = 25
              Height = 217
              BevelOuter = bvNone
              Color = clSkyBlue
              TabOrder = 16
              object St101: TShape
                Left = 2
                Top = 4
                Width = 20
                Height = 20
                Hint = 'Presence of video of signals on the outputs of block'
                Brush.Color = clLime
                ParentShowHint = False
                Pen.Color = clNavy
                Shape = stCircle
                ShowHint = True
              end
              object St102: TShape
                Left = 2
                Top = 58
                Width = 20
                Height = 20
                Hint = 'Presence of video of signals on the outputs of block'
                Brush.Color = clLime
                ParentShowHint = False
                Pen.Color = clNavy
                Shape = stCircle
                ShowHint = True
              end
              object St103: TShape
                Left = 2
                Top = 112
                Width = 20
                Height = 20
                Hint = 'Presence of video of signals on the outputs of block'
                Brush.Color = clLime
                ParentShowHint = False
                Pen.Color = clNavy
                Shape = stCircle
                ShowHint = True
              end
              object St104: TShape
                Left = 2
                Top = 166
                Width = 20
                Height = 20
                Hint = 'Presence of video of signals on the outputs of block'
                Brush.Color = clLime
                ParentShowHint = False
                Pen.Color = clNavy
                Shape = stCircle
                ShowHint = True
              end
            end
          end
          object Panel9: TPanel
            Left = 365
            Top = 40
            Width = 54
            Height = 218
            TabOrder = 2
            object In108: TStaticText
              Left = 2
              Top = 2
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 9'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              Transparent = False
            end
            object In109: TStaticText
              Left = 2
              Top = 29
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 10'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              Transparent = False
            end
            object In110: TStaticText
              Left = 2
              Top = 56
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 11'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 2
              Transparent = False
            end
            object In111: TStaticText
              Left = 2
              Top = 83
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 12'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 3
              Transparent = False
            end
            object In112: TStaticText
              Left = 2
              Top = 110
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 13'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 4
              Transparent = False
            end
            object In113: TStaticText
              Left = 2
              Top = 137
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 14'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 5
              Transparent = False
            end
            object In114: TStaticText
              Left = 2
              Top = 164
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 15'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 6
              Transparent = False
            end
            object In115: TStaticText
              Left = 2
              Top = 191
              Width = 50
              Height = 25
              Align = alCustom
              Alignment = taCenter
              AutoSize = False
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvSpace
              BorderStyle = sbsSunken
              Caption = 'N 16'
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 7
              Transparent = False
            end
          end
          object Button1: TButton
            Left = 59
            Top = 270
            Width = 75
            Height = 25
            Caption = 'Applay'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 156
            Top = 270
            Width = 75
            Height = 25
            Caption = 'Cancel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            OnClick = Button2Click
          end
          object Button3: TButton
            Left = 258
            Top = 270
            Width = 75
            Height = 25
            Caption = 'Close'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            OnClick = Button3Click
          end
        end
      end
    end
  end
end
