object FScanner: TFScanner
  Left = 192
  Top = 124
  Width = 979
  Height = 563
  Caption = 'Сканер'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 963
    Height = 525
    Align = alClient
    TabOrder = 0
    object Edit1: TEdit
      Left = 72
      Top = 64
      Width = 161
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
      OnKeyPress = Edit1KeyPress
    end
  end
end
