program WebServiceTeste;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  UWS in 'UWS.pas' {Form1},
  UWMTeste in 'UWMTeste.pas' {WebModule1: TWebModule},
  UWMTesteImpl in 'UWMTesteImpl.pas',
  UWMTesteIntf in 'UWMTesteIntf.pas',
  UDMTeste in 'UDMTeste.pas' {DMTeste: TDataModule},
  UMensagens in '..\Global\UMensagens.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
