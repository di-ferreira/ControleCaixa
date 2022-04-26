unit Manager.Interfaces;

interface

uses
  System.Generics.Collections,
  Manager.Types,
  Data.DB,
  FireDAC.Comp.Client;

type
  iManager<T: class> = interface
    function This: T;
    procedure Save;
    procedure Update;
    procedure Remove;
    function DataSet(DataSet: TFDQuery): iManager<T>;
    function List: TObjectList<T>;
    function UniqueResult: T;
    function ResultLastInsert: T;
    function Find: iManager<T>; overload;
    function FindOne(ID: Variant): T; overload;
    function Where(Column: String; FilterOperator: tpFilterOperator;
      aValue: Variant): iManager<T>;
    function _And(Column: String; FilterOperator: tpFilterOperator;
      aValue: Variant): iManager<T>;
    function _Or(Column: String; FilterOperator: tpFilterOperator;
      aValue: Variant): iManager<T>;
    function Count: Integer;
    function OrderBy(Column: String;
      Direction: tpOrderDirection = tpOrderDirection.Asc): iManager<T>;

    function Display: String;
  end;

implementation

end.
