object fmBetta: TfmBetta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Betta input'
  ClientHeight = 61
  ClientWidth = 185
  Color = clHighlight
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
  object SpeedButton13: TSpeedButton
    Left = 74
    Top = 20
    Width = 30
    Height = 25
    Cursor = crHandPoint
    Hint = 'To apply'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton13Click
  end
  object MaskEdit1: TMaskEdit
    Left = 24
    Top = 20
    Width = 44
    Height = 24
    EditMask = '0.00;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 4
    ParentFont = False
    TabOrder = 0
    Text = ' .  '
    OnChange = MaskEdit1Change
  end
  object CheckBox1: TCheckBox
    Left = 110
    Top = 24
    Width = 97
    Height = 17
    Caption = 'Negative'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
end
