object Flogin: TFlogin
  Left = 574
  Top = 305
  Width = 269
  Height = 197
  Caption = 'Вход в программу'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 253
    Height = 159
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 60
      Top = 44
      Width = 96
      Height = 13
      Caption = 'Имя пользователя'
    end
    object Label2: TLabel
      Left = 55
      Top = 87
      Width = 112
      Height = 13
      Caption = 'Пароль пользователя'
    end
    object Label3: TLabel
      Left = 45
      Top = 5
      Width = 123
      Height = 13
      Caption = 'Выберите  организацию'
    end
    object Ed_login: TEdit
      Left = 36
      Top = 59
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'log'
    end
    object Ed_password: TEdit
      Left = 36
      Top = 102
      Width = 145
      Height = 21
      TabOrder = 1
      Text = 'log'
      OnKeyPress = Ed_passwordKeyPress
    end
    object Button3: TButton
      Left = 78
      Top = 127
      Width = 75
      Height = 24
      Caption = 'Вход'
      TabOrder = 2
      OnClick = Button3Click
    end
    object ComboBox1: TComboBox
      Left = 38
      Top = 21
      Width = 144
      Height = 21
      ItemHeight = 13
      TabOrder = 3
    end
  end
  object FIBDS1: TpFIBDataSet
    Transaction = FProduct.FIBTrRead
    Database = FProduct.pFIBDatabase1
    UpdateTransaction = FProduct.FIBTrUpdata
    Left = 208
    Top = 8
  end
end
