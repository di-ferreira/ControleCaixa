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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 136
    Width = 603
    Height = 258
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object Open: TDateTimePicker
    Left = 8
    Top = 37
    Width = 145
    Height = 21
    Date = 44673.000000000000000000
    Time = 0.639519421296427000
    TabOrder = 1
  end
  object EdtOpen: TEdit
    Left = 328
    Top = 37
    Width = 83
    Height = 21
    TabOrder = 2
  end
  object Close: TDateTimePicker
    Left = 168
    Top = 37
    Width = 145
    Height = 21
    Date = 44673.000000000000000000
    Time = 0.639519421296427000
    TabOrder = 3
  end
  object Button1: TButton
    Left = 5
    Top = 79
    Width = 150
    Height = 34
    Caption = 'Listar Caixa'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 163
    Top = 79
    Width = 150
    Height = 34
    Caption = 'Atualizar Caixa'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 328
    Top = 79
    Width = 150
    Height = 34
    Caption = 'Remover Caixa'
    TabOrder = 6
    OnClick = Button3Click
  end
  object btnCaixa: TButton
    Left = 504
    Top = 25
    Width = 91
    Height = 72
    Caption = 'Abrir Caixa'
    TabOrder = 7
    OnClick = btnCaixaClick
  end
  object Button4: TButton
    Left = 504
    Top = 103
    Width = 91
    Height = 27
    Caption = 'Count Caixa'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 417
    Top = 37
    Width = 83
    Height = 21
    TabOrder = 9
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 312
    Top = 192
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Projects\Delphi\ControleCaixa\DB\DADOS.DB'
      'DriverID=SQLite')
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
