object Fr1: TFr1
  Left = 362
  Top = 256
  Width = 781
  Height = 300
  Caption = #1055#1077#1088#1077#1088#1072#1093#1091#1085#1086#1082' '#1074#1080#1090#1088#1072#1090#1080' '#1087#1072#1083#1080#1074#1072' '#1087#1088#1080' 15'#1057
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 152
    Top = 16
    Width = 69
    Height = 16
    Caption = #1055#1077#1088#1110#1086#1076' '#1079' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 350
    Top = 16
    Width = 19
    Height = 16
    Caption = #1087#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 117
    Top = 203
    Width = 4
    Height = 16
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DateTimePicker1: TDateTimePicker
    Left = 237
    Top = 12
    Width = 102
    Height = 24
    Date = 43728.426817453710000000
    Time = 43728.426817453710000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 373
    Top = 12
    Width = 102
    Height = 24
    Date = 43728.426817453710000000
    Time = 43728.426817453710000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 339
    Top = 202
    Width = 121
    Height = 25
    Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object StaticText3: TStaticText
    Left = 128
    Top = 203
    Width = 46
    Height = 20
    Caption = '000000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object StaticText2: TStaticText
    Left = 69
    Top = 203
    Width = 46
    Height = 20
    Caption = '000000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object StaticText1: TStaticText
    Left = 664
    Top = 204
    Width = 46
    Height = 20
    Caption = '000000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 240
    Width = 765
    Height = 21
    Align = alBottom
    Step = 1
    TabOrder = 6
  end
  object SG: TStringGrid
    Left = 21
    Top = 41
    Width = 737
    Height = 160
    ColCount = 7
    RowCount = 6
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 7
    OnDrawCell = SGDrawCell
    OnKeyPress = SGKeyPress
    OnSelectCell = SGSelectCell
    ColWidths = (
      124
      35
      73
      87
      20
      327
      51)
    RowHeights = (
      24
      24
      24
      23
      24
      24)
  end
end
