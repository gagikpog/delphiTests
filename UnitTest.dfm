object Test: TTest
  Left = 0
  Top = 0
  Caption = 'Test'
  ClientHeight = 631
  ClientWidth = 976
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    976
    631)
  PixelsPerInch = 96
  TextHeight = 18
  object LabelTime: TLabel
    Left = 926
    Top = 605
    Width = 33
    Height = 18
    Anchors = [akRight, akBottom]
    Caption = 'Time'
    Visible = False
    ExplicitLeft = 734
    ExplicitTop = 464
  end
  object PanelHead: TPanel
    AlignWithMargins = True
    Left = 50
    Top = 50
    Width = 876
    Height = 122
    Margins.Left = 50
    Margins.Top = 50
    Margins.Right = 50
    Align = alTop
    TabOrder = 1
    Visible = False
    DesignSize = (
      876
      122)
    object LabelQuestion: TLabel
      AlignWithMargins = True
      Left = 26
      Top = 39
      Width = 615
      Height = 79
      Margins.Left = 25
      Align = alLeft
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 
        #1056#1077#1076#1082#1072#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1086#1073#1093#1086#1076#1080#1090#1089#1103' '#1086#1076#1085#1086#1081' '#1092#1086#1088#1084#1086#1081'. '#1052#1099' '#1084#1086#1078#1077#1084' '#1089' '#1083#1105#1075#1082#1086#1089#1090#1100#1102' '#1089#1086 +
        #1079#1076#1072#1074#1072#1090#1100' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1092#1086#1088#1084#1099' Delphi, '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1083#1103#1102#1097#1080#1077' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100 +
        ', '#1085#1072#1087#1088#1080#1084#1077#1088', '#1074#1077#1089#1090#1080' '#1076#1080#1072#1083#1086#1075' '#1089' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1084', '#1087#1088#1080#1085#1080#1084#1072#1090#1100' '#1080' '#1074#1099#1074#1086#1076#1080#1090#1100' '#1083 +
        #1102#1073#1091#1102' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1091#1102' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102'. '#1042' '#1101#1090#1086#1084' '#1091#1088#1086#1082#1077' '#1085#1072#1091#1095#1080#1084#1089#1103' '#1089#1086#1079#1076#1072#1074#1072#1090#1100' '#1085#1077#1089 +
        #1082#1086#1083#1100#1082#1086' '#1092#1086#1088#1084' Delphi '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086' '#1082' '#1086#1089#1085#1086#1074#1085#1086#1081'.'
      ParentBiDiMode = False
      WordWrap = True
    end
    object BtnCheck: TButton
      Left = 766
      Top = 42
      Width = 105
      Height = 31
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1083#1077#1077
      TabOrder = 0
      OnClick = BtnCheckClick
    end
    object PanelButtons: TFlowPanel
      Left = 1
      Top = 1
      Width = 874
      Height = 35
      Align = alTop
      Padding.Bottom = 1
      TabOrder = 1
    end
    object btnEnding: TButton
      Left = 766
      Top = 79
      Width = 105
      Height = 31
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100
      TabOrder = 2
      OnClick = btnEndingClick
    end
    object BunBack: TButton
      Left = 655
      Top = 42
      Width = 105
      Height = 31
      Anchors = [akTop, akRight]
      Caption = #1053#1072#1079#1072#1076
      TabOrder = 3
      OnClick = BunBackClick
    end
  end
  object PanelBody: TPanel
    AlignWithMargins = True
    Left = 50
    Top = 175
    Width = 876
    Height = 406
    Margins.Left = 50
    Margins.Top = 0
    Margins.Right = 50
    Margins.Bottom = 50
    Align = alClient
    TabOrder = 2
    Visible = False
    object RadioGroupTest: TRadioGroup
      AlignWithMargins = True
      Left = 1
      Top = 0
      Width = 104
      Height = 152
      Margins.Left = 50
      Margins.Top = 0
      Margins.Right = 50
      Margins.Bottom = 0
      TabOrder = 0
      Visible = False
    end
    object PanelMulty: TFlowPanel
      AlignWithMargins = True
      Left = 120
      Top = 3
      Width = 129
      Height = 142
      Margins.Left = 50
      Margins.Top = 0
      Margins.Right = 50
      Margins.Bottom = 0
      TabOrder = 1
      Visible = False
    end
    object PanelInp: TPanel
      Left = 6
      Top = 155
      Width = 296
      Height = 246
      TabOrder = 2
      Visible = False
      object FlowPanelInp: TFlowPanel
        AlignWithMargins = True
        Left = 51
        Top = 101
        Width = 194
        Height = 44
        Margins.Left = 50
        Margins.Top = 100
        Margins.Right = 50
        Margins.Bottom = 100
        Align = alClient
        TabOrder = 0
      end
    end
    object PanelMove: TPanel
      Left = 304
      Top = 3
      Width = 441
      Height = 198
      TabOrder = 3
      Visible = False
      object FlowPanelUp: TFlowPanel
        AlignWithMargins = True
        Left = 4
        Top = 51
        Width = 433
        Height = 126
        Margins.Top = 50
        Align = alTop
        TabOrder = 0
      end
      object FlowPanelDown: TFlowPanel
        AlignWithMargins = True
        Left = 4
        Top = 21
        Width = 433
        Height = 126
        Margins.Top = 0
        Margins.Bottom = 50
        Align = alBottom
        TabOrder = 1
      end
    end
  end
  object PanelLevel: TPanel
    Left = 437
    Top = 382
    Width = 317
    Height = 257
    TabOrder = 0
    object BtnL1: TButton
      Tag = 300
      Left = 72
      Top = 48
      Width = 169
      Height = 40
      Caption = #1051#1077#1075#1082#1080#1081
      TabOrder = 0
      OnClick = BtnLClick
    end
    object BtnL2: TButton
      Tag = 480
      Left = 72
      Top = 106
      Width = 169
      Height = 40
      Caption = #1057#1088#1077#1076#1085#1080#1081
      TabOrder = 1
      OnClick = BtnLClick
    end
    object BtnL3: TButton
      Tag = 600
      Left = 72
      Top = 168
      Width = 169
      Height = 40
      Caption = #1057#1083#1086#1078#1085#1099#1081
      TabOrder = 2
      OnClick = BtnLClick
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 16
    Top = 8
  end
end
