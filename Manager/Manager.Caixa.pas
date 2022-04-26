unit Manager.Caixa;

interface

uses
  Data.DB,
  DTO.Caixa,
  Manager.Types,
  Manager.Interfaces,
  System.Generics.Collections,
  FireDAC.Comp.Client, Vcl.Dialogs, System.TypInfo, System.Variants;

type

  tpColumn = (ID, Abertura, Fechamento, Total);

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
    function FindOne(ID: Variant): TCaixa; overload;
    function Where(Column: String; aValue: Variant): iManager<TCaixa>;
    function _And(Column: String; aValue: Variant): iManager<TCaixa>;
    function _Or(Column: String; aValue: Variant): iManager<TCaixa>;
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
  Result := FDataSet.RecordCount;
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

function TManagerCaixa.FindOne(ID: Variant): TCaixa;
var
  vID: String;
begin
  vID := String(ID);
  FDataSet.SQL.Clear;
  FDataSet.SQL.Add('select * from CAIXA WHERE ID=' + vID);
  FDataSet.Open;
  FCaixa.ID(FDataSet.FieldByName('ID').AsInteger)
    .Abertura(FDataSet.FieldByName('OPENED_IN').AsDateTime)
    .Fechamento(FDataSet.FieldByName('CLOSED_IN').AsDateTime)
    .Total(FDataSet.FieldByName('TOTAL').AsCurrency);

  Result := FCaixa;
end;

function TManagerCaixa.Find: iManager<TCaixa>;
begin
  Result := Self;
  FSQL := 'SELECT * FROM CAIXA';
  FDataSet.SQL.Clear;
  FDataSet.SQL.Add(FSQL);
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
  try
    FSQL := 'DELETE FROM CAIXA WHERE ID = ' + FCaixa.ID.ToString;

    FDataSet.Close;
    FDataSet.SQL.Clear;
    FDataSet.SQL.Add(FSQL);
    FDataSet.ExecSQL;
  Except
    on E: Exception do
      ShowMessage('Erro ao remover dados: ' + E.Message);
  end;
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
  // FCaixa.Fechamento(FDataSet.FieldByName('CLOSED_IN').Value);
  Result := FCaixa;
end;

procedure TManagerCaixa.Save;
var
  vTotal, DateClose, DateOpen: String;
begin
  DateClose := 'Null';
  DateOpen := QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss', FCaixa.Abertura));
  vTotal := StringReplace(FloatToStr(FCaixa.Total), ',', '.', [rfReplaceAll]);

  if DateTimeToStr(FCaixa.Fechamento) = '' then
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
var
  vTotal, DateClose, DateOpen: String;
begin
  DateClose := 'Null';
  DateOpen := QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss', FCaixa.Abertura));
  vTotal := StringReplace(FloatToStr(FCaixa.Total), ',', '.', [rfReplaceAll]);

  if DateTimeToStr(FCaixa.Fechamento) <> '' then
    DateClose := QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss',
      FCaixa.Fechamento));

  try
    FSQL := 'UPDATE CAIXA SET OPENED_IN = ' + DateOpen + ', CLOSED_IN = ' +
      DateClose + ', ' + 'TOTAL = ' + vTotal + ' WHERE ID = ' +
      FCaixa.ID.ToString;

    FDataSet.Close;
    FDataSet.SQL.Clear;
    FDataSet.SQL.Add(FSQL);
    FDataSet.ExecSQL;
  Except
    on E: Exception do
      ShowMessage('Erro ao atualizar dados: ' + E.Message);
  end;
end;

function TManagerCaixa.Where(Column: String; aValue: Variant): iManager<TCaixa>;
var
  aTpColumn: tpColumn;
  vExpression: String;
begin
  aTpColumn := tpColumn(GetEnumValue(TypeInfo(tpColumn), Column));

  case aTpColumn of
    ID:
      begin
        vExpression := 'ID = ' + Integer(aValue).ToString;
      end;

    Abertura:
      begin
        vExpression := 'OPENED_IN = ' +
          QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss',
          VarToDateTime(aValue)));
      end;
    Fechamento:
      begin
        if not(String(aValue) = '') then
          vExpression := 'CLOSED_IN = ' +
            QuotedStr(FormatDateTime('YYYY-MM-DD HH:mm:ss',
            VarToDateTime(aValue)))
        else
          vExpression := 'CLOSED_IN is null';
      end;
    Total:
      begin
        vExpression := 'TOTAL = ' + StringReplace(FloatToStr(Double(aValue)),
          ',', '.', [rfReplaceAll]);
      end;
  end;

  Result := Self;

  FSQL := FSQL + ' WHERE ' + vExpression;
  FDataSet.SQL.Clear;
  FDataSet.SQL.Add(FSQL);
  FDataSet.Open;
end;

function TManagerCaixa._And(Column: String; aValue: Variant): iManager<TCaixa>;
begin

end;

function TManagerCaixa._Or(Column: String; aValue: Variant): iManager<TCaixa>;
begin

end;

end.
