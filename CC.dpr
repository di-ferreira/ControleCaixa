program CC;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  DTO.Caixa in 'Classes\DTO.Caixa.pas',
  Model.Entidade.Interfaces in 'Model\Model.Entidade.Interfaces.pas',
  Manager.Interfaces in 'Manager\Manager.Interfaces.pas',
  Manager.Types in 'Manager\Manager.Types.pas',
  Manager.Caixa in 'Manager\Manager.Caixa.pas',
  Controller in 'Controller\Controller.pas',
  Connection.Interfaces in 'Connection\Connection.Interfaces.pas',
  Connection in 'Connection\Connection.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
