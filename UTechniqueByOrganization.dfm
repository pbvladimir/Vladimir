object FTechniqueByOrganization: TFTechniqueByOrganization
  Left = 192
  Top = 124
  Width = 510
  Height = 253
  Caption = 'Техника за организацией'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 494
    Height = 195
    Align = alClient
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 492
      Height = 193
      Align = alClient
      DataSource = DataSource1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = DBGridEh1KeyPress
      Columns = <
        item
          EditButtons = <>
          FieldName = 'BARCODE_ID'
          Footers = <>
          Title.Caption = 'Штрихкод'
          Width = 98
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = 'Название техники'
          Width = 174
        end
        item
          EditButtons = <>
          FieldName = 'USERNAME'
          Footers = <>
          Title.Caption = 'За кем числится'
          Width = 163
        end>
    end
  end
  object FIBDS: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT w.barcode_id, p.name, us.username FROM warehouse w'
      'LEFT JOIN user_and_org uo ON uo.id = w.user_and_org_id'
      'LEFT JOIN barcode bc ON bc.id = w.barcode_id'
      'LEFT JOIN products p ON p.id = bc.product_id'
      'LEFT JOIN users us ON us.id = uo.user_id'
      'WHERE user_and_org_id = :us_org_id')
    Transaction = FProduct.FIBTrRead
    Database = FProduct.pFIBDbaseGeneral
    UpdateTransaction = FProduct.FIBTrUpdata
    AutoCommit = True
    Left = 128
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = FIBDS
    Left = 88
    Top = 88
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 88
    object N1: TMenuItem
      Caption = '&Принять по штрихкоду'
      OnClick = N1Click
    end
  end
  object FIBQUpdate: TpFIBQuery
    Transaction = FProduct.FIBTrUpdata
    Database = FProduct.pFIBDbaseGeneral
    GoToFirstRecordOnExecute = False
    SQL.Strings = (
      'UPDATE warehouse SET user_and_org_id = :user_and_org_id '
      'WHERE barcode_id = :barcode')
    Left = 208
    Top = 88
    qoAutoCommit = True
  end
  object FIBQRead: TpFIBQuery
    Transaction = FProduct.FIBTrRead
    Database = FProduct.pFIBDbaseGeneral
    SQL.Strings = (
      'SELECT user_and_org_id'
      'FROM warehouse'
      'WHERE barcode_id = :barcoode')
    Left = 256
    Top = 88
    qoStartTransaction = True
  end
end
