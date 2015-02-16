object IRClog: TIRClog
  Left = 397
  Top = 167
  Width = 679
  Height = 512
  Caption = 'IRClog'
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
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 663
    Height = 409
    Align = alTop
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    WordWrap = False
    OnChange = Memo1Change
  end
  object Button1: TButton
    Left = 24
    Top = 424
    Width = 121
    Height = 25
    Caption = 'Delete log'
    TabOrder = 1
    OnClick = Button1Click
  end
end
