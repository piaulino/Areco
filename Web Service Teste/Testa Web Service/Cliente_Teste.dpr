program Cliente_Teste;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {Form2},
  IWSTeste in 'IWSTeste.pas',
  UMensagens in '..\..\Global\UMensagens.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;

end.
