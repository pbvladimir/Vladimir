object FProduct: TFProduct
  Left = 189
  Top = 139
  Width = 405
  Height = 199
  Caption = 'Продукция'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 104
    Width = 389
    Height = 37
    Align = alBottom
    TabOrder = 0
    object Lb_org: TLabel
      Left = 8
      Top = 8
      Width = 3
      Height = 13
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 104
    Align = alClient
    TabOrder = 1
  end
  object pFIBDbaseGeneral: TpFIBDatabase
    Connected = True
    DBName = 'localhost:D:\PROJECT_BD\BASE\OBJECT.GDB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = FIBTrRead
    DefaultUpdateTransaction = FIBTrUpdata
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 48
  end
  object FIBTrUpdata: TpFIBTransaction
    Active = True
    DefaultDatabase = pFIBDbaseGeneral
    TimeoutAction = TARollback
    Left = 88
  end
  object FIBTrRead: TpFIBTransaction
    Active = True
    DefaultDatabase = pFIBDbaseGeneral
    TimeoutAction = TARollback
    Left = 128
  end
  object MainMenu1: TMainMenu
    Left = 8
    object EXIT1: TMenuItem
      Caption = '&Выход'
      OnClick = EXIT1Click
    end
    object N1: TMenuItem
      Caption = '&Техника за организацией'
      OnClick = N1Click
    end
  end
end
