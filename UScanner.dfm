object FScanner: TFScanner
  Left = 192
  Top = 124
  Width = 240
  Height = 109
  Caption = 'Сканер'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 224
    Height = 71
    Align = alClient
    TabOrder = 0
    object EBarcode: TEdit
      Left = 24
      Top = 24
      Width = 169
      Height = 21
      TabOrder = 0
      OnKeyPress = EBarcodeKeyPress
    end
  end
end
