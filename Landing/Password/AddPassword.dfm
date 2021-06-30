object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CreateNewPassword'
  ClientHeight = 197
  ClientWidth = 513
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
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 98
    Height = 13
    Caption = 'Enter new Password'
  end
  object Label4: TLabel
    Left = 24
    Top = 76
    Width = 149
    Height = 13
    Caption = 'Enter the password repeatedly'
    Visible = False
  end
  object Label2: TLabel
    Left = 24
    Top = 120
    Width = 122
    Height = 13
    Caption = 'Enter the Operator Name'
    Visible = False
  end
  object Edit1: TEdit
    Left = 179
    Top = 29
    Width = 121
    Height = 21
    Hint = 
      'The password consists of any combination of letters, figures and' +
      ' marks. The length of the password does not exceed 10 symbols'
    PasswordChar = '*'
    TabOrder = 0
    OnChange = Edit1Change
    OnClick = Edit1Click
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 179
    Top = 73
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Visible = False
    OnChange = Edit1Change
    OnClick = Edit1Click
    OnKeyDown = Edit2KeyDown
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 174
    Width = 513
    Height = 23
    Panels = <>
    SimplePanel = True
    ExplicitTop = 172
    ExplicitWidth = 511
  end
  object Edit3: TEdit
    Left = 179
    Top = 117
    Width = 286
    Height = 21
    TabOrder = 3
    Visible = False
    OnClick = Edit1Click
    OnKeyDown = Edit3KeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 513
    Height = 174
    Align = alClient
    TabOrder = 4
    Visible = False
    ExplicitTop = 164
    object Label3: TLabel
      Left = 50
      Top = 32
      Width = 165
      Height = 13
      Caption = 'Enter Last Administrator Password'
    end
    object Label5: TLabel
      Left = 50
      Top = 67
      Width = 166
      Height = 13
      Caption = 'Enter New Administrator Password'
      Visible = False
    end
    object Label6: TLabel
      Left = 50
      Top = 100
      Width = 130
      Height = 13
      Caption = 'Enter Password repeatedly'
      Visible = False
    end
    object Edit4: TEdit
      Left = 250
      Top = 29
      Width = 121
      Height = 21
      PasswordChar = '#'
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = Edit4KeyDown
    end
    object Edit5: TEdit
      Left = 250
      Top = 64
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      Visible = False
      OnChange = Edit1Change
      OnClick = Edit1Click
      OnKeyDown = Edit5KeyDown
    end
    object Edit6: TEdit
      Left = 250
      Top = 100
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
      Visible = False
      OnChange = Edit1Change
      OnClick = Edit1Click
      OnKeyDown = Edit6KeyDown
    end
  end
end
