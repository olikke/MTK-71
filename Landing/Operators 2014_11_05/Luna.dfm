object OLS: TOLS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'OLS "Luna-3E"'
  ClientHeight = 294
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Cambria'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 533
    Height = 294
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object Edit2: TEdit
      Left = 10
      Top = 10
      Width = 300
      Height = 22
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Cambria'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = ' Parameters'
    end
    object Edit3: TEdit
      Left = 10
      Top = 35
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 1
      Text = ' Data Exchange'
    end
    object Edit1: TEdit
      Left = 10
      Top = 60
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 2
      Text = ' Work sign'
    end
    object Edit4: TEdit
      Left = 10
      Top = 85
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 3
      Text = ' Value of angles Alpha truly'
    end
    object Edit5: TEdit
      Left = 10
      Top = 110
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 4
      Text = ' Value of angles Beta truly'
    end
    object Edit6: TEdit
      Left = 10
      Top = 135
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 5
      Text = ' Glidepath stabilization angle [degrees]'
    end
    object Edit7: TEdit
      Left = 10
      Top = 160
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 6
      Text = ' Current angle of ILB [degrees]'
    end
    object Edit8: TEdit
      Left = 10
      Top = 185
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 7
      Text = ' Current error of Glidepath stabilization angle [degrees]'
    end
    object Edit9: TEdit
      Left = 10
      Top = 210
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 8
      Text = ' Averaged value of  ship trim angle [degrees]'
    end
    object Edit10: TEdit
      Left = 10
      Top = 235
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 9
      Text = ' Set compensation angle Beta [degrees]'
    end
    object Edit11: TEdit
      Left = 10
      Top = 260
      Width = 300
      Height = 22
      ReadOnly = True
      TabOrder = 10
      Text = ' Current error of compensation angle Beta [degrees]'
    end
    object Edit12: TEdit
      Left = 315
      Top = 10
      Width = 100
      Height = 22
      Color = clMedGray
      ReadOnly = True
      TabOrder = 11
      Text = ' Channel 1'
    end
    object e1: TEdit
      Left = 315
      Top = 35
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 12
    end
    object e2: TEdit
      Left = 315
      Top = 60
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 13
    end
    object e3: TEdit
      Left = 315
      Top = 85
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 14
    end
    object e4: TEdit
      Left = 315
      Top = 110
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 15
    end
    object e5: TEdit
      Left = 315
      Top = 135
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 16
    end
    object e6: TEdit
      Left = 315
      Top = 160
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 17
    end
    object e7: TEdit
      Left = 315
      Top = 185
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 18
    end
    object e8: TEdit
      Left = 315
      Top = 210
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 19
    end
    object e9: TEdit
      Left = 315
      Top = 235
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 20
    end
    object e10: TEdit
      Left = 314
      Top = 260
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 21
    end
    object Edit13: TEdit
      Left = 420
      Top = 10
      Width = 100
      Height = 22
      Color = clMedGray
      ReadOnly = True
      TabOrder = 22
      Text = ' Channel 2'
    end
    object f1: TEdit
      Left = 420
      Top = 35
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 23
    end
    object f2: TEdit
      Left = 420
      Top = 60
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 24
    end
    object f3: TEdit
      Left = 420
      Top = 85
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 25
    end
    object f4: TEdit
      Left = 420
      Top = 110
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 26
    end
    object f5: TEdit
      Left = 420
      Top = 135
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 27
    end
    object f6: TEdit
      Left = 420
      Top = 160
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 28
    end
    object f7: TEdit
      Left = 420
      Top = 185
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 29
    end
    object f8: TEdit
      Left = 420
      Top = 210
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 30
    end
    object f9: TEdit
      Left = 420
      Top = 235
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 31
    end
    object f10: TEdit
      Left = 420
      Top = 260
      Width = 100
      Height = 22
      ReadOnly = True
      TabOrder = 32
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 256
    Top = 32
  end
end
