object Fpgsm: TFpgsm
  Left = 313
  Top = 299
  Width = 597
  Height = 458
  Caption = #1053#1072#1076#1093#1086#1076#1078#1077#1085#1085#1103' '#1055#1052#1052' '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 16
    Width = 74
    Height = 16
    Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 15
    Top = 81
    Width = 106
    Height = 16
    Caption = #1052#1072#1088#1082#1072' '#1087#1072#1083#1080#1074#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 14
    Top = 120
    Width = 83
    Height = 16
    Caption = #1056#1077#1079#1077#1088#1074#1091#1072#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 432
    Top = 15
    Width = 41
    Height = 16
    Caption = #1044#1072#1090#1072' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 15
    Top = 50
    Width = 100
    Height = 16
    Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 251
    Top = 49
    Width = 138
    Height = 16
    Caption = #8470' '#1072#1082#1094#1110#1079'.'#1085#1072#1082#1083#1072#1076#1085#1086#1111
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 17
    Top = 154
    Width = 555
    Height = 85
    Caption = #1044#1072#1085#1110' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object Label5: TLabel
      Left = 11
      Top = 26
      Width = 71
      Height = 16
      Caption = #1065#1110#1083#1100#1085#1110#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 150
      Top = 26
      Width = 101
      Height = 16
      Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 274
      Top = 26
      Width = 138
      Height = 16
      Caption = #1053#1072#1076#1093#1086#1076#1078#1077#1085#1085#1103','#1083#1110#1090#1088'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 416
      Top = 26
      Width = 127
      Height = 16
      Caption = #1053#1072#1076#1093#1086#1076#1078#1077#1085#1085#1103', '#1082#1075'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ddensity: TMaskEdit
      Left = 11
      Top = 49
      Width = 125
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = ddensityChange
      OnKeyDown = cb_deptKeyDown
      OnKeyPress = ddensityKeyPress
    end
    object dtempr: TMaskEdit
      Left = 146
      Top = 50
      Width = 125
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnChange = ddensityChange
      OnKeyDown = cb_deptKeyDown
      OnKeyPress = ddensityKeyPress
    end
    object dqtyl: TMaskEdit
      Left = 283
      Top = 48
      Width = 125
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnChange = ddensityChange
      OnExit = dqtylExit
      OnKeyDown = cb_deptKeyDown
      OnKeyPress = ddensityKeyPress
    end
    object dqty: TMaskEdit
      Left = 416
      Top = 48
      Width = 125
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnChange = ddensityChange
      OnExit = dqtyExit
      OnKeyDown = cb_deptKeyDown
      OnKeyPress = ddensityKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 17
    Top = 283
    Width = 555
    Height = 76
    Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1110' '#1076#1072#1085#1110' '#1087#1088#1080' '#1090#1077#1084#1087#1077#1088#1072#1090#1091#1088#1110' 15'#1057' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    object Label13: TLabel
      Left = 11
      Top = 21
      Width = 71
      Height = 16
      Caption = #1065#1110#1083#1100#1085#1110#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 282
      Top = 21
      Width = 134
      Height = 16
      Caption = #1053#1072#1076#1093#1086#1076#1078#1077#1085#1085#1103','#1083#1110#1090#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ddensity15: TMaskEdit
      Left = 11
      Top = 43
      Width = 125
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnKeyDown = cb_deptKeyDown
      OnKeyPress = ddensityKeyPress
    end
    object dqtyl15: TMaskEdit
      Left = 282
      Top = 43
      Width = 125
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnKeyDown = cb_deptKeyDown
      OnKeyPress = ddensityKeyPress
    end
  end
  object Button3: TButton
    Left = 120
    Top = 366
    Width = 121
    Height = 25
    Caption = #1047#1073#1077#1088#1077#1075#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = Button3Click
  end
  object cb_dept: TDBLookupComboboxEh
    Left = 140
    Top = 11
    Width = 290
    Height = 24
    AutoSelect = False
    DynProps = <>
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'TBL#'
    ListField = 'DEPT'
    ListSource = DMall.DS_dept
    ParentFont = False
    TabOrder = 0
    Visible = True
    OnChange = cb_deptChange
    OnExit = cb_deptExit
    OnKeyDown = cb_deptKeyDown
  end
  object D_doc: TDateTimePicker
    Left = 476
    Top = 11
    Width = 90
    Height = 24
    Hint = #1044#1072#1090#1072' '#1074#1099#1087#1080#1089#1082#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    Date = 41855.000000000000000000
    Time = 41855.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = D_docChange
    OnExit = cb_deptExit
    OnKeyDown = cb_deptKeyDown
  end
  object cb_card: TDBLookupComboboxEh
    Left = 120
    Top = 113
    Width = 449
    Height = 24
    DynProps = <>
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'CARD#'
    ListField = 'NAM_S'
    ListSource = DMall.DS_card
    ParentFont = False
    TabOrder = 5
    Visible = True
    OnChange = cb_cardChange
    OnExit = cb_cardExit
    OnKeyDown = cb_deptKeyDown
  end
  object cb_prod: TDBLookupComboboxEh
    Left = 147
    Top = 74
    Width = 422
    Height = 24
    DynProps = <>
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'PROD#'
    ListField = 'PROD_S'
    ListSource = DMall.DS_prod
    ParentFont = False
    TabOrder = 4
    Visible = True
    OnChange = cb_prodChange
    OnExit = cb_prodExit
    OnKeyDown = cb_deptKeyDown
  end
  object Button1: TButton
    Left = 233
    Top = 247
    Width = 121
    Height = 25
    Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = Button1Click
  end
  object ddocno: TMaskEdit
    Left = 131
    Top = 43
    Width = 99
    Height = 24
    EditMask = '999999999;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 9
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = '         '
    OnChange = ddocnoChange
    OnClick = ddocnoClick
    OnKeyDown = cb_deptKeyDown
  end
  object Button2: TButton
    Left = 309
    Top = 367
    Width = 121
    Height = 25
    Caption = #1042#1080#1076#1072#1083#1080#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = Button2Click
  end
  object stat1: TStatusBar
    Left = 0
    Top = 400
    Width = 581
    Height = 19
    Panels = <
      item
        Width = 400
      end
      item
        Width = 200
      end>
  end
  object docnoa: TMaskEdit
    Left = 415
    Top = 45
    Width = 99
    Height = 24
    EditMask = '999999999;1; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 9
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Text = '         '
    Visible = False
    OnClick = ddocnoClick
    OnKeyDown = cb_deptKeyDown
  end
end
