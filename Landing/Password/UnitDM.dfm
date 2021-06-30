object DM: TDM
  OldCreateOrder = False
  Height = 264
  Width = 384
  object MTK: TDatabase
    AliasName = 'MTKeb71'
    DatabaseName = 'work'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=sad'
      'Password=100781')
    SessionName = 'Default'
    Left = 18
    Top = 10
  end
  object Password: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      'Select Pass'
      'from Password'
      'where Pass_ID=:Pass_ID')
    Left = 64
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Pass_ID'
        ParamType = ptUnknown
      end>
    object PasswordPass: TStringField
      DisplayWidth = 10
      FieldName = 'Pass'
      FixedChar = True
      Size = 10
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
    Left = 136
    Top = 8
  end
  object ReadPassword: TQuery
    DatabaseName = 'Work'
    SQL.Strings = (
      'Select Pass, NameOP, '
      '          DateCreate, DateLastUse, '
      '          QuantityUse '
      'from Password'
      'Where Pass_ID=:Pass_ID')
    Left = 224
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Pass_ID'
        ParamType = ptUnknown
      end>
    object ReadPasswordPass: TStringField
      FieldName = 'Pass'
    end
    object ReadPasswordNameOP: TStringField
      FieldName = 'NameOP'
      FixedChar = True
      Size = 50
    end
    object ReadPasswordDateCreate: TStringField
      FieldName = 'DateCreate'
      FixedChar = True
      Size = 50
    end
    object ReadPasswordDateLastUse: TStringField
      FieldName = 'DateLastUse'
      FixedChar = True
      Size = 50
    end
    object ReadPasswordQuantityUse: TIntegerField
      FieldName = 'QuantityUse'
    end
  end
end
