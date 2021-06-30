object Form1: TForm1
  Left = 223
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Imitator'
  ClientHeight = 474
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 440
    Width = 694
    Height = 34
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 604
      Top = 4
      Width = 75
      Height = 21
      Caption = 'Exit'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 592
      Height = 32
      Align = alLeft
      TabOrder = 1
      object Label30: TLabel
        Left = 6
        Top = 8
        Width = 68
        Height = 13
        Caption = 'R ComPort N1'
      end
      object Label40: TLabel
        Left = 150
        Top = 8
        Width = 68
        Height = 13
        Caption = 'R ComPort N2'
      end
      object Label47: TLabel
        Left = 295
        Top = 8
        Width = 66
        Height = 13
        Caption = 'L ComPort N1'
      end
      object Label48: TLabel
        Left = 434
        Top = 8
        Width = 66
        Height = 13
        Caption = 'L ComPort N2'
      end
      object ComboBox1: TComboBox
        Left = 79
        Top = 5
        Width = 65
        Height = 21
        DropDownCount = 11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        Text = '0'
        OnChange = ComboBox1Change
        OnDblClick = ComboBox1DblClick
        Items.Strings = (
          '0'
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
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25'
          '26'
          '27'
          '28'
          '29'
          '30'
          '31'
          '32'
          '33'
          '34'
          '35'
          '36'
          '37'
          '38'
          '39'
          '40'
          '41'
          '42'
          '43'
          '44'
          '45'
          '46'
          '47'
          '48'
          '49'
          '50')
      end
      object ComboBox2: TComboBox
        Left = 224
        Top = 4
        Width = 65
        Height = 21
        DropDownCount = 11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        Text = '0'
        OnChange = ComboBox2Change
        OnDblClick = ComboBox2DblClick
        Items.Strings = (
          '0'
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
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25'
          '26'
          '27'
          '28'
          '29'
          '30'
          '31'
          '32'
          '33'
          '34'
          '35'
          '36'
          '37'
          '38'
          '39'
          '40'
          '41'
          '42'
          '43'
          '44'
          '45'
          '46'
          '47'
          '48'
          '49'
          '50')
      end
      object ComboBox5: TComboBox
        Left = 366
        Top = 4
        Width = 65
        Height = 21
        DropDownCount = 11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 2
        Text = '0'
        OnChange = ComboBox5Change
        OnDblClick = ComboBox5DblClick
        Items.Strings = (
          '0'
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
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25'
          '26'
          '27'
          '28'
          '29'
          '30'
          '31'
          '32'
          '33'
          '34'
          '35'
          '36'
          '37'
          '38'
          '39'
          '40'
          '41'
          '42'
          '43'
          '44'
          '45'
          '46'
          '47'
          '48'
          '49'
          '50')
      end
      object ComboBox6: TComboBox
        Left = 508
        Top = 4
        Width = 65
        Height = 21
        DropDownCount = 11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 3
        Text = '0'
        OnChange = ComboBox6Change
        OnDblClick = ComboBox6DblClick
        Items.Strings = (
          '0'
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
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25'
          '26'
          '27'
          '28'
          '29'
          '30'
          '31'
          '32'
          '33'
          '34'
          '35'
          '36'
          '37'
          '38'
          '39'
          '40'
          '41'
          '42'
          '43'
          '44'
          '45'
          '46'
          '47'
          '48'
          '49'
          '50')
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 694
    Height = 440
    Align = alClient
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 346
      Height = 438
      Align = alLeft
      Caption = 'Radar sys'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 136
        Width = 47
        Height = 13
        Caption = 'Command'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 158
        Width = 53
        Height = 13
        Caption = 'Number LA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 180
        Width = 42
        Height = 13
        Caption = 'Distance'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 202
        Width = 33
        Height = 13
        Caption = 'Course'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 8
        Top = 224
        Width = 65
        Height = 13
        Caption = 'Elevation ang'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 246
        Width = 51
        Height = 13
        Caption = 'Hor Speed'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 268
        Width = 50
        Height = 13
        Caption = 'Ver Speed'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 8
        Top = 312
        Width = 52
        Height = 13
        Caption = 'CheckSum'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 208
        Top = 120
        Width = 64
        Height = 13
        Caption = 'Word (2 byte)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 86
        Top = 120
        Width = 21
        Height = 13
        Caption = 'TTP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 116
        Top = 120
        Width = 15
        Height = 13
        Caption = 'HP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 148
        Top = 120
        Width = 14
        Height = 13
        Caption = 'PT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 180
        Top = 120
        Width = 14
        Height = 13
        Caption = 'AP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label32: TLabel
        Left = 6
        Top = 328
        Width = 43
        Height = 13
        Caption = 'Message'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label34: TLabel
        Left = 76
        Top = 88
        Width = 45
        Height = 13
        Caption = 'LUNA-LA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label35: TLabel
        Left = 134
        Top = 88
        Width = 33
        Height = 13
        Caption = 'Course'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label36: TLabel
        Left = 208
        Top = 88
        Width = 45
        Height = 13
        Caption = 'Glidepath'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label37: TLabel
        Left = 272
        Top = 88
        Width = 65
        Height = 13
        Caption = 'Speed.[km/h]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label38: TLabel
        Left = 10
        Top = 92
        Width = 45
        Height = 13
        Caption = 'Glidepath'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label42: TLabel
        Left = 114
        Top = 64
        Width = 59
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label43: TLabel
        Left = 6
        Top = 64
        Width = 71
        Height = 13
        Alignment = taCenter
        Caption = 'Send Message'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label44: TLabel
        Left = 176
        Top = 64
        Width = 86
        Height = 13
        Alignment = taCenter
        Caption = 'Receive Message'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label45: TLabel
        Left = 266
        Top = 64
        Width = 59
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label49: TLabel
        Left = 8
        Top = 290
        Width = 45
        Height = 13
        Caption = 'Glidepath'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 77
        Top = 132
        Width = 30
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '000'
        OnChange = Edit1Change
      end
      object Edit2: TEdit
        Left = 77
        Top = 154
        Width = 125
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '777'
        OnChange = Edit1Change
      end
      object Edit3: TEdit
        Left = 77
        Top = 176
        Width = 125
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = '1500'
        OnChange = Edit1Change
      end
      object Edit4: TEdit
        Left = 77
        Top = 198
        Width = 125
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = '0'
        OnChange = Edit1Change
      end
      object Edit5: TEdit
        Left = 77
        Top = 220
        Width = 125
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = '0'
      end
      object Edit6: TEdit
        Left = 77
        Top = 242
        Width = 125
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = '0'
        OnChange = Edit1Change
      end
      object Edit9: TEdit
        Left = 208
        Top = 132
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object Edit10: TEdit
        Left = 208
        Top = 154
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object Edit11: TEdit
        Left = 208
        Top = 176
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object Edit12: TEdit
        Left = 208
        Top = 198
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object Edit13: TEdit
        Left = 208
        Top = 220
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object Edit14: TEdit
        Left = 208
        Top = 242
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
      end
      object Edit15: TEdit
        Left = 208
        Top = 264
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object Edit16: TEdit
        Left = 208
        Top = 308
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
      object Button2: TButton
        Left = 200
        Top = 374
        Width = 60
        Height = 22
        Caption = 'Start'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 268
        Top = 374
        Width = 60
        Height = 22
        Caption = 'Stop'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        OnClick = Button3Click
      end
      object Edit44: TEdit
        Left = 108
        Top = 132
        Width = 30
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
        Text = '00'
        OnChange = Edit44Change
      end
      object Edit45: TEdit
        Left = 140
        Top = 132
        Width = 30
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
        Text = '0'
        OnChange = Edit45Change
      end
      object Edit46: TEdit
        Left = 172
        Top = 132
        Width = 30
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 18
        Text = '1'
        OnChange = Edit46Change
      end
      object Edit8: TEdit
        Left = 8
        Top = 342
        Width = 330
        Height = 24
        ReadOnly = True
        TabOrder = 19
      end
      object Edit35: TEdit
        Left = 77
        Top = 100
        Width = 56
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 20
        Text = '3000'
        OnChange = Edit1Change
      end
      object Edit42: TEdit
        Left = 138
        Top = 100
        Width = 58
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 21
        Text = '180'
        OnChange = Edit1Change
      end
      object Edit43: TEdit
        Left = 205
        Top = 100
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 22
        Text = '4'
      end
      object Edit47: TEdit
        Left = 271
        Top = 100
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 23
        Text = '240'
      end
      object Edit7: TEdit
        Left = 77
        Top = 264
        Width = 125
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 24
        Text = '0'
        OnChange = Edit1Change
      end
      object Edit25: TEdit
        Left = 77
        Top = 286
        Width = 125
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 25
        Text = '0'
        OnChange = Edit1Change
      end
      object Edit48: TEdit
        Left = 208
        Top = 286
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 26
      end
    end
    object GroupBox2: TGroupBox
      Left = 347
      Top = 1
      Width = 346
      Height = 438
      Align = alClient
      Caption = 'OLS LUNA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label9: TLabel
        Left = 138
        Top = 142
        Width = 38
        Height = 13
        Caption = 'Address'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 80
        Top = 142
        Width = 47
        Height = 13
        Caption = 'Command'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 2
        Top = 180
        Width = 70
        Height = 13
        Caption = 'Stab glid angle'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 2
        Top = 202
        Width = 64
        Height = 13
        Caption = 'Current Alpha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 2
        Top = 224
        Width = 79
        Height = 13
        Caption = 'Current err Alpha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 2
        Top = 246
        Width = 70
        Height = 13
        Caption = 'Middle c Alpha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 2
        Top = 268
        Width = 69
        Height = 13
        Caption = 'Compens Beta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 2
        Top = 290
        Width = 74
        Height = 13
        Caption = 'Current err Beta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 270
        Top = 142
        Width = 39
        Height = 13
        Caption = 'low byte'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 206
        Top = 142
        Width = 43
        Height = 13
        Caption = 'high byte'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 8
        Top = 312
        Width = 52
        Height = 13
        Caption = 'CheckSum'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 2
        Top = 158
        Width = 47
        Height = 13
        Caption = 'Command'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label33: TLabel
        Left = 8
        Top = 328
        Width = 43
        Height = 13
        Caption = 'Message'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label27: TLabel
        Left = 6
        Top = 64
        Width = 71
        Height = 13
        Alignment = taCenter
        Caption = 'Send Message'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label39: TLabel
        Left = 124
        Top = 65
        Width = 40
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label41: TLabel
        Left = 176
        Top = 64
        Width = 86
        Height = 13
        Alignment = taCenter
        Caption = 'Receive Message'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label46: TLabel
        Left = 288
        Top = 64
        Width = 40
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Edit17: TEdit
        Left = 81
        Top = 154
        Width = 59
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '111'
        OnChange = Edit1Change
      end
      object Edit18: TEdit
        Left = 142
        Top = 154
        Width = 59
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '1'
        OnChange = Edit1Change
      end
      object Edit19: TEdit
        Left = 81
        Top = 176
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = '4'
        OnChange = Edit1Change
      end
      object Edit20: TEdit
        Left = 81
        Top = 198
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = '4'
        OnChange = Edit1Change
      end
      object Edit21: TEdit
        Left = 81
        Top = 220
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Text = '0'
        OnChange = Edit1Change
      end
      object Edit23: TEdit
        Left = 81
        Top = 264
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = '1'
        OnChange = Edit1Change
      end
      object Edit24: TEdit
        Left = 81
        Top = 286
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Text = '0'
        OnChange = Edit1Change
      end
      object Button4: TButton
        Left = 200
        Top = 374
        Width = 60
        Height = 22
        Caption = 'Start'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 268
        Top = 374
        Width = 60
        Height = 22
        Caption = 'Stop'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = Button5Click
      end
      object Edit26: TEdit
        Left = 205
        Top = 154
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object Edit27: TEdit
        Left = 269
        Top = 154
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object Edit28: TEdit
        Left = 205
        Top = 176
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
      end
      object Edit29: TEdit
        Left = 205
        Top = 198
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object Edit30: TEdit
        Left = 205
        Top = 220
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
      object Edit31: TEdit
        Left = 205
        Top = 242
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
      end
      object Edit32: TEdit
        Left = 205
        Top = 264
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
      end
      object Edit33: TEdit
        Left = 205
        Top = 286
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 16
      end
      object Edit34: TEdit
        Left = 205
        Top = 308
        Width = 126
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
      end
      object Edit36: TEdit
        Left = 269
        Top = 176
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
      end
      object Edit37: TEdit
        Left = 269
        Top = 198
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 19
      end
      object Edit38: TEdit
        Left = 269
        Top = 220
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 20
      end
      object Edit39: TEdit
        Left = 269
        Top = 242
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 21
      end
      object Edit40: TEdit
        Left = 269
        Top = 264
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 22
      end
      object Edit41: TEdit
        Left = 269
        Top = 286
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 23
      end
      object Edit55: TEdit
        Left = 81
        Top = 242
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 24
        Text = '0'
        OnChange = Edit1Change
      end
      object Panel4: TPanel
        Left = 247
        Top = 400
        Width = 80
        Height = 25
        BevelOuter = bvNone
        TabOrder = 25
      end
      object Panel5: TPanel
        Left = 1
        Top = 84
        Width = 330
        Height = 60
        BevelOuter = bvNone
        TabOrder = 26
      end
      object Edit49: TEdit
        Left = 8
        Top = 342
        Width = 330
        Height = 24
        ReadOnly = True
        TabOrder = 27
      end
      object CheckBox1: TCheckBox
        Left = 40
        Top = 376
        Width = 97
        Height = 17
        Caption = 'ErrorST'
        Checked = True
        State = cbChecked
        TabOrder = 28
      end
    end
  end
end
