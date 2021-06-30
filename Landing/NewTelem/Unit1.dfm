object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Imitator Ladoga / Telemetric sys'
  ClientHeight = 714
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 254
    Top = 0
    Width = 253
    Height = 509
    Caption = 'Initial data(Central)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object l1: TLabel
      Left = 12
      Top = 20
      Width = 77
      Height = 13
      Caption = 'El. coordinate FI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l2: TLabel
      Left = 12
      Top = 42
      Width = 83
      Height = 13
      Caption = 'El. coordinate LM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l3: TLabel
      Left = 12
      Top = 64
      Width = 77
      Height = 13
      Caption = 'North speed  Vn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l4: TLabel
      Left = 12
      Top = 86
      Width = 72
      Height = 13
      Caption = 'East speed  Ve'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l6: TLabel
      Left = 12
      Top = 130
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
    object l5: TLabel
      Left = 12
      Top = 108
      Width = 60
      Height = 13
      Caption = 'Speed of log'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l8: TLabel
      Left = 12
      Top = 174
      Width = 67
      Height = 13
      Caption = 'Pitching angle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l10: TLabel
      Left = 12
      Top = 218
      Width = 61
      Height = 13
      Caption = 'Rolling angle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l13: TLabel
      Left = 12
      Top = 284
      Width = 68
      Height = 13
      Caption = 'Line speed Ve'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l14: TLabel
      Left = 12
      Top = 302
      Width = 67
      Height = 13
      Caption = 'Line speed Vz'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l15: TLabel
      Left = 12
      Top = 324
      Width = 51
      Height = 13
      Caption = 'Moving Sn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l16: TLabel
      Left = 12
      Top = 346
      Width = 51
      Height = 13
      Caption = 'Moving Se'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l12: TLabel
      Left = 12
      Top = 262
      Width = 64
      Height = 13
      Caption = 'line speed Vn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l11: TLabel
      Left = 12
      Top = 240
      Width = 102
      Height = 13
      Caption = 'Rolling angular speed'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l9: TLabel
      Left = 12
      Top = 196
      Width = 108
      Height = 13
      Caption = 'Pitching angular speed'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l7: TLabel
      Left = 12
      Top = 152
      Width = 103
      Height = 13
      Caption = 'Course angular speed'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l20: TLabel
      Left = 12
      Top = 434
      Width = 23
      Height = 13
      Caption = 'Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l19: TLabel
      Left = 12
      Top = 412
      Width = 73
      Height = 13
      Caption = 'Greenwich time'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l18: TLabel
      Left = 12
      Top = 390
      Width = 104
      Height = 13
      Caption = 'Desk inclination angle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object l17: TLabel
      Left = 12
      Top = 368
      Width = 50
      Height = 13
      Caption = 'Moving Sz'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object e1: TEdit
      Tag = 1
      Left = 130
      Top = 16
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
      OnChange = e1Change
    end
    object e2: TEdit
      Tag = 1
      Left = 130
      Top = 38
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
      OnChange = e1Change
    end
    object e3: TEdit
      Tag = 1
      Left = 130
      Top = 60
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '0'
      OnChange = e1Change
    end
    object e4: TEdit
      Tag = 1
      Left = 130
      Top = 82
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '0'
      OnChange = e1Change
    end
    object e6: TEdit
      Tag = 1
      Left = 130
      Top = 126
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '0'
      OnChange = e1Change
    end
    object e5: TEdit
      Tag = 1
      Left = 130
      Top = 104
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = '20'
      OnChange = e1Change
    end
    object e8: TEdit
      Tag = 5
      Left = 130
      Top = 170
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Text = '0'
      OnChange = e1Change
    end
    object e10: TEdit
      Tag = 5
      Left = 130
      Top = 214
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Text = '0'
      OnChange = e1Change
    end
    object e13: TEdit
      Tag = 1
      Left = 130
      Top = 280
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      Text = '0'
      OnChange = e1Change
    end
    object e14: TEdit
      Tag = 1
      Left = 130
      Top = 302
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      Text = '0'
      OnChange = e1Change
    end
    object e15: TEdit
      Tag = 1
      Left = 130
      Top = 324
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      Text = '0'
      OnChange = e1Change
    end
    object e16: TEdit
      Tag = 1
      Left = 130
      Top = 346
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      Text = '0'
      OnChange = e1Change
    end
    object e7: TEdit
      Tag = 1
      Left = 130
      Top = 148
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      Text = '0'
      OnChange = e1Change
    end
    object e9: TEdit
      Tag = 1
      Left = 130
      Top = 192
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      Text = '0'
      OnChange = e1Change
    end
    object e11: TEdit
      Tag = 1
      Left = 130
      Top = 236
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      Text = '0'
      OnChange = e1Change
    end
    object e12: TEdit
      Tag = 1
      Left = 130
      Top = 258
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      Text = '0'
      OnChange = e1Change
    end
    object e19: TEdit
      Tag = 5
      Left = 130
      Top = 412
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
    end
    object e18: TEdit
      Tag = 1
      Left = 130
      Top = 390
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
      Text = '0'
      OnChange = e1Change
    end
    object e17: TEdit
      Tag = 1
      Left = 130
      Top = 368
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 18
      Text = '0'
      OnChange = e1Change
    end
    object e20: TEdit
      Tag = 5
      Left = 130
      Top = 434
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 19
    end
    object GroupBox3: TGroupBox
      Left = 14
      Top = 455
      Width = 117
      Height = 51
      Caption = 'Pitching'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 20
      object Label38: TLabel
        Left = 10
        Top = 12
        Width = 46
        Height = 13
        Caption = 'Amplitude'
      end
      object Label44: TLabel
        Left = 62
        Top = 12
        Width = 30
        Height = 13
        Caption = 'Period'
      end
      object ComboBox1: TComboBox
        Left = 10
        Top = 25
        Width = 49
        Height = 21
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 0
        Text = '0'
        Items.Strings = (
          '0'
          '0.25'
          '0.50'
          '0.75'
          '1'
          '1.25'
          '1.50'
          '1.75'
          '2')
      end
      object ComboBox2: TComboBox
        Left = 60
        Top = 27
        Width = 49
        Height = 21
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 1
        Text = '0'
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
          '12'
          '14'
          '16'
          '18'
          '20'
          '25'
          '30'
          '40'
          '50')
      end
    end
    object GroupBox4: TGroupBox
      Left = 127
      Top = 455
      Width = 117
      Height = 51
      Caption = 'Rolling'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 21
      object Label43: TLabel
        Left = 10
        Top = 12
        Width = 46
        Height = 13
        Caption = 'Amplitude'
      end
      object Label45: TLabel
        Left = 60
        Top = 12
        Width = 30
        Height = 13
        Caption = 'Period'
      end
      object ComboBox3: TComboBox
        Left = 8
        Top = 25
        Width = 49
        Height = 21
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 0
        Text = '0'
        Items.Strings = (
          '0'
          '0.25'
          '0.50'
          '0.75'
          '1'
          '1.25'
          '1.50'
          '1.75'
          '2'
          '2.25'
          '2.50'
          '2.75'
          '3')
      end
      object ComboBox4: TComboBox
        Left = 62
        Top = 27
        Width = 49
        Height = 21
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 1
        Text = '0'
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
          '12'
          '14'
          '16'
          '18'
          '20'
          '25'
          '30'
          '40'
          '50')
      end
    end
    object Edit3: TEdit
      Tag = 5
      Left = 189
      Top = 170
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 22
      Text = '0'
      OnChange = e1Change
    end
    object Edit5: TEdit
      Tag = 5
      Left = 189
      Top = 214
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 23
      Text = '0'
      OnChange = e1Change
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 667
    Width = 753
    Height = 47
    Align = alBottom
    TabOrder = 1
    object Button2: TButton
      Left = 268
      Top = 2
      Width = 75
      Height = 21
      Caption = 'Exit'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 187
      Top = 2
      Width = 75
      Height = 21
      Caption = 'Start'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 187
      Top = 25
      Width = 75
      Height = 21
      Caption = 'Stop'
      Enabled = False
      TabOrder = 2
      OnClick = Button3Click
    end
    object CheckBox1: TCheckBox
      Left = 4
      Top = 5
      Width = 111
      Height = 17
      Caption = 'Test mode'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = CheckBox1Click
    end
    object Edit717: TEdit
      Tag = 5
      Left = 114
      Top = 3
      Width = 71
      Height = 21
      TabOrder = 4
      Text = '20'
      OnChange = Edit717Change
    end
    object RadioGroup22: TRadioGroup
      Left = 349
      Top = 1
      Width = 402
      Height = 40
      Caption = 'Choice the channel'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '0 - WSC (WSP)'
        '1 - WSL'
        '2 - Both')
      TabOrder = 5
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 253
    Height = 509
    Caption = 'Initial data(Fore)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 23
      Width = 77
      Height = 13
      Caption = 'El. coordinate FI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 42
      Width = 83
      Height = 13
      Caption = 'El. coordinate LM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 12
      Top = 64
      Width = 77
      Height = 13
      Caption = 'North speed  Vn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 12
      Top = 86
      Width = 72
      Height = 13
      Caption = 'East speed  Ve'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 12
      Top = 130
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
    object Label6: TLabel
      Left = 12
      Top = 108
      Width = 60
      Height = 13
      Caption = 'Speed of log'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 12
      Top = 174
      Width = 67
      Height = 13
      Caption = 'Pitching angle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 12
      Top = 218
      Width = 61
      Height = 13
      Caption = 'Rolling angle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 12
      Top = 284
      Width = 68
      Height = 13
      Caption = 'Line speed Ve'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 12
      Top = 306
      Width = 67
      Height = 13
      Caption = 'Line speed Vz'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 12
      Top = 328
      Width = 51
      Height = 13
      Caption = 'Moving Sn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 12
      Top = 350
      Width = 51
      Height = 13
      Caption = 'Moving Se'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 12
      Top = 262
      Width = 64
      Height = 13
      Caption = 'line speed Vn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 12
      Top = 240
      Width = 102
      Height = 13
      Caption = 'Rolling angular speed'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 12
      Top = 196
      Width = 108
      Height = 13
      Caption = 'Pitching angular speed'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 12
      Top = 152
      Width = 103
      Height = 13
      Caption = 'Course angular speed'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 12
      Top = 438
      Width = 23
      Height = 13
      Caption = 'Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 12
      Top = 416
      Width = 73
      Height = 13
      Caption = 'Greenwich time'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 12
      Top = 394
      Width = 104
      Height = 13
      Caption = 'Desk inclination angle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 12
      Top = 372
      Width = 50
      Height = 13
      Caption = 'Moving Sz'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ep1: TEdit
      Left = 130
      Top = 16
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
      OnChange = e1Change
    end
    object ep2: TEdit
      Left = 130
      Top = 38
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
      OnChange = e1Change
    end
    object ep3: TEdit
      Left = 130
      Top = 60
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '0'
      OnChange = e1Change
    end
    object ep4: TEdit
      Left = 130
      Top = 82
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '0'
      OnChange = e1Change
    end
    object ep6: TEdit
      Left = 130
      Top = 126
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '0'
      OnChange = e1Change
    end
    object ep5: TEdit
      Left = 130
      Top = 104
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = '19'
      OnChange = e1Change
    end
    object ep8: TEdit
      Tag = 5
      Left = 130
      Top = 170
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Text = '0'
      OnChange = e1Change
    end
    object ep10: TEdit
      Tag = 5
      Left = 130
      Top = 214
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Text = '0'
      OnChange = e1Change
    end
    object ep13: TEdit
      Left = 130
      Top = 280
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      Text = '0'
      OnChange = e1Change
    end
    object ep14: TEdit
      Left = 130
      Top = 302
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      Text = '0'
      OnChange = e1Change
    end
    object ep16: TEdit
      Left = 130
      Top = 346
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      Text = '0'
      OnChange = e1Change
    end
    object ep7: TEdit
      Left = 130
      Top = 148
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      Text = '0'
      OnChange = e1Change
    end
    object ep9: TEdit
      Left = 130
      Top = 192
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      Text = '0'
      OnChange = e1Change
    end
    object ep11: TEdit
      Left = 130
      Top = 236
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      Text = '0'
      OnChange = e1Change
    end
    object ep12: TEdit
      Left = 130
      Top = 258
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      Text = '0'
      OnChange = e1Change
    end
    object ep19: TEdit
      Tag = 5
      Left = 130
      Top = 412
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
    end
    object ep18: TEdit
      Left = 130
      Top = 390
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      Text = '0'
      OnChange = e1Change
    end
    object ep17: TEdit
      Left = 130
      Top = 368
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
      Text = '0'
      OnChange = e1Change
    end
    object ep20: TEdit
      Tag = 5
      Left = 130
      Top = 434
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 18
    end
    object GroupBox5: TGroupBox
      Left = 7
      Top = 455
      Width = 117
      Height = 51
      Caption = 'Pitching'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 19
      object Label23: TLabel
        Left = 10
        Top = 12
        Width = 46
        Height = 13
        Caption = 'Amplitude'
      end
      object Label24: TLabel
        Left = 62
        Top = 12
        Width = 30
        Height = 13
        Caption = 'Period'
      end
      object ComboBox5: TComboBox
        Left = 10
        Top = 25
        Width = 49
        Height = 21
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 0
        Text = '0'
        Items.Strings = (
          '0'
          '0.25'
          '0.50'
          '0.75'
          '1'
          '1.25'
          '1.50'
          '1.75'
          '2')
      end
      object ComboBox6: TComboBox
        Left = 60
        Top = 25
        Width = 49
        Height = 21
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 1
        Text = '0'
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
          '12'
          '14'
          '16'
          '18'
          '20'
          '25'
          '30'
          '40'
          '50')
      end
    end
    object GroupBox6: TGroupBox
      Left = 130
      Top = 455
      Width = 117
      Height = 51
      Caption = 'Rolling'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 20
      object Label25: TLabel
        Left = 10
        Top = 12
        Width = 46
        Height = 13
        Caption = 'Amplitude'
      end
      object Label26: TLabel
        Left = 60
        Top = 12
        Width = 30
        Height = 13
        Caption = 'Period'
      end
      object ComboBox7: TComboBox
        Left = 8
        Top = 25
        Width = 49
        Height = 21
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 0
        Text = '0'
        Items.Strings = (
          '0'
          '0.25'
          '0.50'
          '0.75'
          '1'
          '1.25'
          '1.50'
          '1.75'
          '2'
          '2.25'
          '2.50'
          '2.75'
          '3')
      end
      object ComboBox8: TComboBox
        Left = 62
        Top = 27
        Width = 49
        Height = 21
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 1
        Text = '0'
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
          '12'
          '14'
          '16'
          '18'
          '20'
          '25'
          '30'
          '40'
          '50')
      end
    end
    object ep15: TEdit
      Left = 130
      Top = 324
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 21
      Text = '0'
      OnChange = e1Change
    end
    object Edit1: TEdit
      Tag = 5
      Left = 189
      Top = 170
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 22
      Text = '0'
      OnChange = e1Change
    end
    object Edit2: TEdit
      Tag = 5
      Left = 189
      Top = 214
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 23
      Text = '0'
      OnChange = e1Change
    end
  end
  object GroupBox7: TGroupBox
    Left = 499
    Top = 0
    Width = 253
    Height = 507
    Caption = 'Initial data(Aft)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label27: TLabel
      Left = 12
      Top = 20
      Width = 77
      Height = 13
      Caption = 'El. coordinate FI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 12
      Top = 42
      Width = 83
      Height = 13
      Caption = 'El. coordinate LM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label29: TLabel
      Left = 12
      Top = 64
      Width = 77
      Height = 13
      Caption = 'North speed  Vn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label30: TLabel
      Left = 12
      Top = 86
      Width = 72
      Height = 13
      Caption = 'East speed  Ve'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label31: TLabel
      Left = 12
      Top = 130
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
    object Label32: TLabel
      Left = 12
      Top = 108
      Width = 60
      Height = 13
      Caption = 'Speed of log'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label33: TLabel
      Left = 12
      Top = 174
      Width = 67
      Height = 13
      Caption = 'Pitching angle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label34: TLabel
      Left = 12
      Top = 218
      Width = 61
      Height = 13
      Caption = 'Rolling angle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label35: TLabel
      Left = 12
      Top = 284
      Width = 68
      Height = 13
      Caption = 'Line speed Ve'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label36: TLabel
      Left = 12
      Top = 306
      Width = 67
      Height = 13
      Caption = 'Line speed Vz'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label37: TLabel
      Left = 12
      Top = 328
      Width = 51
      Height = 13
      Caption = 'Moving Sn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label39: TLabel
      Left = 12
      Top = 350
      Width = 51
      Height = 13
      Caption = 'Moving Se'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label40: TLabel
      Left = 12
      Top = 262
      Width = 64
      Height = 13
      Caption = 'line speed Vn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label41: TLabel
      Left = 12
      Top = 240
      Width = 102
      Height = 13
      Caption = 'Rolling angular speed'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label42: TLabel
      Left = 12
      Top = 196
      Width = 108
      Height = 13
      Caption = 'Pitching angular speed'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label46: TLabel
      Left = 12
      Top = 152
      Width = 103
      Height = 13
      Caption = 'Course angular speed'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label48: TLabel
      Left = 12
      Top = 438
      Width = 23
      Height = 13
      Caption = 'Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label49: TLabel
      Left = 12
      Top = 416
      Width = 73
      Height = 13
      Caption = 'Greenwich time'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label50: TLabel
      Left = 12
      Top = 394
      Width = 104
      Height = 13
      Caption = 'Desk inclination angle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label51: TLabel
      Left = 12
      Top = 372
      Width = 50
      Height = 13
      Caption = 'Moving Sz'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object en1: TEdit
      Tag = 2
      Left = 130
      Top = 16
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
      OnChange = e1Change
    end
    object en2: TEdit
      Tag = 2
      Left = 130
      Top = 38
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
      OnChange = e1Change
    end
    object en3: TEdit
      Tag = 2
      Left = 130
      Top = 60
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '0'
      OnChange = e1Change
    end
    object en4: TEdit
      Tag = 2
      Left = 130
      Top = 82
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '0'
      OnChange = e1Change
    end
    object en6: TEdit
      Tag = 2
      Left = 130
      Top = 126
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '0'
      OnChange = e1Change
    end
    object en5: TEdit
      Tag = 2
      Left = 130
      Top = 104
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = '21'
      OnChange = e1Change
    end
    object en8: TEdit
      Tag = 5
      Left = 130
      Top = 170
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Text = '0'
      OnChange = e1Change
    end
    object en10: TEdit
      Tag = 5
      Left = 130
      Top = 214
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Text = '0'
      OnChange = e1Change
    end
    object en13: TEdit
      Tag = 2
      Left = 130
      Top = 280
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      Text = '0'
      OnChange = e1Change
    end
    object en14: TEdit
      Tag = 2
      Left = 130
      Top = 302
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      Text = '0'
      OnChange = e1Change
    end
    object en15: TEdit
      Tag = 2
      Left = 130
      Top = 324
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      Text = '0'
      OnChange = e1Change
    end
    object en16: TEdit
      Tag = 2
      Left = 130
      Top = 346
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      Text = '0'
      OnChange = e1Change
    end
    object en7: TEdit
      Tag = 2
      Left = 130
      Top = 148
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      Text = '0'
      OnChange = e1Change
    end
    object en9: TEdit
      Tag = 2
      Left = 130
      Top = 192
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      Text = '0'
      OnChange = e1Change
    end
    object en11: TEdit
      Tag = 2
      Left = 130
      Top = 236
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      Text = '0'
      OnChange = e1Change
    end
    object en12: TEdit
      Tag = 2
      Left = 130
      Top = 258
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      Text = '0'
      OnChange = e1Change
    end
    object en19: TEdit
      Tag = 5
      Left = 130
      Top = 412
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
    end
    object en18: TEdit
      Tag = 2
      Left = 130
      Top = 390
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
      Text = '0'
      OnChange = e1Change
    end
    object en17: TEdit
      Tag = 2
      Left = 130
      Top = 368
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 18
      Text = '0'
      OnChange = e1Change
    end
    object en20: TEdit
      Tag = 5
      Left = 130
      Top = 434
      Width = 118
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 19
    end
    object GroupBox8: TGroupBox
      Left = 10
      Top = 455
      Width = 117
      Height = 51
      Caption = 'Pitching'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 20
      object Label52: TLabel
        Left = 10
        Top = 12
        Width = 46
        Height = 13
        Caption = 'Amplitude'
      end
      object Label53: TLabel
        Left = 65
        Top = 14
        Width = 30
        Height = 13
        Caption = 'Period'
      end
      object ComboBox9: TComboBox
        Left = 10
        Top = 25
        Width = 49
        Height = 21
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 0
        Text = '0'
        Items.Strings = (
          '0'
          '0.25'
          '0.50'
          '0.75'
          '1'
          '1.25'
          '1.50'
          '1.75'
          '2')
      end
      object ComboBox10: TComboBox
        Left = 60
        Top = 25
        Width = 49
        Height = 21
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 1
        Text = '0'
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
          '12'
          '14'
          '16'
          '18'
          '20'
          '25'
          '30'
          '40'
          '50')
      end
    end
    object GroupBox9: TGroupBox
      Left = 125
      Top = 455
      Width = 117
      Height = 51
      Caption = 'Rolling'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 21
      object Label18: TLabel
        Left = 10
        Top = 12
        Width = 46
        Height = 13
        Caption = 'Amplitude'
      end
      object Label47: TLabel
        Left = 63
        Top = 14
        Width = 30
        Height = 13
        Caption = 'Period'
      end
      object ComboBox11: TComboBox
        Left = 8
        Top = 25
        Width = 49
        Height = 21
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 0
        Text = '0'
        Items.Strings = (
          '0'
          '0.25'
          '0.50'
          '0.75'
          '1'
          '1.25'
          '1.50'
          '1.75'
          '2'
          '2.25'
          '2.50'
          '2.75'
          '3')
      end
      object ComboBox12: TComboBox
        Left = 62
        Top = 27
        Width = 49
        Height = 21
        DropDownCount = 20
        ItemHeight = 13
        TabOrder = 1
        Text = '0'
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
          '12'
          '14'
          '16'
          '18'
          '20'
          '25'
          '30'
          '40'
          '50')
      end
    end
    object Edit4: TEdit
      Tag = 5
      Left = 189
      Top = 170
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 22
      Text = '0'
      OnChange = e1Change
    end
    object Edit6: TEdit
      Tag = 5
      Left = 189
      Top = 214
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 23
      Text = '0'
      OnChange = e1Change
    end
  end
  object Tabs_SW: TTabControl
    Left = 0
    Top = 509
    Width = 753
    Height = 155
    HotTrack = True
    TabOrder = 4
    Tabs.Strings = (
      'SW_1(Center)'
      'SW_2(Fore)'
      'SW_3(Aft)')
    TabIndex = 0
    OnChange = Tabs_SWChange
    object Label17: TLabel
      Left = 217
      Top = 26
      Width = 534
      Height = 13
      Caption = 
        '|---------------------------------------------------------------' +
        '-----------Trustworthiness--------------------------------------' +
        '----------------------------------------|'
    end
    object RadioGroup15: TRadioGroup
      Left = 3
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Work mode '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Observation num'
        'Inertial numerat'
        'Preparation'
        'Reserve')
      ParentFont = False
      TabOrder = 0
    end
    object RadioGroup16: TRadioGroup
      Left = 538
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Coordinate'
      ItemIndex = 0
      Items.Strings = (
        'True'
        'False')
      TabOrder = 1
    end
    object RadioGroup17: TRadioGroup
      Left = 217
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Absolute velocity'
      ItemIndex = 0
      Items.Strings = (
        'True'
        'False')
      TabOrder = 2
    end
    object RadioGroup18: TRadioGroup
      Left = 324
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Speed from ground'
      ItemIndex = 0
      Items.Strings = (
        'True'
        'False')
      TabOrder = 3
    end
    object RadioGroup19: TRadioGroup
      Left = 431
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Array info'
      ItemIndex = 0
      Items.Strings = (
        'True'
        'False')
      TabOrder = 4
    end
    object RadioGroup20: TRadioGroup
      Left = 110
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Source info kurs'
      ItemIndex = 1
      Items.Strings = (
        'Inertial'
        'Manually'
        'Gyrocompass')
      TabOrder = 5
    end
    object RadioGroup21: TRadioGroup
      Left = 645
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Course'
      ItemIndex = 0
      Items.Strings = (
        'True'
        'False')
      TabOrder = 6
    end
    object RadioGroup1: TRadioGroup
      Left = 3
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Work mode '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Observation num'
        'Inertial numerat'
        'Preparation'
        'Reserve')
      ParentFont = False
      TabOrder = 7
    end
    object RadioGroup2: TRadioGroup
      Left = 538
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Coordinate'
      ItemIndex = 0
      Items.Strings = (
        'True'
        'False')
      TabOrder = 8
    end
    object RadioGroup3: TRadioGroup
      Left = 217
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Absolute velocity'
      ItemIndex = 0
      Items.Strings = (
        'True'
        'False')
      TabOrder = 9
    end
    object RadioGroup4: TRadioGroup
      Left = 324
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Speed from ground'
      ItemIndex = 0
      Items.Strings = (
        'True'
        'False')
      TabOrder = 10
    end
    object RadioGroup5: TRadioGroup
      Left = 431
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Array info'
      ItemIndex = 0
      Items.Strings = (
        'True'
        'False')
      TabOrder = 11
    end
    object RadioGroup6: TRadioGroup
      Left = 110
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Source info kurs'
      ItemIndex = 1
      Items.Strings = (
        'Inertial'
        'Manually'
        'Gyrocompass')
      TabOrder = 12
    end
    object RadioGroup7: TRadioGroup
      Left = 645
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Course'
      ItemIndex = 0
      Items.Strings = (
        'True'
        'False')
      TabOrder = 13
    end
    object RadioGroup8: TRadioGroup
      Left = 3
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Work mode '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Observation num'
        'Inertial numerat'
        'Preparation'
        'Reserve')
      ParentFont = False
      TabOrder = 14
    end
    object RadioGroup9: TRadioGroup
      Left = 538
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Coordinate'
      ItemIndex = 0
      Items.Strings = (
        'True'
        'False')
      TabOrder = 15
    end
    object RadioGroup10: TRadioGroup
      Left = 217
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Absolute velocity'
      ItemIndex = 0
      Items.Strings = (
        'True'
        'False')
      TabOrder = 16
    end
    object RadioGroup11: TRadioGroup
      Left = 324
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Speed from ground'
      ItemIndex = 0
      Items.Strings = (
        'True'
        'False')
      TabOrder = 17
    end
    object RadioGroup12: TRadioGroup
      Left = 431
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Array info'
      ItemIndex = 0
      Items.Strings = (
        'True'
        'False')
      TabOrder = 18
    end
    object RadioGroup13: TRadioGroup
      Left = 110
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Source info kurs'
      ItemIndex = 1
      Items.Strings = (
        'Inertial'
        'Manually'
        'Gyrocompass')
      TabOrder = 19
    end
    object RadioGroup14: TRadioGroup
      Left = 645
      Top = 47
      Width = 107
      Height = 105
      Caption = 'Course'
      ItemIndex = 0
      Items.Strings = (
        'True'
        'False')
      TabOrder = 20
    end
  end
end
