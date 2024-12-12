unit UWMTesteImpl;

interface

uses
  System.SysUtils, Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns,
  UWMTesteIntf, UDMTeste, Windows, Vcl.Forms;

type
  { TWMTesteImpl implements IWMTeste }
  TWMTesteImpl = class(TInvokableClass, IWMTeste)
  strict private
    function CreateDM: TDMTeste;
    procedure DestroiDM(DM: TDMTeste);

    function GerarStringAleatoria6Digitos: string;
    procedure TrimAppMemorySize;
  private

  public
    function ConsultarSql(const SQL: string): string; stdcall;
    function VerificaConexao: string; stdcall;

  end;

implementation

uses UMensagens;

procedure TWMTesteImpl.TrimAppMemorySize;
var
  MainHandle: THandle;
begin
  MainHandle := OpenProcess(PROCESS_ALL_ACCESS, False, GetCurrentProcessID);
  try
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF);
  finally
    CloseHandle(MainHandle);
  end;
  Application.ProcessMessages;
end;

function TWMTesteImpl.ConsultarSql(const SQL: string): string;
var
  DM: TDMTeste;
begin
  Result := ComSucesso;
  DM := CreateDM;
  try

    try
      Result := DM.ExecutaConsulta(SQL);

    except
      on E: Exception do
      begin
        Result := SemSucesso + E.Message;

      end;
    end;

  finally
    DestroiDM(DM)
  end;
end;

function TWMTesteImpl.CreateDM: TDMTeste;
begin
  Result := TDMTeste.Create(nil);

  try
    Result.Name := 'DM' + GerarStringAleatoria6Digitos +
      FormatDateTime('mmddhhnnsszzz', now);

    Result.FdConexao.Connected := true;

  finally
    Result.FdConexao.Connected := False;

  end;

end;

procedure TWMTesteImpl.DestroiDM(DM: TDMTeste);
begin
  if DM <> nil then
  begin
    DM.FdConexao.Connected := False;
    DM.Free;
    TrimAppMemorySize;
  end;
end;

function TWMTesteImpl.GerarStringAleatoria6Digitos: string;
var
  i: Integer;
begin
  Randomize; // Inicializa o gerador de números aleatórios
  Result := '';
  for i := 1 to 6 do
    Result := Result + IntToStr(Random(10));
  // Adiciona um dígito aleatório (0-9) à string

end;

function TWMTesteImpl.VerificaConexao: string;
var
  DM: TDMTeste;
begin
  Result := ComSucesso;
  DM := CreateDM;
  try

    try
    except
      on E: Exception do
      begin
        Result := SemSucesso;
      end;
    end;

  finally
    DestroiDM(DM)
  end;

end;

initialization

{ Invokable classes must be registered }
InvRegistry.RegisterInvokableClass(TWMTesteImpl);

end.
