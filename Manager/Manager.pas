unit Manager;

interface

uses
  Manager.Interfaces,
  Manager.Types,
  System.Generics.Collections;

type
  TManager<T: class> = class(TInterfacedObject, iManager<T>)
  private
    FSQL: String;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iManager<T>;
    procedure Save(Entity: T);
    procedure Update(Entity: T);
    procedure Remove(Entity: T);
    function List: TObjectList<T>;
    function UniqueResult: T;
    function Find: TObjectList<T>; overload;
    function Find(ID: Variant): T; overload;
    function Find(AClass: TClass): iManager<T>; overload;
    function Where(Expression: TExpression): iManager<T>;
    function _And(Expression: TExpression): iManager<T>;
    function _Or(Expression: TExpression): iManager<T>;
    function Count: Integer;
    function OrderBy(Column: String; Asc: Boolean = True): iManager<T>;
  end;

implementation

{ TManager<T> }

function TManager<T>.Count: Integer;
begin

end;

constructor TManager<T>.Create;
begin

end;

destructor TManager<T>.Destroy;
begin

  inherited;
end;

function TManager<T>.Find(AClass: TClass): iManager<T>;
begin

end;

function TManager<T>.List: TObjectList<T>;
begin

end;

function TManager<T>.Find(ID: Variant): T;
begin

end;

function TManager<T>.Find: TObjectList<T>;
begin

end;

class function TManager<T>.New: iManager<T>;
begin

end;

function TManager<T>.OrderBy(Column: String; Asc: Boolean): iManager<T>;
begin

end;

procedure TManager<T>.Remove(Entity: T);
begin

end;

procedure TManager<T>.Save(Entity: T);
begin

end;

function TManager<T>.UniqueResult: T;
begin

end;

procedure TManager<T>.Update(Entity: T);
begin

end;

function TManager<T>.Where(Expression: TExpression): iManager<T>;
begin

end;

function TManager<T>._And(Expression: TExpression): iManager<T>;
begin

end;

function TManager<T>._Or(Expression: TExpression): iManager<T>;
begin

end;

end.
