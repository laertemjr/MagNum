object frmMagNum: TfrmMagNum
  Left = 0
  Top = 0
  Caption = 'Helps detecting the magic number (file signature)'
  ClientHeight = 201
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 295
    Height = 20
    Caption = 'Select the file to detect its magic number :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblID: TLabel
    Left = 8
    Top = 152
    Width = 22
    Height = 17
    Caption = 'ID :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblMagicNumbers: TLabel
    Left = 8
    Top = 120
    Width = 109
    Height = 17
    Caption = 'Magic Numbers : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 182
    Width = 1008
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'Developed in Delphi 12.1 - version '
        Width = 50
      end>
    ExplicitWidth = 624
  end
  object btnBrowse: TButton
    Left = 8
    Top = 48
    Width = 75
    Height = 25
    Caption = '&Browse'
    TabOrder = 0
    OnClick = btnBrowseClick
  end
  object edtBD: TEdit
    Left = 8
    Top = 79
    Width = 992
    Height = 23
    ReadOnly = True
    TabOrder = 1
  end
  object OpenDialog1: TOpenDialog
    Left = 344
    Top = 8
  end
end
