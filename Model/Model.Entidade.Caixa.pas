unit Model.Entidade.Caixa;

interface

uses
  DTO.Caixa,
  Data.DB,
  Model.Entidade.Interfaces;

type
  TModelEntityCaixa = class(TInterfacedObject, iModelEntidade<TCaixa>)
  private
    FCaixa: TCaixa;
    FDataSet: TDataSet;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelEntidade<TCaixa>;
    function Find: iModelEntidade<TCaixa>;
    function FindOne(Id: Variant): iModelEntidade<TCaixa>;
    function Remove(Id: Integer): iModelEntidade<TCaixa>; overload;
    function Update: iModelEntidade<TCaixa>;
    function Insert: iModelEntidade<TCaixa>;
    function DataSet(DataSource: TDataSource): iModelEntidade<TCaixa>;
    function This: TCaixa;
  end;

implementation

{ TModelEntityCaixa }

constructor TModelEntityCaixa.Create;
begin
  FCaixa := TCaixa.Create;
end;

function TModelEntityCaixa.DataSet(DataSource: TDataSource)
  : iModelEntidade<TCaixa>;
begin
  Result := Self;
  // if not Assigned(FDataSet) then
  // DataSource.DataSet := FConexao.DataSet
  // else
  // DataSource.DataSet := FDataSet;
end;

destructor TModelEntityCaixa.Destroy;
begin

  inherited;
end;

function TModelEntityCaixa.Find: iModelEntidade<TCaixa>;
begin

end;

function TModelEntityCaixa.FindOne(Id: Variant): iModelEntidade<TCaixa>;
begin

end;

function TModelEntityCaixa.Insert: iModelEntidade<TCaixa>;
begin

end;

class function TModelEntityCaixa.New: iModelEntidade<TCaixa>;
begin
  Result := Self.Create;
end;

function TModelEntityCaixa.Remove(Id: Integer): iModelEntidade<TCaixa>;
begin

end;

function TModelEntityCaixa.This: TCaixa;
begin

end;

function TModelEntityCaixa.Update: iModelEntidade<TCaixa>;
begin

end;

end.
