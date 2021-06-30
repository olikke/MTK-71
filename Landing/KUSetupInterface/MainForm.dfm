object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'KU Setup'
  ClientHeight = 683
  ClientWidth = 1398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TPanel
    Left = 30
    Top = 99
    Width = 720
    Height = 576
    Caption = ' NO VIDEO.'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCream
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 787
    Top = 15
    Width = 600
    Height = 234
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object RG: TRadioGroup
    Left = 8
    Top = 8
    Width = 760
    Height = 85
    Caption = 'TVD Selection'
    Columns = 4
    Items.Strings = (
      'TVD1 (Left)'
      'TVD2 (Axial1)'
      'TVD3 (Axial2)'
      'TVD4 (Right)')
    TabOrder = 2
    OnClick = RGClick
  end
  object GB: TGroupBox
    Left = 790
    Top = 265
    Width = 600
    Height = 410
    Caption = 'TV camera mode'
    TabOrder = 3
    object SP: TSpeedButton
      Left = 184
      Top = 299
      Width = 23
      Height = 22
      Visible = False
      OnClick = SPClick
    end
    object e1: TEdit
      Left = 19
      Top = 56
      Width = 285
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '  Data exchange'
    end
    object e2: TEdit
      Left = 19
      Top = 86
      Width = 285
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '  TVD power supply'
    end
    object e3: TEdit
      Left = 19
      Top = 118
      Width = 285
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '  Binding area to white'
    end
    object e4: TEdit
      Left = 19
      Top = 150
      Width = 285
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = '  Background extending mode'
    end
    object e5: TEdit
      Left = 19
      Top = 182
      Width = 285
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = '  Electronic shutter mode'
    end
    object e6: TEdit
      Left = 19
      Top = 214
      Width = 285
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = '  Accumulation time of  electronic shutter'
    end
    object e7: TEdit
      Left = 19
      Top = 244
      Width = 285
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      Text = '  AGC mode'
    end
    object e8: TEdit
      Left = 19
      Top = 276
      Width = 285
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Text = '  Gamma'
    end
    object e11: TEdit
      Left = 310
      Top = 56
      Width = 275
      Height = 24
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      Text = '  No'
    end
    object e12: TComboBox
      Left = 310
      Top = 86
      Width = 275
      Height = 26
      Enabled = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 18
      ParentFont = False
      TabOrder = 9
      Text = '  No data'
      OnChange = e12Change
      Items.Strings = (
        '  On'
        '  Off')
    end
    object e18: TComboBox
      Left = 310
      Top = 276
      Width = 275
      Height = 26
      Enabled = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 18
      ParentFont = False
      TabOrder = 10
      Text = '  No data'
      OnChange = e17Change
      Items.Strings = (
        '  Gamma=1'
        '  Gamma=0.7'
        '  Gamma=0.5')
    end
    object e17: TComboBox
      Left = 310
      Top = 244
      Width = 275
      Height = 26
      Enabled = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 18
      ParentFont = False
      TabOrder = 11
      Text = '  No data'
      OnChange = e17Change
      Items.Strings = (
        '  AGC mode to white'
        '  Black point half-binding mode'
        '  AGC mode with black point binding')
    end
    object e16: TComboBox
      Left = 310
      Top = 212
      Width = 275
      Height = 26
      Enabled = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 18
      ParentFont = False
      TabOrder = 12
      Text = '  No data'
      OnChange = e15Change
      Items.Strings = (
        '  4 mcs'
        '  8 mcs'
        '  32 mcs'
        '  100 mcs'
        '  500 mcs'
        '  2 ms'
        '  10 ms'
        '  20 ms'
        '')
    end
    object e15: TComboBox
      Left = 310
      Top = 180
      Width = 275
      Height = 26
      Enabled = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 18
      ParentFont = False
      TabOrder = 13
      Text = '  No data'
      OnChange = e15Change
      Items.Strings = (
        '  Limited mode'
        '  Fixed mode')
    end
    object e14: TComboBox
      Left = 310
      Top = 148
      Width = 275
      Height = 26
      Enabled = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 18
      ParentFont = False
      TabOrder = 14
      Text = '  No data'
      OnChange = e13Change
      Items.Strings = (
        '  Off'
        '  On')
    end
    object e13: TComboBox
      Left = 310
      Top = 116
      Width = 275
      Height = 26
      Enabled = False
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 18
      ParentFont = False
      TabOrder = 15
      Text = '  No data'
      OnChange = e13Change
      Items.Strings = (
        '  512 pix,  0.23%    of frame area.'
        '  1024 pix,  0.47%   of frame area. '
        '  2048 pix,  0.94%   of frame area.'
        '  4096 pix,  1.88%   of frame area.'
        '  6144 pix,  2.81%   of frame area.'
        '  8192 pix,  3.76%   of frame area.'
        '  12288 pix,  5.64%  of frame area.'
        '  16384 pix,  7.52%  of frame area.'
        '  24576 pix, 11.3%   of frame area.'
        '  32768 pix, 15%     of frame area.')
    end
    object e0: TEdit
      Left = 19
      Top = 26
      Width = 285
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 16
      Text = '  Parameters'
    end
    object e10: TEdit
      Left = 310
      Top = 26
      Width = 275
      Height = 24
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
      Text = '  Value'
    end
    object GroupBox6: TGroupBox
      Left = 29
      Top = 320
      Width = 265
      Height = 71
      Caption = 'Save TVD mode'
      Enabled = False
      TabOrder = 18
      object Button3: TButton
        Tag = 30
        Left = 215
        Top = 24
        Width = 35
        Height = 30
        Caption = '3'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Button4Click
      end
      object Button4: TButton
        Tag = 22
        Left = 15
        Top = 24
        Width = 35
        Height = 30
        Caption = '1'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button4Click
      end
      object Button6: TButton
        Tag = 26
        Left = 115
        Top = 24
        Width = 35
        Height = 30
        Caption = '2'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = Button4Click
      end
    end
    object GroupBox7: TGroupBox
      Left = 315
      Top = 320
      Width = 265
      Height = 71
      Caption = 'Load TVD mode'
      Enabled = False
      TabOrder = 19
      object Button7: TButton
        Tag = 30
        Left = 215
        Top = 24
        Width = 35
        Height = 30
        Caption = '3'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Button14Click
      end
      object Button14: TButton
        Tag = 22
        Left = 15
        Top = 24
        Width = 35
        Height = 30
        Caption = '1'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button14Click
      end
      object Button15: TButton
        Tag = 26
        Left = 115
        Top = 24
        Width = 35
        Height = 30
        Caption = '2'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = Button14Click
      end
    end
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = True
    LinearVolume = True
    Left = 24
    Top = 144
  end
  object SampleGrabber: TSampleGrabber
    OnBuffer = SampleGrabberBuffer
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717EEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 64
    Top = 144
  end
  object XComm1: TXComm
    BaudRate = br57600
    BaudValue = 57600
    Buffers.InputSize = 128
    Buffers.OutputSize = 128
    Buffers.InputTimeout = 100
    Buffers.OutputTimeout = 100
    RTSSettings = []
    DataControl.DataBits = db8
    DataControl.Parity = paNone
    DataControl.StopBits = sb1
    DeviceName = 'COM15'
    DTRSettings = []
    EventChars.XonChar = #17
    EventChars.XoffChar = #19
    EventChars.EofChar = #0
    EventChars.ErrorChar = #0
    EventChars.EventChar = #10
    MonitorEvents = [deChar, deFlag, deOutEmpty]
    FlowControl = fcNone
    Options = []
    Synchronize = True
    Timeouts.ReadInterval = 1
    Timeouts.ReadMultiplier = 0
    Timeouts.ReadConstant = 1
    Timeouts.WriteMultiplier = 0
    Timeouts.WriteConstant = 1
    XOnXOffSettings = []
    Left = 104
    Top = 144
  end
  object XComm2: TXComm
    Tag = 156
    BaudRate = br57600
    BaudValue = 57600
    Buffers.InputSize = 128
    Buffers.OutputSize = 128
    Buffers.InputTimeout = 300
    Buffers.OutputTimeout = 100
    RTSSettings = []
    DataControl.DataBits = db8
    DataControl.Parity = paNone
    DataControl.StopBits = sb1
    DeviceName = 'COM14'
    DTRSettings = []
    EventChars.XonChar = #17
    EventChars.XoffChar = #19
    EventChars.EofChar = #0
    EventChars.ErrorChar = #0
    EventChars.EventChar = #10
    MonitorEvents = [deChar, deFlag, deOutEmpty]
    FlowControl = fcNone
    Options = []
    Synchronize = True
    Timeouts.ReadInterval = 1
    Timeouts.ReadMultiplier = 0
    Timeouts.ReadConstant = 1
    Timeouts.WriteMultiplier = 0
    Timeouts.WriteConstant = 1
    XOnXOffSettings = []
    Left = 144
    Top = 144
  end
  object TT: TTimer
    Enabled = False
    OnTimer = TTTimer
    Left = 184
    Top = 144
  end
end
