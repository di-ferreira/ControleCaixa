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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 104
    Width = 603
    Height = 290
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 232
    Top = 32
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Users\alex\Documents\ControleCaixa\DB\DADOS.DB'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 392
    Top = 40
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from CAIXA')
    Left = 520
    Top = 32
  end
end
