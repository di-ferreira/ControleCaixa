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
    Left = 232
    Top = 32
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Projects\Delphi\ControleCaixa\DB\DADOS.SDB'
      'DriverID=SQLite')
    Left = 296
    Top = 200
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 328
    Top = 120
  end
end
