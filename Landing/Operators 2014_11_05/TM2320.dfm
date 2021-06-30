object fm2320: Tfm2320
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Printing Device TM-2320 (A11)'
  ClientHeight = 1181
  ClientWidth = 1473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1332
    Top = 0
    Width = 141
    Height = 1181
    Align = alRight
    Color = clCream
    TabOrder = 0
    object Panel3: TPanel
      Left = 3
      Top = 5
      Width = 135
      Height = 599
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = 'MSD '
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      VerticalAlignment = taAlignTop
      object Label9: TLabel
        Left = 15
        Top = 28
        Width = 93
        Height = 16
        Caption = 'Start distance'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 95
        Top = 55
        Width = 11
        Height = 16
        Caption = 'm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 16
        Top = 90
        Width = 89
        Height = 16
        Caption = 'Stop distance'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 94
        Top = 115
        Width = 11
        Height = 16
        Caption = 'm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 22
        Top = 150
        Width = 8
        Height = 16
        Hint = 'Quantity of counts in sample'
        Caption = 'N'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label3: TLabel
        Left = 10
        Top = 208
        Width = 114
        Height = 16
        Caption = 'Measures system'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 104
        Top = 5
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333F7C7F3333333333F737373FF333333AFACCCAFA
          33333337737773773F3333AFAF7C7FAFA33333733337333373F33AFAFAFAFAFA
          FA3337F33333F33337F33FAFAFACAFAFAF3337333337F333373FFAFAFAFC7AFA
          FAF37F333337FF33337FAFAFAFACCFAFAFA37F3333377FF3337FFAFAFAFACCFA
          FAF37F33333377FF337FAFAF77AF7CCFAFA37F333FF3377F337FFAFACCFA7CCA
          FAF373F377F3377F33733FAFCC7F7CCFAF3337F377FFF77337F33AFAFCCCCCFA
          FA33373F37777733373333AFAFCCCFAFA3333373FF77733F7333333AFAFAFAFA
          3333333773FFFF77333333333FAFAF3333333333377777333333}
        NumGlyphs = 2
        Visible = False
        OnClick = SpeedButton1Click
      end
      object GroupBox3: TGroupBox
        Left = 10
        Top = 459
        Width = 110
        Height = 125
        Caption = 'RACS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label6: TLabel
          Left = 10
          Top = 20
          Width = 75
          Height = 14
          Hint = 'Mean square deviation of side deviation definition'
          Caption = 'MSD of SDD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label5: TLabel
          Left = 89
          Top = 48
          Width = 11
          Height = 16
          Caption = 'm'
        end
        object Label7: TLabel
          Left = 10
          Top = 70
          Width = 75
          Height = 14
          Hint = 'Mean square deviation of vertical deviation definition'
          Caption = 'MSD of VDD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label8: TLabel
          Left = 89
          Top = 98
          Width = 11
          Height = 16
          Caption = 'm'
        end
        object Edit4: TEdit
          Left = 10
          Top = 40
          Width = 73
          Height = 24
          Hint = 'Mean square deviation of side deviation definition'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = '0'
        end
        object Edit5: TEdit
          Left = 10
          Top = 90
          Width = 73
          Height = 24
          Hint = 'Mean square deviation of vertical deviation definition'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Text = '0'
        end
      end
      object GroupBox4: TGroupBox
        Left = 10
        Top = 323
        Width = 110
        Height = 130
        Caption = 'TV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label13: TLabel
          Left = 10
          Top = 20
          Width = 75
          Height = 14
          Hint = 'Mean square deviation of side deviation definition'
          Caption = 'MSD of SDD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label14: TLabel
          Left = 89
          Top = 48
          Width = 11
          Height = 16
          Caption = 'm'
        end
        object Label15: TLabel
          Left = 10
          Top = 70
          Width = 75
          Height = 14
          Hint = 'Mean square deviation of vertical deviation definition'
          Caption = 'MSD of VDD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label16: TLabel
          Left = 89
          Top = 98
          Width = 11
          Height = 16
          Caption = 'm'
        end
        object Edit8: TEdit
          Left = 10
          Top = 40
          Width = 73
          Height = 24
          Hint = 'Mean square deviation of side deviation definition'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = '0'
        end
        object Edit9: TEdit
          Left = 10
          Top = 90
          Width = 73
          Height = 24
          Hint = 'Mean square deviation of vertical deviation definition'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Text = '0'
        end
      end
      object Button1: TButton
        Left = 20
        Top = 275
        Width = 90
        Height = 30
        Caption = 'Calculation'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = Button1Click
      end
      object Edit6: TEdit
        Left = 25
        Top = 50
        Width = 66
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Text = '400'
        OnChange = Edit6Change
      end
      object Edit7: TEdit
        Left = 25
        Top = 110
        Width = 66
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        Text = '600'
        OnChange = Edit7Change
      end
      object Edit3: TEdit
        Left = 25
        Top = 170
        Width = 50
        Height = 24
        Hint = 'Quantity of counts in sample'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 5
        Text = '5'
        OnChange = Edit3Change
      end
      object UpDown1: TUpDown
        Left = 75
        Top = 170
        Width = 16
        Height = 24
        Associate = Edit3
        Min = 1
        Position = 5
        TabOrder = 6
      end
      object ComboBox1: TComboBox
        Left = 16
        Top = 230
        Width = 100
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 16
        ParentFont = False
        TabOrder = 7
        Text = 'SI'
        OnChange = ComboBox1Change
        Items.Strings = (
          'SI'
          'English')
      end
    end
    object Panel7: TPanel
      Left = 3
      Top = 607
      Width = 135
      Height = 570
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = 'Diagram'
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      VerticalAlignment = taAlignTop
      Visible = False
      object SpeedButton2: TSpeedButton
        Left = 104
        Top = 5
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333F7C7F3333333333F737373FF333333AFACCCAFA
          33333337737773773F3333AFAF7C7FAFA33333733337333373F33AFAFAFAFAFA
          FA3337F33333F33337F33FAFAFACAFAFAF3337333337F333373FFAFAFAFC7AFA
          FAF37F333337FF33337FAFAFAFACCFAFAFA37F3333377FF3337FFAFAFAFACCFA
          FAF37F33333377FF337FAFAF77AF7CCFAFA37F333FF3377F337FFAFACCFA7CCA
          FAF373F377F3377F33733FAFCC7F7CCFAF3337F377FFF77337F33AFAFCCCCCFA
          FA33373F37777733373333AFAFCCCFAFA3333373FF77733F7333333AFAFAFAFA
          3333333773FFFF77333333333FAFAF3333333333377777333333}
        NumGlyphs = 2
        Visible = False
      end
      object GroupBox5: TGroupBox
        Left = 10
        Top = 87
        Width = 110
        Height = 114
        Caption = 'RACS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object CheckBox1: TCheckBox
          Left = 15
          Top = 32
          Width = 47
          Height = 17
          Hint = 'Side deviation'
          Caption = 'SD'
          Checked = True
          ParentShowHint = False
          ShowHint = True
          State = cbChecked
          TabOrder = 0
          OnClick = CheckBox1Click
        end
        object CheckBox2: TCheckBox
          Left = 15
          Top = 72
          Width = 50
          Height = 17
          Hint = 'Vertical deviation'
          Caption = 'VD'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = CheckBox1Click
        end
        object Panel8: TPanel
          Left = 70
          Top = 24
          Width = 25
          Height = 25
          Color = clRed
          TabOrder = 2
          OnClick = Panel8Click
        end
        object Panel9: TPanel
          Left = 70
          Top = 72
          Width = 25
          Height = 25
          Color = clGreen
          TabOrder = 3
          OnClick = Panel9Click
        end
      end
      object GroupBox6: TGroupBox
        Left = 10
        Top = 207
        Width = 110
        Height = 114
        Caption = 'TV'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object CheckBox3: TCheckBox
          Left = 15
          Top = 32
          Width = 47
          Height = 17
          Hint = 'Side deviation'
          Caption = 'SD'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = CheckBox1Click
        end
        object CheckBox4: TCheckBox
          Left = 15
          Top = 72
          Width = 50
          Height = 17
          Hint = 'Vertical deviation'
          Caption = 'VD'
          TabOrder = 1
          OnClick = CheckBox1Click
        end
        object Panel10: TPanel
          Left = 70
          Top = 24
          Width = 25
          Height = 25
          Color = clBlue
          TabOrder = 2
          OnClick = Panel10Click
        end
        object Panel11: TPanel
          Left = 70
          Top = 72
          Width = 25
          Height = 25
          Color = clFuchsia
          TabOrder = 3
          OnClick = Panel11Click
        end
      end
      object Button4: TButton
        Left = 32
        Top = 528
        Width = 75
        Height = 25
        Caption = 'Print'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = Button4Click
      end
      object CheckBox5: TCheckBox
        Left = 11
        Top = 505
        Width = 117
        Height = 17
        Caption = 'Approximate'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 3
        Visible = False
        OnClick = CheckBox5Click
      end
      object ComboBox2: TComboBox
        Left = 3
        Top = 40
        Width = 126
        Height = 25
        ItemHeight = 17
        TabOrder = 4
        Text = 'f(D) RACS'
        OnChange = ComboBox2Change
        Items.Strings = (
          'f(D) RACS'
          'f(D) TV'
          'f(N)')
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 1332
    Height = 1181
    Align = alClient
    Color = clBtnShadow
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 1
      Top = 771
      Width = 1330
      Height = 5
      Cursor = crVSplit
      Align = alBottom
      Beveled = True
      Color = cl3DDkShadow
      ParentColor = False
      ExplicitTop = 753
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 1330
      Height = 770
      Align = alClient
      Caption = 'Panel5'
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 1
        Top = 1
        Width = 457
        Height = 723
        Align = alLeft
        Caption = 'List of protocols'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object DBProtocol: TDBGrid
          Left = 2
          Top = 18
          Width = 453
          Height = 703
          Align = alClient
          DataSource = DProtocol
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = DBProtocolCellClick
          OnDrawColumnCell = DBProtocolDrawColumnCell
          OnKeyUp = FormKeyUp
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Check'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = '*'
              Width = 30
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'StartDate'
              Title.Alignment = taCenter
              Width = 140
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'fGlidepath'
              Title.Alignment = taCenter
              Width = 60
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'KUList'
              Title.Alignment = taCenter
              Width = 90
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NameOp'
              Title.Alignment = taCenter
              Width = 90
              Visible = True
            end>
        end
      end
      object GroupBox2: TGroupBox
        Left = 462
        Top = 1
        Width = 867
        Height = 723
        Align = alRight
        Caption = 'List of protocols'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object DBGrid1: TDBGrid
          Left = 2
          Top = 18
          Width = 863
          Height = 703
          Align = alClient
          DataSource = DData
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnKeyUp = FormKeyUp
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'num'
              Title.Alignment = taCenter
              Title.Caption = 'N'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fDrl'
              Title.Alignment = taCenter
              Title.Caption = 'Drl [m]'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fDnrl'
              Title.Alignment = taCenter
              Title.Caption = 'Dnrl [m]'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fDntv'
              Title.Alignment = taCenter
              Title.Caption = 'Dntv [m]'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fLRrl'
              Title.Alignment = taCenter
              Title.Caption = 'LRrl [m]'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fLRtv'
              Title.Alignment = taCenter
              Title.Caption = 'LRtv [m]'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fUDrl'
              Title.Alignment = taCenter
              Title.Caption = 'UDrl [m]'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fUDtv'
              Title.Alignment = taCenter
              Title.Caption = 'UDtv [m]'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fDTime'
              Title.Alignment = taCenter
              Title.Caption = 'Time [h:m:s:ms]'
              Width = 120
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'fTracking'
              Title.Alignment = taCenter
              Title.Caption = 'Tracking'
              Width = 100
              Visible = True
            end>
        end
      end
      object Panel12: TPanel
        Left = 1
        Top = 724
        Width = 1328
        Height = 45
        Align = alBottom
        TabOrder = 2
        object Label1: TLabel
          Left = 465
          Top = 14
          Width = 46
          Height = 16
          Caption = 'Start N'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 615
          Top = 14
          Width = 46
          Height = 16
          Caption = 'Stop  N'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 992
          Top = 16
          Width = 36
          Height = 13
          Caption = 'Ready'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Button3: TButton
          Left = 52
          Top = 6
          Width = 90
          Height = 30
          Caption = 'Delete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = Button3Click
        end
        object Edit1: TEdit
          Left = 517
          Top = 9
          Width = 60
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Text = '1'
          OnChange = Edit6Change
        end
        object Edit2: TEdit
          Left = 667
          Top = 9
          Width = 60
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Text = '1'
        end
        object Button2: TButton
          Left = 788
          Top = 6
          Width = 90
          Height = 30
          Caption = 'Print '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = Button2Click
        end
        object Button5: TButton
          Left = 884
          Top = 6
          Width = 90
          Height = 30
          Caption = 'Save as...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = Button5Click
        end
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 776
      Width = 1330
      Height = 404
      Align = alBottom
      TabOrder = 1
      OnResize = Panel6Resize
      object Chart1: TChart
        Left = 1
        Top = 1
        Width = 1328
        Height = 402
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Gradient.EndColor = 14286847
        Gradient.StartColor = clSilver
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.Title.Caption = 'Distance, m'
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Maximum = 1268.000000000000000000
        LeftAxis.Minimum = 578.000000000000000000
        LeftAxis.Title.Caption = 'Deviation, m'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -13
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = []
        Legend.Alignment = laBottom
        Legend.ColorWidth = 40
        Legend.LegendStyle = lsSeries
        Legend.ShadowSize = 0
        Legend.TopPos = 0
        Legend.Visible = False
        View3D = False
        Align = alClient
        Color = clWindow
        TabOrder = 0
        Visible = False
        OnMouseMove = Chart1MouseMove
        object StaticText1: TStaticText
          Left = 1104
          Top = 376
          Width = 4
          Height = 4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object Series3: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'Side deviation by TV'
          LinePen.Color = clBlue
          LinePen.Width = 2
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series4: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clFuchsia
          Title = 'Vertical deviation by TV'
          LinePen.Color = clFuchsia
          LinePen.Width = 2
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series1: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Side deviation by RACS'
          LinePen.Color = clRed
          LinePen.Width = 2
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series2: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Vertical deviation by RACS'
          LinePen.Color = clGreen
          LinePen.Width = 2
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
    end
  end
  object QProtocol: TQuery
    AfterScroll = QProtocolAfterScroll
    DatabaseName = 'work'
    SQL.Strings = (
      
        'Select Protocol_ID,StartDate,Glidepath,KUList,NameOp,Number, Typ' +
        'e,'
      
        'CAST(CAST(Glidepath as integer) as CHAR(1))+CAST('#39#176#39' as CHAR(1))' +
        '+CAST(  CAST((  CAST(Glidepath as Decimal(3,2))-(CAST(Glidepath ' +
        'as integer) ))*60 as Integer) as CHAR(2)) + CAST('#39#39#39#39' as CHAR(1)' +
        ') as fGlidepath'
      'from Protocol'
      'JOIN Password'
      'on Protocol.Operator=Password.Pass'
      'order by StartDate desc')
    Left = 16
    Top = 268
    object QProtocolCheck: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Check'
      Calculated = True
    end
    object QProtocolProtocol_ID: TIntegerField
      FieldName = 'Protocol_ID'
      Origin = 'WORK.Protocol.Protocol_ID'
    end
    object QProtocolStartDate: TDateTimeField
      FieldName = 'StartDate'
      Origin = 'WORK.Protocol.StartDate'
    end
    object QProtocolGlidepath: TFloatField
      FieldName = 'Glidepath'
      Origin = 'WORK.Protocol.Glidepath'
    end
    object QProtocolKUList: TStringField
      FieldName = 'KUList'
      Origin = 'WORK.Protocol.KUList'
    end
    object QProtocolfGlidepath: TStringField
      FieldName = 'fGlidepath'
      Size = 12
    end
    object QProtocolNumber: TStringField
      FieldName = 'Number'
      Size = 50
    end
    object QProtocolType: TStringField
      FieldName = 'Type'
      Size = 50
    end
    object QProtocolNameOp: TStringField
      FieldName = 'NameOp'
      Size = 50
    end
  end
  object DProtocol: TDataSource
    DataSet = QProtocol
    Left = 54
    Top = 268
  end
  object DData: TDataSource
    DataSet = QData
    Left = 608
    Top = 280
  end
  object QData: TQuery
    DatabaseName = 'work'
    SQL.Strings = (
      
        'Select Protocol_ID,N as num,Drl,Dnrl,Dntv,LRrl,LRtv,UDrl,UDtv,DT' +
        'ime,Tracking,'
      '        CAST(CAST(Drl as decimal(10,3)) as Char(12)) as fDrl,'
      '        CAST(CAST(Dnrl as decimal(10,3)) as Char(12)) as fDnrl,'
      '        CAST(CAST(LRrl as decimal(10,2)) as Char(12)) as fLRrl,'
      '        CAST(CAST(UDrl as decimal(10,2)) as Char(12)) as fUDrl,'
      '        CAST(CAST(Dntv as decimal(10,3)) as Char(12)) as fDntv,'
      '        CAST(CAST(LRtv as decimal(10,2)) as Char(12)) as fLRtv,'
      '        CAST(CAST(UDtv as decimal(10,2)) as Char(12)) as fUDtv,'
      '        CONVERT(Char,DTime,114) as fDTime,'
      '        CONVERT(Char,Tracking,114) as fTracking,'
      
        '        (select MAX(N) from ProtocolDate where Protocol_ID = :Pr' +
        'otocol_ID) as NumMAX'
      '        from ProtocolDate'
      '        where Protocol_ID = :Protocol_ID '
      '        order by N'
      ''
      '')
    Left = 572
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Protocol_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Protocol_ID'
        ParamType = ptInput
      end>
    object QDataProtocol_ID: TIntegerField
      FieldName = 'Protocol_ID'
    end
    object QDatanum: TIntegerField
      FieldName = 'num'
    end
    object QDataDrl: TFloatField
      FieldName = 'Drl'
    end
    object QDataDnrl: TFloatField
      FieldName = 'Dnrl'
    end
    object QDataDntv: TFloatField
      FieldName = 'Dntv'
    end
    object QDataLRrl: TFloatField
      FieldName = 'LRrl'
    end
    object QDataLRtv: TFloatField
      FieldName = 'LRtv'
    end
    object QDataUDrl: TFloatField
      FieldName = 'UDrl'
    end
    object QDataUDtv: TFloatField
      FieldName = 'UDtv'
    end
    object QDataDTime: TDateTimeField
      FieldName = 'DTime'
    end
    object QDatafDrl: TStringField
      Alignment = taCenter
      FieldName = 'fDrl'
      Size = 12
    end
    object QDatafDnrl: TStringField
      Alignment = taCenter
      FieldName = 'fDnrl'
      Size = 12
    end
    object QDatafLRrl: TStringField
      Alignment = taCenter
      FieldName = 'fLRrl'
      Size = 12
    end
    object QDatafUDrl: TStringField
      Alignment = taCenter
      FieldName = 'fUDrl'
      Size = 12
    end
    object QDatafDntv: TStringField
      Alignment = taCenter
      FieldName = 'fDntv'
      Size = 12
    end
    object QDatafLRtv: TStringField
      Alignment = taCenter
      FieldName = 'fLRtv'
      Size = 12
    end
    object QDatafUDtv: TStringField
      Alignment = taCenter
      FieldName = 'fUDtv'
      Size = 12
    end
    object QDatafDTime: TStringField
      Alignment = taCenter
      FieldName = 'fDTime'
      FixedChar = True
      Size = 30
    end
    object QDataTracking: TStringField
      FieldName = 'Tracking'
      Size = 15
    end
    object QDataNumMAX: TIntegerField
      FieldName = 'NumMAX'
    end
    object QDatafTracking: TStringField
      FieldName = 'fTracking'
      FixedChar = True
      Size = 30
    end
  end
  object QDelete: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      ''
      '')
    Left = 18
    Top = 304
    object IntegerField1: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Check'
      Calculated = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'Protocol_ID'
      Origin = 'WORK.Protocol.Protocol_ID'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'StartDate'
      Origin = 'WORK.Protocol.StartDate'
    end
    object StringField1: TStringField
      FieldName = 'Glidepath'
      Origin = 'WORK.Protocol.Glidepath'
      FixedChar = True
    end
    object StringField2: TStringField
      FieldName = 'KUList'
      Origin = 'WORK.Protocol.KUList'
      FixedChar = True
      Size = 50
    end
    object StringField3: TStringField
      FieldName = 'Tracking'
      Origin = 'WORK.Protocol.Tracking'
      FixedChar = True
      Size = 50
    end
    object StringField4: TStringField
      FieldName = 'Operator'
      Origin = 'WORK.Protocol.Operator'
      FixedChar = True
      Size = 120
    end
  end
  object ColorDialog1: TColorDialog
    Left = 304
    Top = 240
  end
  object PrintDialog1: TPrintDialog
    Left = 568
    Top = 320
  end
end
