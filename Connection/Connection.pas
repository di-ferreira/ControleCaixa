unit Connection;

interface

uses
  Firedac.Stan.Intf,
  Firedac.Stan.Option,
  Firedac.Stan.Error,
  Firedac.UI.Intf,
  Firedac.Phys.Intf,
  Firedac.Stan.Def,
  Firedac.Stan.Pool,
  Firedac.Stan.Async,
  Firedac.Phys,
  Firedac.Phys.SQLite,
  Firedac.Phys.SQLiteDef,
  Firedac.Stan.ExprFuncs,
  Firedac.Phys.SQLiteWrapper.Stat,
  Firedac.VCLUI.Wait,
  Firedac.Comp.Client,
  Firedac.Stan.Param,
  Firedac.DatS,
  Firedac.DApt.Intf,
  Firedac.DApt,
  Firedac.Comp.DataSet,
  Data.DB,
  Connection.Interfaces;

type
  TConnection = class(TInterfacedObject, iConnection)
  private
    FConn: TFDConnection;
    FQuery: TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iConnection;
    function Params(Param: String; Value: Variant): iConnection; overload;
    function DataSet(DataSource: TDataSource): iConnection; overload;
    function DataSet: TDataSet; overload;
    function RunSQL: iConnection;
    function OpenDataSet: iConnection;
    function SQL(Value: String): iConnection;
  end;

implementation

{ TConnection }

function TConnection.DataSet(DataSource: TDataSource): iConnection;
begin
  Result := Self;
  DataSource.DataSet := FQuery;
end;

constructor TConnection.Create;
var
  DB: String;
begin
  FConn := TFDConnection.Create(nil);
  FQuery := TFDQuery.Create(nil);
  FConn.Params.Clear;
  FConn.Params.Add('DriverID=SQLite');
  FConn.Params.Add('DataBase=C:\Projects\Delphi\ControleCaixa\DB\DADOS.SDB');
  FConn.Params.Add('LockingMode=Normal');
  FConn.Connected := True;
  FQuery.Connection := FConn;
end;

function TConnection.DataSet: TDataSet;
begin
  Result := FQuery;
end;

destructor TConnection.Destroy;
begin
  FConn.DisposeOf;
  FQuery.DisposeOf;
  inherited;
end;

class function TConnection.New: iConnection;
begin
  Result := Self.Create;
end;

function TConnection.OpenDataSet: iConnection;
begin
  Result := Self;
  FQuery.Open;
end;

function TConnection.Params(Param: String; Value: Variant): iConnection;
begin
  Result := Self;
  FQuery.ParamByName(Param).Value := Value;
end;

function TConnection.RunSQL: iConnection;
begin
  Result := Self;
  FQuery.ExecSQL;
end;

function TConnection.SQL(Value: String): iConnection;
begin
  Result := Self;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);
end;

end.
