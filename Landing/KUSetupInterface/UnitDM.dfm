object DM: TDM
  OldCreateOrder = False
  Height = 406
  Width = 212
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
  object ComDev: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      'Select Device_ID, ComPort, Adress'
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
  end
  object Command_2220: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      'Select Command_ID, Command,Comment_Eng'
      'from Command_TM2220'
      ''
      '')
    Left = 98
    Top = 130
    object Command_2220Command_ID: TIntegerField
      FieldName = 'Command_ID'
    end
    object Command_2220Command: TIntegerField
      FieldName = 'Command'
    end
    object Command_2220Comment_Eng: TStringField
      FieldName = 'Comment_Eng'
      FixedChar = True
      Size = 100
    end
  end
  object QDin: TQuery
    DatabaseName = 'work'
    Left = 96
    Top = 184
  end
  object Query: TQuery
    DatabaseName = 'work'
    Left = 96
    Top = 248
  end
  object Command_7401: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      
        'Select Command_ID, Command,Comment_Eng,Command_Count,Answer_Coun' +
        't'
      'from Command_EM7401'
      '')
    Left = 98
    Top = 298
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
end
