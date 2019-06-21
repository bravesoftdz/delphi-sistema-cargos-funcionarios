unit UCadastroFuncoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPrincipal, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  UDM_3LM, UFuncoesDAO,UFuncoesModel, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadastroFuncoes = class(TfrmPrincipal)
    edtCodigoFuncoes: TEdit;
    Label1: TLabel;
    lblDescricaoFuncoes: TLabel;
    edtDescricaoFuncao: TEdit;
    btnCadastrar: TButton;
    Button1: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnMostrarFuncoes: TButton;
    DBGrid1: TDBGrid;
    procedure btnCadastrarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnMostrarFuncoesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoFuncoesChange(Sender: TObject);
  private
    { Private declarations }
    Dados : TFuncoesModel;
  public
    { Public declarations }
  end;

var
  frmCadastroFuncoes: TfrmCadastroFuncoes;
  cadastrar : TFuncoesDAO;


implementation

{$R *.dfm}


procedure TfrmCadastroFuncoes.btnAlterarClick(Sender: TObject);
var
  mostrarTodos: TFuncoesDAO;
begin
  inherited;

  if (cadastrar = nil) then
    cadastrar := TFuncoesDAO.Create;

  if (Dados = nil) then
    Dados := TFuncoesModel.Create;

  Dados.DescricaoFuncao := edtDescricaoFuncao.Text;
  Dados.CodigoFuncao := StrToInt(edtCodigoFuncoes.Text);

  cadastrar.AlterarFuncoes(Dados);

  try
    mostrarTodos := TFuncoesDAO.Create;
    mostrarTodos.MostrarTodosFuncoes;
  finally
    FreeAndNil(mostrarTodos);
  end;

  edtCodigoFuncoes.Clear;
  edtDescricaoFuncao.Clear;
  edtCodigoFuncoes.SetFocus;
end;

procedure TfrmCadastroFuncoes.btnCadastrarClick(Sender: TObject);
begin
  inherited;

  if (cadastrar = nil) then
    cadastrar := TFuncoesDAO.Create;

  if (Dados = nil) then
    Dados := TFuncoesModel.Create;

  Dados.CodigoFuncao := StrToInt(edtCodigoFuncoes.Text);
  Dados.DescricaoFuncao := edtDescricaoFuncao.Text;

  cadastrar.InserirFuncoes(Dados);
  edtCodigoFuncoes.Clear;
  edtDescricaoFuncao.Clear;
  edtCodigoFuncoes.SetFocus;

end;

procedure TfrmCadastroFuncoes.Button1Click(Sender: TObject);
begin
  inherited;
  Application.Terminate;
end;

procedure TfrmCadastroFuncoes.edtCodigoFuncoesChange(Sender: TObject);
begin
  inherited;
  if (trim(edtCodigoFuncoes.Text) = EmptyStr) then
  Begin
    edtDescricaoFuncao.Clear;
    btnMostrarFuncoesClick(Sender);
  End
  else
  Begin
    if (cadastrar = nil) then
      cadastrar := TFuncoesDAO.Create;

    if (Dados = nil) then
      Dados := TFuncoesModel.Create;

    cadastrar.MostraFuncoes(Dados, StrToInt(edtCodigoFuncoes.Text));
    edtDescricaoFuncao.Text := Dados.DescricaoFuncao;
    edtCodigoFuncoes.SetFocus;
    End;
end;

procedure TfrmCadastroFuncoes.btnExcluirClick(Sender: TObject);
var
  mostrarTodos: TFuncoesDAO;
begin
  inherited;

  if (cadastrar = nil) then
    cadastrar := TFuncoesDAO.Create;

  if (Dados = nil) then
    Dados := TFuncoesModel.Create;

  Dados.CodigoFuncao := StrToInt(edtCodigoFuncoes.Text);
  cadastrar.ApagarFuncoes(Dados);

  try
    mostrarTodos := TFuncoesDAO.Create;
    mostrarTodos.MostrarTodosFuncoes;
  finally
    FreeAndNil(mostrarTodos);
  end;

  edtCodigoFuncoes.Clear;
  edtDescricaoFuncao.Clear;
  edtCodigoFuncoes.SetFocus;



end;

procedure TfrmCadastroFuncoes.btnMostrarFuncoesClick(Sender: TObject);
var
  mostrarTodos: TFuncoesDAO;

begin
  inherited;
  try
    mostrarTodos := TFuncoesDAO.Create;
    mostrarTodos.MostrarTodosFuncoes;
  finally
    FreeAndNil(mostrarTodos);
  end;
end;

procedure TfrmCadastroFuncoes.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(cadastrar) then
    FreeAndNil(cadastrar);
end;

procedure TfrmCadastroFuncoes.FormShow(Sender: TObject);
var
  mostrarTodos: TFuncoesDAO;
begin
  inherited;
  btnMostrarFuncoesClick(Sender);
end;

end.
