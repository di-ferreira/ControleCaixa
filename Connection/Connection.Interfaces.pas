unit Connection.Interfaces;

interface

uses
  Data.DB;

type
  iConnection = interface
    function Params(Param: String; Value: Variant): iConnection; overload;
    function DataSet(DataSource: TDataSource): iConnection; overload;
    function DataSet: TDataSet; overload;
    function RunSQL: iConnection;
    function OpenDataSet: iConnection;
    function SQL(Value: String): iConnection;
  end;

implementation

end.
