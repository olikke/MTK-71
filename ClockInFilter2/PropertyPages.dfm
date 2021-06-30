object Prop: TProp
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'PropertyPages'
  ClientHeight = 439
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 8
    Top = 40
    Width = 265
    Height = 153
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 0
    object Label7: TLabel
      Left = 30
      Top = 20
      Width = 107
      Height = 17
      Caption = 'Marker position'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 28
      Top = 57
      Width = 7
      Height = 13
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 119
      Top = 57
      Width = 7
      Height = 13
      Caption = 'Y'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 47
      Top = 55
      Width = 40
      Height = 21
      TabOrder = 0
      Text = '100'
    end
    object Edit2: TEdit
      Left = 136
      Top = 55
      Width = 40
      Height = 21
      TabOrder = 1
      Text = '100'
    end
    object Button1: TButton
      Left = 202
      Top = 55
      Width = 41
      Height = 25
      Caption = 'ok'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 8
      Top = 100
      Width = 249
      Height = 25
      Caption = 'Font adjustment'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 8
    Width = 219
    Height = 17
    Caption = 'Transparent background'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 1
  end
  object CheckBox2: TCheckBox
    Left = 24
    Top = 224
    Width = 160
    Height = 17
    Caption = 'Color background'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = CheckBox2Click
  end
  object Panel4: TPanel
    Left = 8
    Top = 247
    Width = 265
    Height = 153
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    object Label8: TLabel
      Left = 30
      Top = 20
      Width = 77
      Height = 17
      Caption = 'Marker size'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 15
      Top = 57
      Width = 33
      Height = 13
      Caption = 'Width'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 100
      Top = 57
      Width = 37
      Height = 13
      Caption = 'Height'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit5: TEdit
      Left = 50
      Top = 55
      Width = 40
      Height = 21
      TabOrder = 0
      Text = '100'
    end
    object Edit6: TEdit
      Left = 140
      Top = 55
      Width = 40
      Height = 21
      TabOrder = 1
      Text = '100'
    end
    object Button4: TButton
      Left = 202
      Top = 55
      Width = 41
      Height = 25
      Caption = 'ok'
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 8
      Top = 100
      Width = 249
      Height = 25
      Caption = 'Background adjustment'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button5Click
    end
  end
  object Button3: TButton
    Left = 184
    Top = 406
    Width = 89
    Height = 25
    Caption = 'Save'
    TabOrder = 4
    OnClick = Button3Click
  end
  object ColorDialog1: TColorDialog
    Left = 192
    Top = 8
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 232
    Top = 8
  end
end
