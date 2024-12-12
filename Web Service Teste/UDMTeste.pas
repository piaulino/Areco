unit UDMTeste;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.DBClient, Datasnap.Provider;

type
  TDMTeste = class(TDataModule)
    FdConexao: TFDConnection;
    FdExecuta: TFDQuery;
    cdsConsulta: TClientDataSet;
    dtpConsulta: TDataSetProvider;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private

    { Private declarations }
  public
    function ExecutaConsulta(const SQL: string): string;
    { Public declarations }
  end;

var
  DMTeste: TDMTeste;

implementation

uses Winapi.ActiveX, UMensagens;
{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

function TDMTeste.ExecutaConsulta(const SQL: string): string;
var
  XMLStream: TStringStream;
begin
  Result := '';

  try
    FdExecuta.SQL.Text := SQL;
    FdExecuta.Open; // Abrir o FdExecuta para leitura dos dados

    // Configurar o DataSetProvider e atribuir o DataSet DataSetProvider1.DataSet
    dtpConsulta.DataSet := FdExecuta;

    // Copiar os dados do FdExecuta para o ClientDataSet usando a propriedade Data
    cdsConsulta.SetProvider(dtpConsulta);
    cdsConsulta.Open;

    // Serializar o ClientDataSet para XML
    XMLStream := TStringStream.Create;
    try
      cdsConsulta.SaveToStream(XMLStream, dfXML);
      Result := XMLStream.DataString;
    finally
      XMLStream.Free;
    end;

    if Result = '' then
      raise Exception.Create('');

  except
    on E: Exception do
    begin
      raise Exception.Create(SemSucesso + ErroSintaxe);
    end;
  end;
  FdConexao.Connected := False;
end;

procedure TDMTeste.DataModuleCreate(Sender: TObject);
begin
  CoInitialize(nil);
end;

procedure TDMTeste.DataModuleDestroy(Sender: TObject);
begin
  CoUnInitialize;
end;

end.
