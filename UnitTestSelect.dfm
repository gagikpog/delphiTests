object testSelect: TtestSelect
  Left = 0
  Top = 0
  Caption = 'testSelect'
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
    Left = 16
    Top = 16
    Width = 134
    Height = 18
    Caption = #1071' '#1093#1079#1095#1090#1086' '#1090#1091#1090' '#1087#1080#1089#1072#1090#1100
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
