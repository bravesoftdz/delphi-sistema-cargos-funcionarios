unit UFuncoesDAO;

interface

uses UFuncoesModel, UDM_3LM, vcl.dialogs;

type
  TFuncoesDAO = Class
    Procedure InserirFuncoes(Funcoes: TFuncoesModel);
    Procedure AlterarFuncoes(Funcoes: TFuncoesModel);
    Procedure ApagarFuncoes(Funcoes: TFuncoesModel);
    Procedure MostraFuncoes(Retorno: TFuncoesModel; pCodigo: Integer);
    Procedure MostrarTodosFuncoes;
  End;

implementation

{ TFuncoesDAO }

procedure TFuncoesDAO.AlterarFuncoes(Funcoes: TFuncoesModel);
begin
  with DataModule1.FDQuery1 do
  Begin
    Close;
    SQL.Clear;
    sql.Text := ' update funcoes f set f.descricao = :Descricao where f.codigo = :codigo ';
    ParamByName('codigo').AsInteger := Funcoes.CodigoFuncao;
    ParamByName('Descricao').AsString := Funcoes.DescricaoFuncao;

    try
      ExecSQL;
      ShowMessage('Altera��o de Fun��o realizado com sucesso');
    Except
      ShowMessage('Falha na altera��o de Fun��o');
    end;
  End;
end;

procedure TFuncoesDAO.ApagarFuncoes(Funcoes: TFuncoesModel);
begin
  with DataModule1.FDQuery1 do
  Begin
    Close;
    SQL.Clear;
    sql.Text := 'Delete from funcoes where codigo = :codigo';
    ParamByName('Codigo').AsInteger := Funcoes.CodigoFuncao;

    try
      ExecSQL;
      ShowMessage('Exclus�o de Fun��o realizado com sucesso');
    Except
      ShowMessage('Falha na Exclus�o de Fun��o');
    end;
  End;
end;

procedure TFuncoesDAO.InserirFuncoes(Funcoes: TFuncoesModel);
begin

  with DataModule1.FDQuery1 do
  Begin
    Close;
    SQL.Clear;
    sql.Text := ' Insert into funcoes (Codigo, Descricao) Values (:Codigo, :Descricao)';
    ParamByName('Codigo').AsInteger := Funcoes.CodigoFuncao;
    ParamByName('Descricao').AsString := Funcoes.DescricaoFuncao;

    try
      ExecSQL;
      ShowMessage('Cadastro de Fun��o realizado com sucesso');
    Except
      ShowMessage('Falha no Cadastro de Fun��o');
    end;
  End;

end;

Procedure TFuncoesDAO.MostraFuncoes(Retorno: TFuncoesModel; pCodigo: Integer);
begin
  with DataModule1.FDQuery1 do
  Begin
    Close;
    SQL.Clear;
    sql.Text := ' Select Codigo, descricao from funcoes where codigo = :codigo';
    ParamByName('codigo').AsInteger := pCodigo;


    try
      Open;
      Retorno.CodigoFuncao := FieldByName('codigo').AsInteger;
      Retorno.DescricaoFuncao := FieldByName('Descricao').AsString;
    Except
      ShowMessage('Falha na pesquisa de Fun��o');
    end;
  End;
end;

procedure TFuncoesDAO.MostrarTodosFuncoes;
begin
  with DataModule1.FDQuery1 do
  Begin
    Close;
    SQL.Clear;
    SQL.Text := 'Select * from funcoes order by 1';
    Open;
  End;
end;

end.
