unit UWMTeste;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Soap.InvokeRegistry,
  Soap.WSDLIntf, System.TypInfo, Soap.WebServExp, Soap.WSDLBind, Xml.XMLSchema,
  Soap.WSDLPub, Soap.SOAPPasInv, Soap.SOAPHTTPPasInv, Soap.SOAPHTTPDisp,
  Soap.WebBrokerSOAP;

type
  TWebModule1 = class(TWebModule)
    HTTPSoapDispatcher1: THTTPSoapDispatcher;
    HTTPSoapPascalInvoker1: THTTPSoapPascalInvoker;
    WSDLHTMLPublish1: TWSDLHTMLPublish;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleAfterDispatch(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    procedure LogRequestDetails(Request: TWebRequest);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UGlobal;

{$R *.dfm}

procedure TWebModule1.LogRequestDetails(Request: TWebRequest);
var
  LogFile: TextFile;
  Param: string;
  Params: TStringList;
begin
  AssignFile(LogFile, 'RequestLog.txt');
  try
    if FileExists('RequestLog.txt') then
      Append(LogFile)
    else
      Rewrite(LogFile);

    // Log do IP do cliente
    Writeln(LogFile, 'IP do Cliente: ' + Request.RemoteAddr);

    // Log da URL solicitada
    Writeln(LogFile, 'URL Solicitada: ' + Request.URL);

    // Log dos parâmetros da requisição
    Params := TStringList.Create;
    try
      for Param in Request.QueryFields do
        Params.Values[Param] := Request.QueryFields.Values[Param];

      Writeln(LogFile, 'Parâmetros da Requisição: ' + Params.Text);
    finally
      Params.Free;
    end;

    Writeln(LogFile, '-----------------------------');
  finally
    CloseFile(LogFile);
  end;
end;

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  WSDLHTMLPublish1.ServiceInfo(Sender, Request, Response, Handled);

end;

procedure TWebModule1.WebModuleAfterDispatch(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  //LogRequestDetails(Request);
end;

end.
