inherited frmCadastroFuncoes: TfrmCadastroFuncoes
  Caption = 'Cadastro de Func'#231#245'es'
  ClientHeight = 322
  ClientWidth = 633
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 649
  ExplicitHeight = 361
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 18
    Top = 26
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lblDescricaoFuncoes: TLabel
    Left = 18
    Top = 53
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object edtCodigoFuncoes: TEdit
    Left = 82
    Top = 18
    Width = 31
    Height = 21
    MaxLength = 5
    TabOrder = 0
    OnChange = edtCodigoFuncoesChange
  end
  object edtDescricaoFuncao: TEdit
    Left = 82
    Top = 45
    Width = 543
    Height = 21
    TabOrder = 1
  end
  object btnCadastrar: TButton
    Left = 16
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 2
    OnClick = btnCadastrarClick
  end
  object Button1: TButton
    Left = 335
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 3
    OnClick = Button1Click
  end
  object btnAlterar: TButton
    Left = 96
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 4
    OnClick = btnAlterarClick
  end
  object btnExcluir: TButton
    Left = 177
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = btnExcluirClick
  end
  object btnMostrarFuncoes: TButton
    Left = 258
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Mostrar'
    TabOrder = 6
    OnClick = btnMostrarFuncoesClick
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 119
    Width = 609
    Height = 194
    DataSource = DataModule1.DataSource1
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end