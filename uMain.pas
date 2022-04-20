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
  Manager.Caixa, Vcl.StdCtrls, Controller, DTO.Caixa, Manager.Interfaces;

type
  TForm1 = class(TForm)
    btnCaixa: TButton;
    mmSql: TMemo;
    procedure btnCaixaClick(Sender: TObject);
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
  iCaixa: iManager<TCaixa>;
begin
  iCaixa := TManagerCaixa.New;
  iCaixa.This.Abertura(TDateTime(Now)).Total(500);

  iCaixa.Save;

  mmSql.Lines.Add(iCaixa.Display);
end;

end.
