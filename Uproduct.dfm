object FProduct: TFProduct
  Left = 189
  Top = 139
  Width = 979
  Height = 563
  Caption = 'FProduct'
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
    Top = 468
    Width = 963
    Height = 37
    Align = alBottom
    Caption = 'Panel1'
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
    Width = 963
    Height = 468
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
  end
  object pFIBDatabase1: TpFIBDatabase
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
    Left = 56
    Top = 32
  end
  object FIBTrUpdata: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 56
    Top = 64
  end
  object FIBTrRead: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 56
    Top = 104
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 24
    object EXIT1: TMenuItem
      Caption = '&�����'
      OnClick = EXIT1Click
    end
    object N1: TMenuItem
      Caption = '&������'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '&������'
    end
  end
end