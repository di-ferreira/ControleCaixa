object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 394
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnCaixa: TButton
    Left = 8
    Top = 22
    Width = 178
    Height = 51
    Caption = 'Abrir Caixa'
    TabOrder = 0
    OnClick = btnCaixaClick
  end
  object mmSql: TMemo
    Left = 192
    Top = 24
    Width = 403
    Height = 249
    TabOrder = 1
  end
end
