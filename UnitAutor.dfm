object FormAutor: TFormAutor
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1043#1083#1072#1074#1085#1072#1103' '#1092#1086#1088#1084#1072
  ClientHeight = 138
  ClientWidth = 254
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LabelInfoNone: TLabel
    Left = 24
    Top = 88
    Width = 3
    Height = 13
  end
  object EditLogin: TEdit
    Left = 8
    Top = 24
    Width = 241
    Height = 21
    TabOrder = 0
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1083#1086#1075#1080#1085
  end
  object EditPassword: TEdit
    Left = 8
    Top = 51
    Width = 241
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
  end
  object ButtonEnter: TButton
    Left = 174
    Top = 78
    Width = 75
    Height = 25
    Caption = #1042#1093#1086#1076
    TabOrder = 2
    OnClick = ButtonEnterClick
  end
  object ButtonRegistration: TButton
    Left = 8
    Top = 107
    Width = 241
    Height = 25
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
    TabOrder = 3
    OnClick = ButtonRegistrationClick
  end
  object ADOConnectionGeneral: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=General.mdb;Persist' +
      ' Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 56
  end
  object ADODataSetUserTable: TADODataSet
    Active = True
    Connection = ADOConnectionGeneral
    CursorType = ctStatic
    CommandText = 'select IDUSER, UserName, UserPass from Users'
    Parameters = <>
    Left = 168
  end
  object DataSourceUserTable: TDataSource
    DataSet = ADODataSetUserTable
    Left = 64
    Top = 72
  end
end
