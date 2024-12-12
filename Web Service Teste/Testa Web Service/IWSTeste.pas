// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8080/wsdl/IWMTeste
// Version  : 1.0
// (11/12/2024 16:07:36 - - $Rev: 116709 $)
// ************************************************************************ //

unit IWSTeste;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[]

  // ************************************************************************ //
  // Namespace : urn:UWMTesteIntf-IWMTeste
  // soapAction: urn:UWMTesteIntf-IWMTeste#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : IWMTestebinding
  // service   : IWMTesteservice
  // port      : IWMTestePort
  // URL       : http://localhost:8080/soap/IWMTeste
  // ************************************************************************ //
  IWMTeste = interface(IInvokable)
    ['{7020D565-B99C-BE5E-7CBD-0819B14B0735}']
    function ConsultarSql(const SQL: string): string; stdcall;
    function VerificaConexao: string; stdcall;
  end;

function GetIWMTeste(UseWSDL: Boolean = System.False; Addr: string = '';
  HTTPRIO: THTTPRIO = nil): IWMTeste;

implementation

uses System.SysUtils;

function GetIWMTeste(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO)
  : IWMTeste;
const
  defWSDL = 'http://localhost:8080/wsdl/IWMTeste';
  defURL = 'http://localhost:8080/soap/IWMTeste';
  defSvc = 'IWMTesteservice';
  defPrt = 'IWMTestePort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as IWMTeste);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end
    else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;

initialization

{ IWMTeste }
InvRegistry.RegisterInterface(TypeInfo(IWMTeste),
  'urn:UWMTesteIntf-IWMTeste', '');
InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IWMTeste),
  'urn:UWMTesteIntf-IWMTeste#%operationName%');

end.
