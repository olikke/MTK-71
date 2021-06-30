object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Enter Password'
  ClientHeight = 353
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 24
    Top = 32
    Width = 97
    Height = 13
    Caption = 'Enter the  password'
  end
  object Label4: TLabel
    Left = 24
    Top = 76
    Width = 149
    Height = 13
    Caption = 'Enter the password repeatedly'
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
    OnKeyDown = Edit2KeyDown
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 330
    Width = 657
    Height = 23
    Panels = <>
    SimplePanel = True
    ExplicitTop = 345
    ExplicitWidth = 649
  end
  object Panel1: TPanel
    Left = 8
    Top = 0
    Width = 310
    Height = 127
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    object Label1: TLabel
      Left = 16
      Top = 21
      Width = 97
      Height = 13
      Caption = 'Enter the  password'
    end
    object Edit3: TEdit
      Left = 131
      Top = 22
      Width = 121
      Height = 21
      Hint = 
        'The password consists of any combination of letters, figures and' +
        ' marks. The length of the password does not exceed 10 symbols'
      PasswordChar = '*'
      TabOrder = 0
      OnChange = Edit1Change
      OnClick = Edit1Click
      OnKeyDown = Edit3KeyDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 657
    Height = 330
    Align = alClient
    TabOrder = 4
    Visible = False
    ExplicitWidth = 649
    ExplicitHeight = 345
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 655
      Height = 43
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 0
      ExplicitWidth = 670
      object Button3: TButton
        Left = 8
        Top = 8
        Width = 137
        Height = 25
        Caption = 'Change Admin Password'
        TabOrder = 0
        OnClick = Button3Click
      end
      object Button2: TButton
        Left = 400
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Add'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button1: TButton
        Left = 512
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Delete'
        Enabled = False
        TabOrder = 2
        OnClick = Button1Click
      end
    end
    object ListView2: TListView
      Left = 1
      Top = 44
      Width = 655
      Height = 285
      Align = alClient
      Columns = <
        item
          Caption = 'Password_ID'
          Width = 80
        end
        item
          Caption = 'Password'
          Width = 80
        end
        item
          Caption = 'Operator Name'
          Width = 150
        end
        item
          Caption = 'Date create'
          Width = 110
        end
        item
          Caption = 'Date of last use'
          Width = 110
        end
        item
          Caption = 'Quantity of use'
          Width = 100
        end>
      GridLines = True
      RowSelect = True
      TabOrder = 1
      ViewStyle = vsReport
      OnClick = ListView2Click
      ExplicitLeft = 24
      ExplicitTop = 76
      ExplicitWidth = 585
      ExplicitHeight = 73
    end
  end
end
