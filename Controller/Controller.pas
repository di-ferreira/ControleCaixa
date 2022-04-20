unit Controller;

interface

uses
  Manager.Caixa;

type
  TController = class
  private
    FCaixa: TManagerCaixa;
  public
    constructor Create;
    destructor Destroy; override;
    function Caixa: TManagerCaixa;
  end;

implementation

{ TController }

function TController.Caixa: TManagerCaixa;
begin
  FCaixa := TManagerCaixa.Create;
  Result := FCaixa;
end;

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin
  if Assigned(FCaixa) then
    FCaixa.Free;
  inherited;
end;

end.
