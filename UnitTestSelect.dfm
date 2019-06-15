object testSelect: TtestSelect
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1086#1088' '#1090#1077#1089#1090#1072
  ClientHeight = 283
  ClientWidth = 373
  Color = clBtnFace
  Constraints.MaxHeight = 500
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 200
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    373
    283)
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 80
    Top = 16
    Width = 202
    Height = 18
    Caption = #1055#1086#1078#1072#1083#1091#1081#1089#1090#1072', '#1074#1099#1073#1077#1088#1080#1090#1077' '#1090#1077#1089#1090':'
  end
  object ListBox1: TListBox
    Left = 8
    Top = 56
    Width = 353
    Height = 185
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 18
    TabOrder = 0
  end
  object Button1: TButton
    Left = 286
    Top = 250
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 250
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 2
    OnClick = Button2Click
  end
end
