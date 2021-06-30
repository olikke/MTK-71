object nMain: TnMain
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'CaptureTV'
  ClientHeight = 576
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object VideoWindow1: TVideoWindow
    Left = 0
    Top = 0
    Width = 720
    Height = 576
    FilterGraph = FilterGraph1
    VMROptions.Mode = vmrWindowless
    Color = clBlack
  end
  object FilterGraph1: TFilterGraph
    Mode = gmCapture
    GraphEdit = False
    LinearVolume = True
    Left = 56
    Top = 40
  end
  object MainMenu1: TMainMenu
    Left = 272
    Top = 8
    object N1: TMenuItem
      Caption = 'File'
      object N3: TMenuItem
        Caption = '-'
      end
    end
    object Options1: TMenuItem
      Caption = 'Options'
      object VideoCaptureFilter1: TMenuItem
        Caption = 'VideoCaptureFilter'
        OnClick = VideoCaptureFilter1Click
      end
    end
  end
  object CaptureFilter: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph1
    Left = 96
    Top = 40
  end
end
