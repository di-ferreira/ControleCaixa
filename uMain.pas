unit uMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Manager.Caixa, Vcl.StdCtrls, DTO.Caixa, Manager.Interfaces,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    btnCaixa: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    Open: TDateTimePicker;
    EdtOpen: TEdit;
    Close: TDateTimePicker;
    Button1: TButton;
    procedure btnCaixaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure AbrirCaixa;
    procedure CarregarCaixas;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AbrirCaixa;
var
  iCaixa: iManager<TCaixa>;
begin
  iCaixa := TManagerCaixa.New;
  iCaixa.DataSet(FDQuery1).This.Abertura(StrToDateTime('21/03/2022 15:25'))
    .Total(1000.70);
  iCaixa.Save;
  Open.DateTime := iCaixa.ResultLastInsert.Abertura;
 // Close.DateTime := iCaixa.ResultLastInsert.Fechamento;

  EdtOpen.Text := CurrToStr(iCaixa.ResultLastInsert.Total);
  CarregarCaixas;
end;

procedure TForm1.btnCaixaClick(Sender: TObject);
begin
  AbrirCaixa;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  CarregarCaixas;
end;

procedure TForm1.CarregarCaixas;
var
  iCaixa: iManager<TCaixa>;
begin
  iCaixa := TManagerCaixa.New;
  iCaixa.DataSet(FDQuery1).Find;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if FDConnection1.Connected then
    FDConnection1.Connected := true;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FDConnection1.Connected := False;
end;

end.
