unit uMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Manager.Caixa, Vcl.StdCtrls, Controller, DTO.Caixa;

type
  TForm1 = class(TForm)
    btnCaixa: TButton;
    mmSql: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnCaixaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    pController: TController;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCaixaClick(Sender: TObject);
var
  vCaixa: TManagerCaixa;
begin
  vCaixa := pController.Caixa;
  vCaixa
     .This
     .Abertura(TDateTime(Now))
     .Total(500);

  vCaixa.Save;

  mmSql.Lines.Add(pController.Caixa.Display);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  pController := TController.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  pController.Free;
end;

end.
