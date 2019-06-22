unit UFuncionarioDAO;

interface

uses UDM_3LM, UFuncionarioModel, vcl.dialogs;

type
  TFuncionarioDAO = class
    procedure mostrarTodosFuncionarios;
    procedure mostraFuncionario(Retorno: TFuncionarioModel; pCodigo: Integer);
    procedure inserirFuncionario(Funcionario: TFuncionarioModel);
    procedure alterarFuncionario(Funcionario: TFuncionarioModel);
    procedure excluiFuncionario(pCodigo: Integer);
  end;

implementation

{ TFuncionarioDAO }

procedure TFuncionarioDAO.alterarFuncionario(Funcionario: TFuncionarioModel);
begin
  with DataModule1.FDQuery2 do
  Begin
    Close;
    SQL.Clear;
    SQL.Text := ' Update funcionarios  '               +#13#10+
                ' set nome = :nome, '                  +#13#10+
                   ' salario = :salario, '             +#13#10+
                   ' dt_nascimento = :dt_nascimento, ' +#13#10+
                   ' cod_funcao = :cod_funcao '        +#13#10+
                ' where codigo = :codigo ';

    ParamByName('codigo').AsInteger       := Funcionario.codigoFuncionario;
    ParamByName('nome').AsString          := Funcionario.NomeFuncionario;
    ParamByName('salario').AsFloat        := Funcionario.SalarioFuncionario;
    ParamByName('dt_nascimento').AsDate   := Funcionario.DT_NascimentoFuncionario;
    ParamByName('cod_funcao').AsInteger   := Funcionario.Cod_FuncaoFuncionario;

    try
      ExecSQL;
      ShowMessage('Altera��o de Funcionarios realizado com sucesso');
    except
      ShowMessage('Falha na altera��o de Funcionarios');
    end;
  End;
end;

procedure TFuncionarioDAO.excluiFuncionario(pCodigo: Integer);
begin
  with DataModule1.FDQuery2 do
  Begin
    Close;
    SQL.Clear;
    SQL.Text := 'Delete funcionarios where codigo = :codigo  ';

    ParamByName('codigo').AsInteger := pCodigo;

    try
      ExecSQL;
      ShowMessage('Exclus�o de Funcionario realizado com sucesso');
    except
      ShowMessage('Falha na exclus�o de Funcionarios');
    end;
  End;
end;

procedure TFuncionarioDAO.inserirFuncionario(Funcionario: TFuncionarioModel);
begin
  with DataModule1.FDQuery2 do
  Begin
    Close;
    SQL.Clear;
    SQL.Text := 'insert into funcionarios (codigo, nome, salario, dt_nascimento, cod_funcao)  ' +#13#10+
                '       values (:codigo, :nome, :salario, :dt_nascimento, :cod_funcao) ';

    ParamByName('codigo').AsInteger       := Funcionario.codigoFuncionario;
    ParamByName('nome').AsString          := Funcionario.NomeFuncionario;
    ParamByName('salario').AsFloat        := Funcionario.SalarioFuncionario;
    ParamByName('dt_nascimento').AsDate   := Funcionario.DT_NascimentoFuncionario;
    ParamByName('cod_funcao').AsInteger   := Funcionario.Cod_FuncaoFuncionario;

    try
      ExecSQL;
      ShowMessage('Cadastro de Funcionarios realizado com sucesso');
    except
      ShowMessage('Falha no Cadastro de Funcionarios');
    end;

  End;
end;

procedure TFuncionarioDAO.mostraFuncionario(Retorno: TFuncionarioModel; pCodigo: Integer);
begin

  with DataModule1.FDQuery2 do
  Begin

    Close;
    SQL.Clear;
    SQL.Text := ' Select funcionarios.codigo, funcionarios.nome, funcionarios.salario, ' +#13#10+
                       ' funcionarios.dt_nascimento, funcoes.codigo as cod_funcoes ' +#13#10+
                ' from funcionarios ' +#13#10+
                '  inner join funcoes  on (funcoes.codigo = funcionarios.cod_funcao) ' +#13#10+
                ' where funcionarios.codigo = :codigo ';

    ParamByName('codigo').AsInteger := pCodigo;

    try
      Open;
      Retorno.codigoFuncionario        := FieldByName('codigo').AsInteger;
      Retorno.NomeFuncionario          := FieldByName('nome').AsString;
      Retorno.SalarioFuncionario       := FieldByName('salario').AsFloat;
      Retorno.DT_NascimentoFuncionario := FieldByName('dt_nascimento').AsDateTime;
      Retorno.Cod_FuncaoFuncionario    := FieldByName('cod_funcoes').AsInteger;
    Except
      ShowMessage('Falha na pesquisa de Fun��o');
    end;

  End;

end;

procedure TFuncionarioDAO.mostrarTodosFuncionarios;
begin
  with DataModule1.FDQuery2 do
  Begin
    Close;
    SQL.Clear;
    SQL.Text := ' Select fn.codigo, fn.nome, fn.salario, fn.dt_nascimento, fc.descricao as funcao ' +#13#10+
                ' from funcionarios fn ' +#13#10+
                '   inner join funcoes fc on (fc.codigo = fn.cod_funcao) ' +#13#10+
                ' order by 1' ;
    Open;
  End;
end;

end.