unit Manager.Interfaces;

interface

uses
  System.Generics.Collections,
  Manager.Types;

type
  iManager<T: class> = interface
    function This: T;
    procedure Save;
    procedure Update;
    procedure Remove;
    function List: TObjectList<T>;
    function Find: TObjectList<T>; overload;
    function Find(ID: Variant): T; overload;
    function Where(Expression: TExpression): iManager<T>;
    function _And(Expression: TExpression): iManager<T>;
    function _Or(Expression: TExpression): iManager<T>;
    function Count: Integer;
    function OrderBy(Column: String; Asc: Boolean = True): iManager<T>;

    function Display: String;
  end;

implementation

end.
