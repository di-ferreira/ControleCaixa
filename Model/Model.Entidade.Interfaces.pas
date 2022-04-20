unit Model.Entidade.Interfaces;

interface

uses
  Data.DB;

type
  iModelEntidade<T: class> = interface
    function Find: iModelEntidade<T>;
    function FindOne(Id: Variant): iModelEntidade<T>;
    function Remove(Id: Integer): iModelEntidade<T>; overload;
    function Update: iModelEntidade<T>;
    function Insert: iModelEntidade<T>;
    function DataSet(DataSource: TDataSource): iModelEntidade<T>;
    function This: T;
  end;

implementation

end.
