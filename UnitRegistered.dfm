object FormRegistered: TFormRegistered
  Left = 760
  Top = 353
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1060#1086#1088#1084#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '
  ClientHeight = 247
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object EditRegLogin: TEdit
    Left = 160
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1083#1086#1075#1080#1085
  end
  object EditRegPassword: TEdit
    Left = 160
    Top = 51
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
  end
  object TRadioGroupPersonalDB: TRadioGroup
    Left = 0
    Top = 87
    Width = 428
    Height = 160
    Align = alBottom
    Caption = #1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1072#1103' '#1076#1072#1085#1085#1099#1077
    TabOrder = 2
  end
  object EditRegName: TEdit
    Left = 16
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 3
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1080#1084#1103
  end
  object EditRegFamily: TEdit
    Left = 160
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 4
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1092#1072#1084#1080#1083#1080#1102
  end
  object EditRegLastName: TEdit
    Left = 296
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 5
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1086#1090#1095#1077#1089#1090#1074#1086
  end
  object ComboBoxRegSex: TComboBox
    Left = 160
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 6
    Text = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1083
    Items.Strings = (
      #1052#1091#1078'.'
      #1046#1077#1085'.')
  end
  object DateTimePickerRegBirthDay: TDateTimePicker
    Left = 296
    Top = 160
    Width = 121
    Height = 21
    Date = 43458.000000000000000000
    Time = 0.623866076392005200
    TabOrder = 7
  end
  object EditRegGroup: TEdit
    Left = 16
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 8
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#8470' '#1075#1088#1091#1087#1087#1099
  end
  object ButtonStartRegistrated: TButton
    Left = 160
    Top = 202
    Width = 121
    Height = 25
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
    TabOrder = 9
    OnClick = ButtonStartRegistratedClick
  end
  object ADOQueryStartRegistered: TADOQuery
    Connection = FormAutor.ADOConnectionGeneral
    Parameters = <
      item
        Name = 'RegUserName'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RegUserPassword'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RegUserNamePersonal'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RegUserFamilyPersonal'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RegUserLastNamePersonal'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RegUserSexPersonal'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'RegUserBitrhDayPersonal'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'RegUSerGroupPersonal'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'INSERT INTO Users (UserName,UserPass, UserNamePersonal,UserFamil' +
        'yPersonal,UserLastNamePersonal,UserSexPersonal,UserBitrhDayPerso' +
        'nal,USerGroupPersonal)'
      ''
      ''
      
        ' VALUES ( :RegUserName, :RegUserPassword, :RegUserNamePersonal, ' +
        ':RegUserFamilyPersonal, :RegUserLastNamePersonal, :RegUserSexPer' +
        'sonal, :RegUserBitrhDayPersonal, :RegUSerGroupPersonal)'
      '')
    Left = 336
    Top = 24
  end
  object ADOQueryCheckUser: TADOQuery
    Connection = FormAutor.ADOConnectionGeneral
    Parameters = <>
    SQL.Strings = (
      'SELECT UserName FROM Users '
      'WHERE UserName = :RegUserName')
    Left = 40
    Top = 32
  end
end
