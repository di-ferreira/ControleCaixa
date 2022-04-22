unit Manager.Caixa;

interface

uses
  Data.DB,
  DTO.Caixa,
  Manager.Types,
  Manager.Interfaces,
  System.Generics.Collections,
  FireDAC.Comp.Client, Vcl.Dialogs;

type
  TManagerCaixa = class(TInterfacedObject, iManager<TCaixa>)
  private
    FSQL: String;
    FCaixa: TCaixa;
    FDataSet: TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iManager<TCaixa>;
    function This: TCaixa;
    procedure Save;
    procedure Update;
    procedure Remove;
    function DataSet(DataSet: TFDQuery): iManager<TCaixa>;
    function List: TObjectList<TCaixa>;
    function UniqueResult: TCaixa;
    function ResultLastInsert: TCaixa;
    function Find: iManager<TCaixa>; overload;
    function Find(ID: Variant): TCaixa; overload;
    function Where(Expression: TExpression): iManager<TCaixa>;
    function _And(Expression: TExpression): iManager<TCaixa>;
    function _Or(Expression: TExpression): iManager<TCaixa>;
    function Count: Integer;
    function OrderBy(Column: String; Asc: Boolean = True): iManager<TCaixa>;

    function Display: String;
  end;

implementation

uses
  System.SysUtils;

{ TManagerCaixa }

function TManagerCaixa.This: TCaixa;
begin
  Result := FCaixa;
end;

function TManagerCaixa.Count: Integer;
begin

end;

constructor TManagerCaixa.Create;
begin
  FCaixa := TCaixa.Create;
end;

function TManagerCaixa.DataSet(DataSet: TFDQuery): iManager<TCaixa>;
begin
  Result := Self;
  FDataSet := DataSet;
end;

destructor TManagerCaixa.Destroy;
begin
  FCaixa.Free;
  inherited;
end;

function TManagerCaixa.Display: String;
begin
  Result := FSQL;
end;

function TManagerCaixa.Find(ID: Variant): TCaixa;
begin
  FDataSet.SQL.Clear;
  FDataSet.SQL.Add('select * from CAIXA WHERE ID=' + ID);
  FDataSet.Open;
  FCaixa.ID(FDataSet.ParamByName('ID').Value)
    .Abertura(FDataSet.ParamByName('OPENED_IN').Value)
    .Fechamento(FDataSet.ParamByName('CLOSED_IN').Value);
  Result := FCaixa;
end;

function TManagerCaixa.Find: iManager<TCaixa>;
begin
  Result := Self;
  FDataSet.SQL.Clear;
  FDataSet.SQL.Add('select * from CAIXA');
  FDataSet.Open;
end;

function TManagerCaixa.List: TObjectList<TCaixa>;
begin

end;

class function TManagerCaixa.New: iManager<TCaixa>;
begin
  Result := Self.Create;
end;

function TManagerCaixa.OrderBy(Column: String; Asc: Boolean): iManager<TCaixa>;
begin

end;

procedure TManagerCaixa.Remove;
begin

end;

function TManagerCaixa.ResultLastInsert: TCaixa;
begin
  FSQL := 'SELECT *FROM CAIXA WHERE ID = (SELECT MAX(ID) FROM CAIXA)';
  FDataSet.Close;
  FDataSet.SQL.Clear;
  FDataSet.SQL.Add(FSQL);
  FDataSet.Open;
  FCaixa.ID(FDataSet.FieldByName('ID').Value)
    .Abertura(FDataSet.FieldByName('OPENED_IN').Value);
//    FCaixa.Fechamento(FDataSet.FieldByName('CLOSED_IN').Value);
  Result := FCaixa;
end;

procedure TManagerCaixa.Save;
var
  vTotal, DateClose, DateOpen: String;
begin
  DateClose := 'Null';
  DateOpen := QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss', FCaixa.Abertura));
  vTotal := StringReplace(FloatToStr(FCaixa.Total), ',', '.', [rfReplaceAll]);

  if (FormatDateTime('yyyy/mm/dd', FCaixa.Fechamento) >
    FormatDateTime('yyyy/mm/dd', Date)) then
    DateClose := QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss',
      FCaixa.Fechamento));

  try
    FSQL := 'INSERT INTO CAIXA ( ID, OPENED_IN, CLOSED_IN, Total)VALUES(Null,' +
      DateOpen + ', ' + DateClose + ', ' + vTotal + ')';

    FDataSet.Close;
    FDataSet.SQL.Clear;
    FDataSet.SQL.Add(FSQL);
    FDataSet.ExecSQL;
  Except
    on E: Exception do
      ShowMessage('Erro ao salvar dados: ' + E.Message);
  end;
end;

function TManagerCaixa.UniqueResult: TCaixa;
begin

end;

procedure TManagerCaixa.Update;
begin

end;

function TManagerCaixa.Where(Expression: TExpression): iManager<TCaixa>;
begin

end;

function TManagerCaixa._And(Expression: TExpression): iManager<TCaixa>;
begin

end;

function TManagerCaixa._Or(Expression: TExpression): iManager<TCaixa>;
begin

end;

end.
