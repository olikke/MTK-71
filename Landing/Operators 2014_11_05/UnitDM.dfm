object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 675
  Width = 754
  object MTK: TDatabase
    AliasName = 'MTKeb71'
    DatabaseName = 'work'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=sad'
      'Password=100781')
    SessionName = 'Default'
    Left = 50
    Top = 34
  end
  object ComPort: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      
        'Select ComPort,BaudRate,ByteSize,EnableDTR,EnableRTS,Parity,Stop' +
        'Bits,TimeOut'
      'from Com_Port'
      '')
    Left = 98
    Top = 34
    object ComPortComPort: TIntegerField
      FieldName = 'ComPort'
    end
    object ComPortBaudRate: TIntegerField
      FieldName = 'BaudRate'
    end
    object ComPortByteSize: TIntegerField
      FieldName = 'ByteSize'
    end
    object ComPortEnableDTR: TBooleanField
      FieldName = 'EnableDTR'
    end
    object ComPortEnableRTS: TBooleanField
      FieldName = 'EnableRTS'
    end
    object ComPortParity: TIntegerField
      FieldName = 'Parity'
    end
    object ComPortStopBits: TIntegerField
      FieldName = 'StopBits'
    end
    object ComPortTimeOut: TIntegerField
      FieldName = 'TimeOut'
    end
  end
  object Command_2220: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      'Select Command_ID, Command,Comment_Eng'
      'from Command_TM2220'
      '')
    Left = 98
    Top = 338
    object Command_2220Command_ID: TIntegerField
      FieldName = 'Command_ID'
      Origin = 'WORK.Command_TM2220.Command_ID'
    end
    object Command_2220Command: TIntegerField
      FieldName = 'Command'
      Origin = 'WORK.Command_TM2220.Command'
    end
    object Command_2220Comment_Eng: TStringField
      FieldName = 'Comment_Eng'
      Origin = 'WORK.Command_TM2220.Comment_Eng'
      FixedChar = True
      Size = 100
    end
  end
  object ComDev: TQuery
    DatabaseName = 'work'
    SQL.Strings = (
      'Select Device_ID, ComPort, Adress,DeviceName'
      'from Com_Adress'
      '')
    Left = 98
    Top = 82
    object ComDevDevice_ID: TIntegerField
      FieldName = 'Device_ID'
      Origin = 'WORK.Com_Adress.Device_ID'
    end
    object ComDevComPort: TIntegerField
      FieldName = 'ComPort'
      Origin = 'WORK.Com_Adress.ComPort'
    end
    object ComDevAdress: TIntegerField
      FieldName = 'Adress'
      Origin = 'WORK.Com_Adress.Adress'
    end
    object ComDevDeviceName: TStringField
      FieldName = 'DeviceName'
      Origin = 'WORK.Com_Adress.DeviceName'
      FixedChar = True
    end
  end
  object QDin: TQuery
    DatabaseName = 'work'
    Left = 96
    Top = 240
  end
  object DevList: TQuery
    DatabaseName = 'work'
    SQL.Strings = (
      'Select Device_ID, Device_Name, Device_Name_Eng '
      'from DevList')
    Left = 96
    Top = 144
    object DevListDevice_Name: TStringField
      FieldName = 'Device_Name'
      Origin = 'WORK.DevList.Device_Name'
      FixedChar = True
    end
    object DevListDevice_Name_Eng: TStringField
      FieldName = 'Device_Name_Eng'
      Origin = 'WORK.DevList.Device_Name_Eng'
      FixedChar = True
      Size = 100
    end
    object DevListDevice_ID: TIntegerField
      FieldName = 'Device_ID'
      Origin = 'WORK.DevList.Device_ID'
    end
  end
  object Command_5401: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      
        'Select Command_ID, Command,Comment_Eng,Command_Count,Answer_Coun' +
        't'
      'from Command_EM5401'
      '')
    Left = 98
    Top = 386
    object Command_5401Command_ID: TIntegerField
      FieldName = 'Command_ID'
      Origin = 'WORK.Command_EM5401.Command_ID'
    end
    object Command_5401Command: TIntegerField
      FieldName = 'Command'
      Origin = 'WORK.Command_EM5401.Command'
    end
    object Command_5401Comment_Eng: TStringField
      FieldName = 'Comment_Eng'
      Origin = 'WORK.Command_EM5401.Comment_Eng'
      FixedChar = True
      Size = 100
    end
    object Command_5401Command_Count: TIntegerField
      FieldName = 'Command_Count'
      Origin = 'WORK.Command_EM5401.Command_Count'
    end
    object Command_5401Answer_Count: TIntegerField
      FieldName = 'Answer_Count'
      Origin = 'WORK.Command_EM5401.Answer_Count'
    end
  end
  object EM5401Param: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      'Select Serial_Numb,FTP1,FTP2'
      'from EM5401Param'
      'where Device_ID=:Device_ID'
      '')
    Left = 194
    Top = 394
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Device_ID'
        ParamType = ptInput
      end>
    object EM5401ParamSerial_Numb: TIntegerField
      FieldName = 'Serial_Numb'
      Origin = 'WORK.EM5401Param.Serial_Numb'
    end
    object EM5401ParamFTP1: TSmallintField
      FieldName = 'FTP1'
      Origin = 'WORK.EM5401Param.FTP1'
    end
    object EM5401ParamFTP2: TSmallintField
      FieldName = 'FTP2'
      Origin = 'WORK.EM5401Param.FTP2'
    end
  end
  object Command_7401: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      
        'Select Command_ID, Command,Comment_Eng,Command_Count,Answer_Coun' +
        't'
      'from Command_EM7401'
      '')
    Left = 98
    Top = 442
    object Command_7401Command_ID: TIntegerField
      FieldName = 'Command_ID'
      Origin = 'WORK.Command_EM7401.Command_ID'
    end
    object Command_7401Command: TIntegerField
      FieldName = 'Command'
      Origin = 'WORK.Command_EM7401.Command'
    end
    object Command_7401Comment_Eng: TStringField
      FieldName = 'Comment_Eng'
      Origin = 'WORK.Command_EM7401.Comment_Eng'
      FixedChar = True
      Size = 100
    end
    object Command_7401Command_Count: TIntegerField
      FieldName = 'Command_Count'
      Origin = 'WORK.Command_EM7401.Command_Count'
    end
    object Command_7401Answer_Count: TIntegerField
      FieldName = 'Answer_Count'
      Origin = 'WORK.Command_EM7401.Answer_Count'
    end
  end
  object Command_2437: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      
        'Select Command_ID, Command,Comment_Eng,Command_Count,Answer_Coun' +
        't'
      'from Command_EM2437'
      '')
    Left = 98
    Top = 506
    object Command_2437Command_ID: TIntegerField
      FieldName = 'Command_ID'
      Origin = 'WORK.Command_EM2437.Command_ID'
    end
    object Command_2437Command: TIntegerField
      FieldName = 'Command'
      Origin = 'WORK.Command_EM2437.Command'
    end
    object Command_2437Comment_Eng: TStringField
      FieldName = 'Comment_Eng'
      Origin = 'WORK.Command_EM2437.Comment_Eng'
      FixedChar = True
      Size = 100
    end
    object Command_2437Command_Count: TIntegerField
      FieldName = 'Command_Count'
      Origin = 'WORK.Command_EM2437.Command_Count'
    end
    object Command_2437Answer_Count: TIntegerField
      FieldName = 'Answer_Count'
      Origin = 'WORK.Command_EM2437.Answer_Count'
    end
  end
  object EM2437Param: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      'Select Serial_Numb,PSS,'
      'Gain1,Gain2,Gain3,Gain4,'
      'Equal1,Equal2,Equal3,Equal4,'
      'PT11,PT12,PT21,PT22'
      'from EM2437Param'
      'where Device_ID=:Device_ID'
      '')
    Left = 194
    Top = 506
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Device_ID'
        ParamType = ptInput
      end>
    object EM2437ParamSerial_Numb: TIntegerField
      FieldName = 'Serial_Numb'
    end
    object EM2437ParamPSS: TIntegerField
      FieldName = 'PSS'
    end
    object EM2437ParamGain1: TIntegerField
      FieldName = 'Gain1'
    end
    object EM2437ParamGain2: TIntegerField
      FieldName = 'Gain2'
    end
    object EM2437ParamGain3: TIntegerField
      FieldName = 'Gain3'
    end
    object EM2437ParamGain4: TIntegerField
      FieldName = 'Gain4'
    end
    object EM2437ParamEqual1: TIntegerField
      FieldName = 'Equal1'
    end
    object EM2437ParamEqual2: TIntegerField
      FieldName = 'Equal2'
    end
    object EM2437ParamEqual3: TIntegerField
      FieldName = 'Equal3'
    end
    object EM2437ParamEqual4: TIntegerField
      FieldName = 'Equal4'
    end
    object EM2437ParamPT11: TIntegerField
      FieldName = 'PT11'
    end
    object EM2437ParamPT12: TIntegerField
      FieldName = 'PT12'
    end
    object EM2437ParamPT21: TIntegerField
      FieldName = 'PT21'
    end
    object EM2437ParamPT22: TIntegerField
      FieldName = 'PT22'
    end
  end
  object EM7401Param: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      'Select Serial_Numb,SwithTable'
      'from EM7401Param'
      'where Device_ID=:Device_ID'
      '')
    Left = 194
    Top = 442
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Device_ID'
        ParamType = ptInput
      end>
    object EM7401ParamSerial_Numb: TIntegerField
      FieldName = 'Serial_Numb'
    end
    object EM7401ParamSwithTable: TStringField
      FieldName = 'SwithTable'
      FixedChar = True
      Size = 16
    end
  end
  object HostList: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      'Select IP1,IP2,Mask1,Mask2'
      'from HostList'
      'where Device_ID=:Device_ID'
      '')
    Left = 98
    Top = 562
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
  object ExternalConn: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      'Select  Name, Include'
      'from External_Connection'
      'where Dev_Type=:Dev_Type')
    Left = 98
    Top = 618
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Dev_Type'
        ParamType = ptInput
      end>
    object ExternalConnName: TStringField
      FieldName = 'Name'
      Origin = 'WORK.External_Connection.Name'
      Size = 50
    end
    object ExternalConnInclude: TBooleanField
      FieldName = 'Include'
      Origin = 'WORK.External_Connection.Include'
    end
  end
  object Pass: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      'Select Pass,Pass_ID,QuantityUse'
      'from Password'
      ''
      ''
      ''
      '')
    Left = 194
    Top = 562
    object PassPass: TStringField
      FieldName = 'Pass'
      Size = 10
    end
    object PassPass_ID: TIntegerField
      FieldName = 'Pass_ID'
    end
    object PassQuantityUse: TIntegerField
      FieldName = 'QuantityUse'
    end
  end
  object EnterPassword: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      'Update Password'
      'Set Pass=:Pass,'
      '      NameOP=:NameOP;'
      'where Pass_ID=:Pass_ID'
      '')
    Left = 192
    Top = 616
  end
  object LASetup: TQuery
    DatabaseName = 'work'
    SQL.Strings = (
      'Select LA_ID,mName,XE,YE,ZE,XF,YF,ZF,XG,YG,ZG'
      'from LASetup')
    Left = 192
    Top = 288
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
  object KUSetup: TQuery
    DatabaseName = 'work'
    SQL.Strings = (
      'Select Device_ID,X,Y,Z,Az,Um,UsY,AhxY,UsC,AhxC,Focus,'
      'Rx,Kx,Ry,Ky,X0,Y0,Alf,Xi,Om'
      'from KUSetup')
    Left = 96
    Top = 288
    object KUSetupX: TFloatField
      FieldName = 'X'
    end
    object KUSetupY: TFloatField
      FieldName = 'Y'
    end
    object KUSetupZ: TFloatField
      FieldName = 'Z'
    end
    object KUSetupAz: TFloatField
      FieldName = 'Az'
    end
    object KUSetupUm: TFloatField
      FieldName = 'Um'
    end
    object KUSetupUsY: TIntegerField
      FieldName = 'UsY'
    end
    object KUSetupAhxY: TIntegerField
      FieldName = 'AhxY'
    end
    object KUSetupUsC: TIntegerField
      FieldName = 'UsC'
    end
    object KUSetupAhxC: TIntegerField
      FieldName = 'AhxC'
    end
    object KUSetupFocus: TFloatField
      FieldName = 'Focus'
    end
    object KUSetupRx: TFloatField
      FieldName = 'Rx'
    end
    object KUSetupKx: TFloatField
      FieldName = 'Kx'
    end
    object KUSetupRy: TFloatField
      FieldName = 'Ry'
    end
    object KUSetupKy: TFloatField
      FieldName = 'Ky'
    end
    object KUSetupX0: TFloatField
      FieldName = 'X0'
    end
    object KUSetupY0: TFloatField
      FieldName = 'Y0'
    end
    object KUSetupDevice_ID: TIntegerField
      FieldName = 'Device_ID'
    end
    object KUSetupAlf: TFloatField
      FieldName = 'Alf'
    end
    object KUSetupXi: TFloatField
      FieldName = 'Xi'
    end
    object KUSetupOm: TFloatField
      FieldName = 'Om'
    end
  end
  object Protocol: TQuery
    DatabaseName = 'work'
    Left = 224
    Top = 40
  end
  object SetTitle: TQuery
    DatabaseName = 'work'
    SQL.Strings = (
      
        'insert into Protocol(Protocol_ID,StartDate,Glidepath,KUList,Oper' +
        'ator)'
      'select :Protocol_ID, :StartDate, :Glidepatch, :KUList, :Operator')
    Left = 224
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Protocol_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'StartDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Glidepath'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KUList'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Operator'
        ParamType = ptUnknown
      end>
  end
  object SetData: TQuery
    DatabaseName = 'work'
    SQL.Strings = (
      
        'insert into ProtocolDate (Protocol_ID,N,Drl,Dnrl,Dntv,LRrl,LRtv,' +
        'UDrl,UDtv,Tracking,DTime)'
      
        'select :Protocol_ID, :N, :Drl, :Dnrl, :Dntv, :LRrl, :LRtv, :UDrl' +
        ', :UDtv, :Tracking, :DTime')
    Left = 224
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Protocol_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'N'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Drl'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Dnrl'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Dntv'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'LRrl'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'LRtv'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'UDrl'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'UDtv'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Tracking'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DTime'
        ParamType = ptUnknown
      end>
  end
  object FilterParam_F7: TQuery
    DatabaseName = 'work'
    SQL.Strings = (
      'Select Filter_ID, RBL,RWH'
      'from FilterParam_F7'
      'where Filter_ID=:Filter_ID')
    Left = 280
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Filter_ID'
        ParamType = ptInputOutput
      end>
    object FilterParam_F7RBL: TIntegerField
      FieldName = 'RBL'
      Origin = 'WORK.FilterParam_F7.RBL'
    end
    object FilterParam_F7RWH: TIntegerField
      FieldName = 'RWH'
      Origin = 'WORK.FilterParam_F7.RWH'
    end
  end
  object FilterParam_F8: TQuery
    DatabaseName = 'work'
    SQL.Strings = (
      'Select Threshold'
      'from FilterParam_F8'
      'where Filter_ID=:Filter_ID')
    Left = 288
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Filter_ID'
        ParamType = ptInputOutput
      end>
    object FilterParam_F8Threshold: TIntegerField
      FieldName = 'Threshold'
      Origin = 'WORK.FilterParam_F8.Threshold'
    end
  end
  object Distance: TQuery
    DatabaseName = 'work'
    SQL.Strings = (
      'Select MaxDistance,MinDistance from Distance')
    Left = 192
    Top = 240
    object DistanceMaxDistance: TIntegerField
      FieldName = 'MaxDistance'
      Origin = 'WORK.Distance.MaxDistance'
    end
    object DistanceMinDistance: TIntegerField
      FieldName = 'MinDistance'
      Origin = 'WORK.Distance.MinDistance'
    end
  end
  object MetricConst: TQuery
    DatabaseName = 'work'
    SQL.Strings = (
      'Select Mile, Foot from MetricConst')
    Left = 192
    Top = 344
    object MetricConstMile: TFloatField
      FieldName = 'Mile'
      Origin = 'WORK.MetricConst.Mile'
    end
    object MetricConstFoot: TFloatField
      FieldName = 'Foot'
      Origin = 'WORK.MetricConst.Foot'
    end
  end
  object Miscellaneous: TQuery
    DatabaseName = 'work'
    SQL.Strings = (
      
        'Select Parameter,Value from Miscellaneous where Parameter=:Param' +
        'eter')
    Left = 280
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Parameter'
        ParamType = ptUnknown
      end>
    object MiscellaneousParameter: TStringField
      FieldName = 'Parameter'
      Size = 50
    end
    object MiscellaneousValue: TBooleanField
      FieldName = 'Value'
    end
  end
  object SetTitle2: TQuery
    DatabaseName = 'work'
    SQL.Strings = (
      'insert into Protocol(Type,Number)'
      'select :Protocol_ID, :Type, :Number')
    Left = 288
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Protocol_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Number'
        ParamType = ptUnknown
      end>
  end
end
