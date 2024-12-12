{ Invokable interface IWMTeste }

unit UWMTesteIntf;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns;

type

  { Invokable interfaces must derive from IInvokable }
  IWMTeste = interface(IInvokable)
    ['{A6991A58-B7BF-4358-BF4D-A02F0FC1B5EA}']

    { Methods of Invokable interface must not use the default }
    { calling convention; stdcall is recommended }
    function ConsultarSql(const SQL: string): string; stdcall;
    function VerificaConexao: string; stdcall;
  end;

implementation

initialization

{ Invokable interfaces must be registered }
InvRegistry.RegisterInterface(TypeInfo(IWMTeste));

end.
