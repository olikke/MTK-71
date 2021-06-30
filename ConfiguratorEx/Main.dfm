object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'MTK config'
  ClientHeight = 286
  ClientWidth = 822
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object XiPanel1: TXiPanel
    Left = 0
    Top = 0
    Width = 822
    Height = 286
    ColorFace = clWhite
    ColorGrad = 16769217
    ColorLight = 15767117
    ColorDark = 11753728
    ColorScheme = csSky
    FillDirection = fdVertical
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    object Label1: TLabel
      Left = 32
      Top = 26
      Width = 233
      Height = 16
      Caption = 'Step 1. Choice device to configuration'
    end
    object Label2: TLabel
      Left = 32
      Top = 80
      Width = 198
      Height = 16
      Caption = 'Step 2. Prepare to configuration'
    end
    object Label3: TLabel
      Left = 340
      Top = 26
      Width = 99
      Height = 16
      Caption = 'Step 3. Progress'
    end
    object ComboBox1: TComboBox
      Left = 32
      Top = 49
      Width = 300
      Height = 24
      ItemHeight = 16
      TabOrder = 0
      OnChange = ComboBox1Change
      Items.Strings = (
        'Remultiplexer        EM-7302-1   (A28/A7)'
        'UPS module            TM-2411-1   (A28/A14)'
        'UPS module            TM-2411-1   (A28/A15) '
        'UPS module            TM-2411-1   (A28/A16) '
        'Gateway module   TM-2409-1   (A28/A3)'
        'Gateway module   TM-2409-1   (A28/A4)'
        'Channel selector   EM-7303-1   (A28/A6)')
    end
    object Memo1: TMemo
      Left = 32
      Top = 103
      Width = 300
      Height = 122
      Lines.Strings = (
        '')
      TabOrder = 1
    end
    object Button1: TButton
      Left = 34
      Top = 231
      Width = 300
      Height = 25
      Caption = 'GO'
      Enabled = False
      TabOrder = 2
      OnClick = Button1Click
    end
    object Memo2: TMemo
      Left = 340
      Top = 49
      Width = 449
      Height = 207
      Lines.Strings = (
        '')
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object ComboBox2: TComboBox
      Left = 32
      Top = 262
      Width = 300
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ItemHeight = 14
      ParentFont = False
      TabOrder = 4
      Visible = False
      OnChange = ComboBox2Change
    end
  end
  object XPManifest1: TXPManifest
    Left = 16
    Top = 8
  end
  object UDPServer: TIdUDPServer
    BroadcastEnabled = True
    Bindings = <>
    DefaultPort = 0
    OnUDPRead = UDPServerUDPRead
    Left = 48
    Top = 8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 80
    Top = 8
  end
  object IPAddrMon: TIdIPAddrMon
    Active = False
    Busy = False
    AdapterCount = 2
    Left = 112
    Top = 8
  end
end
