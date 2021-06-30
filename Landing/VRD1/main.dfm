object nMain: TnMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'WriteTV'
  ClientHeight = 736
  ClientWidth = 1018
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 846
    Top = 0
    Width = 172
    Height = 736
    Align = alRight
    Caption = 'Control Panel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    VerticalAlignment = taAlignTop
    object GroupBox3: TGroupBox
      Left = 1
      Top = 300
      Width = 170
      Height = 323
      Caption = 'VRD State'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Shape2: TShape
        Left = 140
        Top = 0
        Width = 17
        Height = 19
        Shape = stCircle
      end
      object Label6: TLabel
        Left = 5
        Top = 30
        Width = 127
        Height = 16
        Caption = 'Video Signal State'
      end
      object Shape3: TShape
        Left = 140
        Top = 29
        Width = 17
        Height = 19
        Shape = stCircle
      end
      object GroupBox4: TGroupBox
        Left = 6
        Top = 60
        Width = 155
        Height = 97
        Caption = 'Network Connection'
        TabOrder = 0
        object sLAN1: TShape
          Left = 40
          Top = 35
          Width = 19
          Height = 19
          Shape = stCircle
        end
        object sLAN2: TShape
          Left = 40
          Top = 60
          Width = 19
          Height = 19
          Shape = stCircle
        end
        object Label4: TLabel
          Left = 70
          Top = 35
          Width = 39
          Height = 16
          Caption = 'LAN 1'
        end
        object Label5: TLabel
          Left = 70
          Top = 60
          Width = 39
          Height = 16
          Caption = 'LAN 2'
        end
      end
      object GroupBox5: TGroupBox
        Left = 11
        Top = 163
        Width = 150
        Height = 153
        Caption = 'Hard Disk State'
        TabOrder = 1
        object StringGrid1: TStringGrid
          Left = 5
          Top = 32
          Width = 139
          Height = 108
          Color = clInfoBk
          ColCount = 2
          DefaultColWidth = 67
          Enabled = False
          FixedCols = 0
          RowCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnDrawCell = StringGrid1DrawCell
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 50
      Width = 170
      Height = 180
      Caption = 'Recording State'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 5
        Top = 75
        Width = 63
        Height = 16
        Caption = 'File Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 5
        Top = 125
        Width = 76
        Height = 16
        Caption = 'Record Size'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 5
        Top = 25
        Width = 98
        Height = 16
        Caption = 'Aircraft Number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Edit3: TEdit
        Left = 5
        Top = 45
        Width = 160
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object StaticText1: TStaticText
        Left = 5
        Top = 95
        Width = 160
        Height = 22
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clBtnHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
      end
      object StaticText2: TStaticText
        Left = 5
        Top = 145
        Width = 160
        Height = 22
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clBtnHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 2
      end
    end
    object Button1: TButton
      Left = 18
      Top = 230
      Width = 124
      Height = 33
      Caption = 'Start Record'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Bbt
    end
  end
  object VideoWindow1: TVideoWindow
    Left = 45
    Top = 47
    Width = 768
    Height = 576
    Mode = vmVMR
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowed
    VMROptions.Preferences = [vpForceOverlays, vpForceMixer, vpPreferAGPMemWhenMixing]
    Color = clBlack
    OnDblClick = VideoWindow1DblClick
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = True
    LinearVolume = True
    Left = 120
    Top = 88
  end
  object SampleGrabber: TSampleGrabber
    OnBuffer = SampleGrabberBuffer
    FilterGraph = FilterGraph1
    MediaType.data = {
      7669647300001000800000AA00389B717EEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 152
    Top = 88
  end
  object IPAddrMon: TIdIPAddrMon
    Active = False
    Busy = False
    AdapterCount = 2
    Left = 184
    Top = 88
  end
  object HostList: TQuery
    DatabaseName = 'work'
    SQL.Strings = (
      'Select IP1,IP2,Mask1,Mask2'
      'from HostList'
      'where Device_ID=:Device_ID'
      '')
    Left = 226
    Top = 90
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Device_ID'
        ParamType = ptInput
      end>
    object HostListIP1: TStringField
      FieldName = 'IP1'
      Origin = 'WORK.HostList.IP1'
      Size = 15
    end
    object HostListIP2: TStringField
      FieldName = 'IP2'
      Origin = 'WORK.HostList.IP2'
      Size = 15
    end
    object HostListMask1: TStringField
      FieldName = 'Mask1'
      Origin = 'WORK.HostList.Mask1'
      Size = 15
    end
    object HostListMask2: TStringField
      FieldName = 'Mask2'
      Origin = 'WORK.HostList.Mask2'
      Size = 15
    end
  end
  object MTK: TDatabase
    AliasName = 'MTKeb71'
    DatabaseName = 'work'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=sad'
      'Password=100781')
    SessionName = 'Default'
    Left = 74
    Top = 90
  end
  object UDPCommandServer: TIdUDPServer
    Bindings = <>
    DefaultPort = 4355
    OnUDPRead = UDPCommandServerUDPRead
    Left = 264
    Top = 88
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 184
    Top = 136
  end
  object LASetup: TQuery
    DatabaseName = 'work'
    SQL.Strings = (
      'Select LA_ID,mName,XE,YE,ZE,XF,YF,ZF,XG,YG,ZG'
      'from LASetup')
    Left = 224
    Top = 136
    object LASetupLA_ID: TSmallintField
      FieldName = 'LA_ID'
    end
    object LASetupmName: TStringField
      FieldName = 'mName'
      Size = 50
    end
    object LASetupXE: TFloatField
      FieldName = 'XE'
    end
    object LASetupYE: TFloatField
      FieldName = 'YE'
    end
    object LASetupZE: TFloatField
      FieldName = 'ZE'
    end
    object LASetupXF: TFloatField
      FieldName = 'XF'
    end
    object LASetupYF: TFloatField
      FieldName = 'YF'
    end
    object LASetupZF: TFloatField
      FieldName = 'ZF'
    end
    object LASetupXG: TFloatField
      FieldName = 'XG'
    end
    object LASetupYG: TFloatField
      FieldName = 'YG'
    end
    object LASetupZG: TFloatField
      FieldName = 'ZG'
    end
  end
  object Timer2: TTimer
    Interval = 10000
    OnTimer = Timer2Timer
    Left = 144
    Top = 136
  end
end
