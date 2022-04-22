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
  Manager.Caixa, Vcl.StdCtrls, Controller, DTO.Caixa, Manager.Interfaces,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TForm1 = class(TForm)
    btnCaixa: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    procedure btnCaixaClick(Sender: TObject);
  private
    pController: TController;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCaixaClick(Sender: TObject);
var
  iCaixa: iManager<TCaixa>;
begin
  // iCaixa := TManagerCaixa.New;
  DBGrid1.DataSource := DataSource1;
  DataSource1.DataSet := FDQuery1;

  FDQuery1.Connection := FDConnection1;
  FDQuery1.SQL.Add('select * from CAIXA');
  FDConnection1.Connected := true;
  FDQuery1.Open;
  // iCaixa.DataSet(DataSource1).Find;
end;

end.
