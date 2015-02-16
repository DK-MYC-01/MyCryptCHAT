object MyCryptCHATdataflow: TMyCryptCHATdataflow
  Left = 357
  Top = 175
  Width = 658
  Height = 360
  BorderIcons = [biSystemMenu]
  Caption = 'MyCryptCHATdataflow'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 136
    Top = 8
    Width = 25
    Height = 13
    Caption = 'Send'
  end
  object Label2: TLabel
    Left = 440
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Received'
  end
  object Memo1: TMemo
    Left = 16
    Top = 34
    Width = 289
    Height = 223
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
    WordWrap = False
  end
  object Memo2: TMemo
    Left = 328
    Top = 34
    Width = 289
    Height = 223
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 1
    WordWrap = False
  end
  object Button1: TButton
    Left = 112
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 432
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 3
    OnClick = Button2Click
  end
end
