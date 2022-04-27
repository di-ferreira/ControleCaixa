unit uMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Manager.Caixa,
  Vcl.StdCtrls,
  DTO.Caixa,
  Manager.Interfaces,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  Vcl.ComCtrls,
  Manager.Types, System.Generics.Collections;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    Open: TDateTimePicker;
    EdtOpen: TEdit;
    Close: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    btnCaixa: TButton;
    Button4: TButton;
    Edit1: TEdit;
    CBOperador: TComboBox;
    CBOrderBy: TComboBox;
    CBLista: TComboBox;
    procedure btnCaixaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    pCaixa: iManager<TCaixa>;
    procedure AbrirCaixa;
    procedure CarregarCaixas;
    procedure AtualizaCaixa;
    procedure RemoverCaixa;
    procedure FillCombo(const pComboBox: TComboBox);
    function TypeOperatorString(Const pType: tpFilterOperator): String;
    procedure FillComboOrderBy(const pComboBox: TComboBox);
    function TypeOrderByString(const pType: tpOrderDirection): String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TForm1.AbrirCaixa;
begin
  pCaixa.DataSet(FDQuery1).This.Abertura(Open.DateTime)
    .Fechamento(Close.DateTime).Total(StrToFloat(EdtOpen.Text));

  pCaixa.Save;

  CarregarCaixas;
end;

procedure TForm1.AtualizaCaixa;
begin
  pCaixa.This.Abertura(Open.DateTime);
  pCaixa.This.Fechamento(Close.DateTime);
  pCaixa.This.Total(StrToCurr(EdtOpen.Text));
  pCaixa.Update;
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

procedure TForm1.Button2Click(Sender: TObject);
begin

  pCaixa.DataSet(FDQuery1).Find.Where(EdtOpen.Text,
    tpFilterOperator(CBOperador.ItemIndex), Edit1.Text).OrderBy(EdtOpen.Text,
    tpOrderDirection(CBOrderBy.ItemIndex));

  // AtualizaCaixa;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  RemoverCaixa;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  EdtOpen.Text := pCaixa.Count.ToString;
end;

procedure TForm1.CarregarCaixas;
begin
  pCaixa.DataSet(FDQuery1).Find;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
var
  CurrentID: Integer;
begin
  CurrentID := DBGrid1.DataSource.DataSet.FieldByName('ID').Value;

  pCaixa.DataSet(FDQuery1).FindOne(CurrentID);
  Open.DateTime := pCaixa.This.Abertura;
  Close.DateTime := pCaixa.This.Fechamento;
  EdtOpen.Text := CurrToStr(pCaixa.This.Total);
  CarregarCaixas;
end;

procedure TForm1.FillCombo(const pComboBox: TComboBox);
var
  iType: tpFilterOperator;
begin
  pComboBox.Items.Clear;
  pComboBox.Items.BeginUpdate;
  for iType := tpFilterOperator.Eq to tpFilterOperator.Between do
  begin
    pComboBox.Items.Add(TypeOperatorString(iType));
  end;
  pComboBox.Items.EndUpdate;
end;

procedure TForm1.FillComboOrderBy(const pComboBox: TComboBox);
var
  iType: tpOrderDirection;
begin
  pComboBox.Items.Clear;
  pComboBox.Items.BeginUpdate;
  for iType := tpOrderDirection.Asc to tpOrderDirection.Desc do
  begin
    pComboBox.Items.Add(TypeOrderByString(iType));
  end;
  pComboBox.Items.EndUpdate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if FDConnection1.Connected then
    FDConnection1.Connected := true;

  pCaixa := TManagerCaixa.New;

  FillCombo(CBOperador);
  FillComboOrderBy(CBOrderBy);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FDConnection1.Connected := False;
end;

procedure TForm1.RemoverCaixa;
begin
  pCaixa.Remove;
  CarregarCaixas;
end;

function TForm1.TypeOperatorString(const pType: tpFilterOperator): String;
const
  cResults: array [tpFilterOperator] of string = (
    { Eq } 'Igual',
    { GreaterThan } 'Maior que',
    { GreaterOrEqual } 'Maior ou Igual',
    { LessThan } 'Menor que',
    { LessOrEqual } 'Menor ou Igual',
    { Like } 'Like',
    { Different } 'Diferente de',
    { Between } 'Entre');
begin
  Result := cResults[pType];
end;

function TForm1.TypeOrderByString(const pType: tpOrderDirection): String;
const
  cResults: array [tpOrderDirection] of string = (
    { Asc } 'Asc',
    { Desc } 'Desc');
begin
  Result := cResults[pType];
end;

end.
