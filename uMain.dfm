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
    Top = 8
    Width = 178
    Height = 33
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
  object Open: TDateTimePicker
    Left = 192
    Top = 37
    Width = 145
    Height = 21
    Date = 44673.000000000000000000
    Time = 0.639519421296427000
    TabOrder = 2
  end
  object EdtOpen: TEdit
    Left = 512
    Top = 37
    Width = 83
    Height = 21
    TabOrder = 3
  end
  object Close: TDateTimePicker
    Left = 352
    Top = 37
    Width = 145
    Height = 21
    Date = 44673.000000000000000000
    Time = 0.639519421296427000
    TabOrder = 4
  end
  object Button1: TButton
    Left = 8
    Top = 47
    Width = 178
    Height = 34
    Caption = 'Listar Caixa'
    TabOrder = 5
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 312
    Top = 192
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Users\alex\Documents\ControleCaixa\DB\DADOS.DB'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 400
    Top = 200
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from CAIXA')
    Left = 472
    Top = 208
  end
end
