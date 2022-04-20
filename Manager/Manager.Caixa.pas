unit Manager.Caixa;

interface

uses
  DTO.Caixa,
  Manager.Interfaces,
  Manager.Types,
  System.Generics.Collections,
  System.SysUtils;

type
  TManagerCaixa = class(TInterfacedObject, iManager<TCaixa>)
  private
    FSQL: String;
    FCaixa: TCaixa;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iManager<TCaixa>;
    function This: TCaixa;
    procedure Save;
    procedure Update;
    procedure Remove;
    function List: TObjectList<TCaixa>;
    function Find: TObjectList<TCaixa>; overload;
    function Find(ID: Variant): TCaixa; overload;
    function Where(Expression: TExpression): iManager<TCaixa>;
    function _And(Expression: TExpression): iManager<TCaixa>;
    function _Or(Expression: TExpression): iManager<TCaixa>;
    function Count: Integer;
    function OrderBy(Column: String; Asc: Boolean = True): iManager<TCaixa>;

    function Display: String;
  end;

implementation

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

end;

function TManagerCaixa.Find: TObjectList<TCaixa>;
begin

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

procedure TManagerCaixa.Save;
begin
//  FSQL := '';
  FSQL := 'INSERT INTO caixa VALUES(NULL, ' + DateToStr(FCaixa.Abertura) + ', '
    + DateToStr(FCaixa.Fechamento) + ', ' + CurrToStr(FCaixa.Total) + ')';
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