object GroupMemberAction: TGroupMemberAction
  Left = 260
  Top = 125
  Width = 881
  Height = 421
  BorderIcons = [biSystemMenu]
  Caption = 'GroupMemberAction'
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
    Left = 320
    Top = 16
    Width = 140
    Height = 13
    Caption = 'Selcted Group Member (Alias)'
  end
  object RadioGroup1: TRadioGroup
    Left = 24
    Top = 56
    Width = 817
    Height = 241
    Caption = 'Action regarding selected Group member (Alias name)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Items.Strings = (
      'Close this form - E&XIT'
      
        '&Tell this Group-member/Aliasname, that members Password (Encryp' +
        'tion key) seems to be wrong'
      
        'Send a &File from PC to this member (Will be ENCRYPTED using cur' +
        'rent Password/Key)'
      
        '&Blacklist this member in this session - Stop data comming from ' +
        'this member'
      'Send a B&EEP sound to this member only'
      
        'Send this member a message in &PLAIN TEXT (e.g. help this member' +
        ' establishing encryption key) WATCH OUT!')
    ParentFont = False
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 8
    Width = 281
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 24
    Top = 304
    Width = 737
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 100
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  object Button1: TButton
    Left = 24
    Top = 336
    Width = 489
    Height = 25
    Caption = 
      '&Send this line in CLEAR TEXT to selected Group member/ Alias na' +
      'me'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnClick = Button1Click
  end
end
