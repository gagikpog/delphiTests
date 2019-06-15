object FormProgramm: TFormProgramm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'EasyTest'
  ClientHeight = 276
  ClientWidth = 383
  Color = clBtnFace
  Constraints.MinHeight = 304
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Button1: TButton
    Left = 40
    Top = 40
    Width = 305
    Height = 73
    Caption = #1058#1077#1089#1090#1099
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 40
    Top = 144
    Width = 305
    Height = 73
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
    TabOrder = 1
    OnClick = Button2Click
  end
  object ADOQuery1: TADOQuery
    Connection = FormAutor.ADOConnectionGeneral
    Parameters = <>
    Left = 16
    Top = 8
  end
end
