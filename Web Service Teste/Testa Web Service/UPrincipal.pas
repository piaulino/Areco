unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Soap.InvokeRegistry, Soap.Rio, Soap.SOAPHTTPClient, Datasnap.DBClient,
  System.Net.URLClient, Data.DB, Vcl.Grids, Vcl.DBGrids, IWSTeste;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    HTTPRIO1: THTTPRIO;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    procedure Button1Click(Sender: TObject);
    procedure LimparClick(Sender: TObject);
  private
    function AlimentarClientDataSet(ClientDataSet: TClientDataSet; const XML: string): Boolean;
    procedure AbrirClientDataSet(const Response: string);
    procedure PreencherMemo(const Texto: string);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.PreencherMemo(const Texto: string);
begin
  Memo1.Lines.Text := Texto;
end;

function TForm2.AlimentarClientDataSet(ClientDataSet: TClientDataSet; const XML: string): Boolean;
var
  XMLStream: TStringStream;
begin
  Result := False;
  XMLStream := TStringStream.Create(XML);
  try
    ClientDataSet.Close;
    ClientDataSet.LoadFromStream(XMLStream);
    ClientDataSet.Open;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao alimentar ClientDataSet: ' + E.Message);
    end;
  end;
  XMLStream.Free;
end;

procedure TForm2.AbrirClientDataSet(const Response: string);
begin
  try
    if not AlimentarClientDataSet(ClientDataSet1, Response) then
      ShowMessage('Erro ao abrir ClientDataSet.');
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao executar SQL: ' + E.Message);
    end;
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  Response: string;
  WMTeste: IWMTeste;
begin
  try
    WMTeste := GetIWMTeste;
    Response:= '';

    if TButton(Sender).Name = Button2.Name then
    begin
      Response := WMTeste.ConsultarSql('select * from cadastro.unidades_medida');
      if Response <> '' then
        if Copy(Response,1,4) <> 'Erro' then
          AbrirClientDataSet(Response);

    end else if TButton(Sender).Name = Button1.Name then
      Response := WMTeste.VerificaConexao;

    if Response <> '' then
      PreencherMemo(Response);


  finally
    WMTeste := nil;
  end;

end;

procedure TForm2.LimparClick(Sender: TObject);
begin
  Memo1.Clear;
  ClientDataSet1.Close;

end;

end.

