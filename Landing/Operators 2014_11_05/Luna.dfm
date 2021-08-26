object OLS: TOLS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'OLS "Luna-3E"'
  ClientHeight = 311
  ClientWidth = 568
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Cambria'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Edit12: TEdit
    Left = 338
    Top = 11
    Width = 107
    Height = 23
    Color = clMedGray
    ReadOnly = True
    TabOrder = 0
    Text = ' Channel 1'
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object Edit2: TEdit
    Left = 11
    Top = 11
    Width = 321
    Height = 24
    Color = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Text = ' Parameters'
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object Edit13: TEdit
    Left = 450
    Top = 11
    Width = 107
    Height = 23
    Color = clMedGray
    ReadOnly = True
    TabOrder = 2
    Text = ' Channel 2'
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object Edit3: TEdit
    Left = 11
    Top = 38
    Width = 321
    Height = 23
    AutoSelect = False
    ReadOnly = True
    TabOrder = 3
    Text = ' Data Exchange'
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object e1: TEdit
    Left = 338
    Top = 38
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 4
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object f1: TEdit
    Left = 450
    Top = 38
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 5
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object Edit1: TEdit
    Left = 11
    Top = 64
    Width = 321
    Height = 23
    ReadOnly = True
    TabOrder = 6
    Text = ' Work sign'
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object e2: TEdit
    Left = 338
    Top = 64
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 7
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object f2: TEdit
    Left = 450
    Top = 64
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 8
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object Edit4: TEdit
    Left = 11
    Top = 91
    Width = 321
    Height = 23
    ReadOnly = True
    TabOrder = 9
    Text = ' Value of angles Alpha truly'
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object e3: TEdit
    Left = 338
    Top = 91
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 10
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object f3: TEdit
    Left = 450
    Top = 91
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 11
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object Edit5: TEdit
    Left = 11
    Top = 118
    Width = 321
    Height = 23
    ReadOnly = True
    TabOrder = 12
    Text = ' Value of angles Beta truly'
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object e4: TEdit
    Left = 338
    Top = 118
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 13
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object f4: TEdit
    Left = 450
    Top = 118
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 14
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object Edit6: TEdit
    Left = 11
    Top = 145
    Width = 321
    Height = 23
    ReadOnly = True
    TabOrder = 15
    Text = ' Glidepath stabilization angle [degrees]'
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object e5: TEdit
    Left = 338
    Top = 145
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 16
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object f5: TEdit
    Left = 450
    Top = 145
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 17
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object Edit7: TEdit
    Left = 11
    Top = 171
    Width = 321
    Height = 23
    ReadOnly = True
    TabOrder = 18
    Text = ' Current angle of ILB [degrees]'
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object e6: TEdit
    Left = 338
    Top = 171
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 19
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object f6: TEdit
    Left = 450
    Top = 171
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 20
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object Edit8: TEdit
    Left = 11
    Top = 198
    Width = 321
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 21
    Text = ' Current error of Glidepath stabilization angle [degrees]'
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object e7: TEdit
    Left = 338
    Top = 198
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 22
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object f7: TEdit
    Left = 450
    Top = 198
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 23
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object Edit9: TEdit
    Left = 11
    Top = 225
    Width = 321
    Height = 23
    ReadOnly = True
    TabOrder = 24
    Text = ' Averaged value of  ship trim angle [degrees]'
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object e8: TEdit
    Left = 338
    Top = 225
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 25
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object f8: TEdit
    Left = 450
    Top = 225
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 26
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object Edit10: TEdit
    Left = 11
    Top = 252
    Width = 321
    Height = 23
    ReadOnly = True
    TabOrder = 27
    Text = ' Set compensation angle Beta [degrees]'
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object e9: TEdit
    Left = 338
    Top = 252
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 28
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object f9: TEdit
    Left = 450
    Top = 252
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 29
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object Edit11: TEdit
    Left = 11
    Top = 279
    Width = 321
    Height = 23
    ReadOnly = True
    TabOrder = 30
    Text = ' Current error of compensation angle Beta [degrees]'
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object e10: TEdit
    Left = 338
    Top = 279
    Width = 108
    Height = 23
    ReadOnly = True
    TabOrder = 31
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object f10: TEdit
    Left = 450
    Top = 279
    Width = 107
    Height = 23
    ReadOnly = True
    TabOrder = 32
    OnEnter = Edit3Enter
    OnExit = Edit3Exit
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 256
    Top = 32
  end
  object XPManifest1: TXPManifest
    Left = 224
    Top = 208
  end
end
