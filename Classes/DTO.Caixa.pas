unit DTO.Caixa;

interface

type
  TCaixa = class
  private
    FID: Integer;
    FFechamento: TDateTime;
    FTotal: Currency;
    FAbertura: TDateTime;
  public
    function ID: Integer; overload;
    function ID(Value: Integer): TCaixa; overload;
    function Abertura: TDateTime; overload;
    function Abertura(Date: TDateTime): TCaixa; overload;
    function Fechamento: TDateTime; overload;
    function Fechamento(Date: TDateTime): TCaixa; overload;
    function Total: Currency; overload;
    function Total(Value: Currency): TCaixa; overload;
  end;

implementation

{ TCaixa }

function TCaixa.Abertura: TDateTime;
begin
  Result := FAbertura;
end;

function TCaixa.Abertura(Date: TDateTime): TCaixa;
begin
  FAbertura := Date;
  Result := Self;
end;

function TCaixa.Fechamento: TDateTime;
begin
  Result := FFechamento;
end;

function TCaixa.Fechamento(Date: TDateTime): TCaixa;
begin
  FFechamento := Date;
  Result := Self;
end;

function TCaixa.ID(Value: Integer): TCaixa;
begin
  FID := Value;
  Result := Self;
end;

function TCaixa.ID: Integer;
begin
  Result := FID;
end;

function TCaixa.Total: Currency;
begin
  Result := FTotal;
end;

function TCaixa.Total(Value: Currency): TCaixa;
begin
  FTotal := Value;
  Result := Self;
end;

end.
