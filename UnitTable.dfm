object FormTable: TFormTable
  Left = 0
  Top = 0
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099
  ClientHeight = 299
  ClientWidth = 790
  Color = clBtnFace
  Constraints.MinHeight = 338
  Constraints.MinWidth = 806
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object DBGrid1: TDBGrid
    Left = 0
    Top = 89
    Width = 790
    Height = 210
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TestTitle'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1089#1090#1072
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rating'
        Title.Caption = #1054#1094#1077#1085#1082#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QuestionsCount'
        Title.Caption = #1042#1086#1087#1088#1086#1089#1086#1074' '#1074' '#1090#1077#1089#1090#1077' '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RightAnswer'
        Title.Caption = #1054#1090#1074#1077#1090#1080#1083
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Complexity'
        Title.Caption = #1057#1083#1086#1078#1085#1086#1089#1090#1100
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TestingDate'
        Title.Caption = #1044#1072#1090#1072', '#1074#1088#1077#1084#1103' '
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 89
    Align = alTop
    TabOrder = 1
    object DBText1: TDBText
      AlignWithMargins = True
      Left = 16
      Top = 8
      Width = 105
      Height = 17
      DataField = 'UserNamePersonal'
      DataSource = DataSource2
    end
    object DBText2: TDBText
      AlignWithMargins = True
      Left = 16
      Top = 31
      Width = 105
      Height = 17
      DataField = 'UserFamilyPersonal'
      DataSource = DataSource2
    end
    object DBText3: TDBText
      AlignWithMargins = True
      Left = 16
      Top = 54
      Width = 105
      Height = 17
      DataField = 'UserLastNamePersonal'
      DataSource = DataSource2
    end
    object DBText4: TDBText
      AlignWithMargins = True
      Left = 240
      Top = 8
      Width = 105
      Height = 17
      DataField = 'USerGroupPersonal'
      DataSource = DataSource2
    end
  end
  object ADODataSet1: TADODataSet
    DataSource = DataSource1
    Parameters = <>
    Left = 160
    Top = 232
  end
  object ADOQuery1: TADOQuery
    Connection = FormAutor.ADOConnectionGeneral
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Testing')
    Left = 256
    Top = 232
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 80
    Top = 232
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 656
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = FormAutor.ADOConnectionGeneral
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM [Users] WHERE [IDUSER] = 33;')
    Left = 584
    Top = 8
  end
end
