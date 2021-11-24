object dmdb: Tdmdb
  OldCreateOrder = False
  Height = 427
  Width = 598
  object FDConPG: TFDConnection
    Params.Strings = (
      'Database=FuelManager'
      'Server=127.0.0.1'
      'User_Name=postgres'
      'Password=Dev#110485'
      'Pooled='
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 21
    Top = 16
  end
  object PgDriverLink: TFDPhysPgDriverLink
    VendorLib = 'D:\Projetos2021\FuelManageDesktop\Deploy\libpq.dll'
    Left = 21
    Top = 64
  end
  object vQry: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    Left = 88
    Top = 16
  end
  object TUsuario: TFDQuery
    CachedUpdates = True
    OnReconcileError = TUsuarioReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' U.*,'
      ' case '
      '  when tipo=0 then '#39'PADRAO'#39
      '  when tipo=1 then '#39'ALMOXERIFADO'#39
      ' end tipoSTR'
      'from usuario U'
      'where Status>-1'
      ''
      ''
      ''
      '')
    Left = 96
    Top = 72
    object TUsuarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TUsuariostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TUsuariodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TUsuarioidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TUsuariodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TUsuarioidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TUsuarionome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TUsuarioemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object TUsuariocelular: TWideStringField
      FieldName = 'celular'
      Origin = 'celular'
    end
    object TUsuariousuario: TWideStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 25
    end
    object TUsuariosenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 50
    end
    object TUsuariotipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TUsuariosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TUsuariotipostr: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tipostr'
      Origin = 'tipostr'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TUsuarioiderp: TIntegerField
      FieldName = 'iderp'
      Origin = 'iderp'
    end
  end
  object TAuxMarca: TFDQuery
    CachedUpdates = True
    OnReconcileError = TAuxMarcaReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select * from auxmarcas'
      'WHERE STATUS>-1')
    Left = 96
    Top = 128
    object TAuxMarcaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxMarcastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxMarcadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxMarcaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxMarcadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxMarcaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxMarcanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxMarcasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TAuxGrupoMaquinas: TFDQuery
    CachedUpdates = True
    OnReconcileError = TAuxGrupoMaquinasReconcileError
    Connection = FDConPG
    SQL.Strings = (
      ''
      'select * from auxgrupomaquinaveiculos '
      'where status >-1')
    Left = 88
    Top = 184
    object TAuxGrupoMaquinasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxGrupoMaquinasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxGrupoMaquinasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxGrupoMaquinasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxGrupoMaquinasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxGrupoMaquinasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxGrupoMaquinasnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxGrupoMaquinassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TAuxSubGrupo: TFDQuery
    CachedUpdates = True
    OnReconcileError = TAuxSubGrupoReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'SELECT a.*,'
      ' case '
      '   when tipomedicao=0 then '#39'HORIMETRO'#39
      '   when tipomedicao=1 then '#39'KM'#39
      '   when tipomedicao=2 then '#39'AMBOS'#39
      ' end TipoMedicaoStr'
      'FROM auxsubgrupoveiculos a'
      'WHERE STATUS>-1')
    Left = 88
    Top = 248
    object TAuxSubGrupoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxSubGrupostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxSubGrupodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxSubGrupoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxSubGrupodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxSubGrupoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxSubGruponome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAuxSubGruposyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAuxSubGrupotipomedicao: TIntegerField
      FieldName = 'tipomedicao'
      Origin = 'tipomedicao'
    end
    object TAuxSubGrupotipomedicaostr: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tipomedicaostr'
      Origin = 'tipomedicaostr'
      ReadOnly = True
      BlobType = ftWideMemo
    end
  end
  object TOperadorMaquina: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select * from operadormaquinas '
      'where status=1')
    Left = 264
    Top = 184
    object TOperadorMaquinaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TOperadorMaquinastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TOperadorMaquinadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TOperadorMaquinaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TOperadorMaquinadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TOperadorMaquinaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TOperadorMaquinanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TOperadorMaquinarg: TWideStringField
      FieldName = 'rg'
      Origin = 'rg'
      Size = 10
    end
    object TOperadorMaquinacpf: TWideStringField
      FieldName = 'cpf'
      Origin = 'cpf'
    end
    object TOperadorMaquinacnh: TWideStringField
      FieldName = 'cnh'
      Origin = 'cnh'
    end
    object TOperadorMaquinacelular: TWideStringField
      FieldName = 'celular'
      Origin = 'celular'
    end
    object TOperadorMaquinasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TOperadorMaquinasyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object Tauxatividadeabastecimento: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'SELECT * FROM auxatividadeabastecimento '
      'WHERE STATUS=1')
    Left = 264
    Top = 240
    object Tauxatividadeabastecimentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Tauxatividadeabastecimentostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object Tauxatividadeabastecimentodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object Tauxatividadeabastecimentoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object Tauxatividadeabastecimentodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object Tauxatividadeabastecimentoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object Tauxatividadeabastecimentonome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object Tauxatividadeabastecimentosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
  end
  object TProdutos: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'SELECT * FROM PRODUTOS'
      'WHERE STATUS=1')
    Left = 264
    Top = 296
    object TProdutosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TProdutosstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TProdutosdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TProdutosidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TProdutosdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TProdutosidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TProdutosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TProdutostipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TProdutosunidademedida: TWideStringField
      FieldName = 'unidademedida'
      Origin = 'unidademedida'
      Size = 10
    end
    object TProdutosestoqueminimo: TBCDField
      FieldName = 'estoqueminimo'
      Origin = 'estoqueminimo'
      Precision = 15
      Size = 2
    end
    object TProdutoscodigobarras: TWideStringField
      FieldName = 'codigobarras'
      Origin = 'codigobarras'
    end
    object TProdutosidmarca: TIntegerField
      FieldName = 'idmarca'
      Origin = 'idmarca'
    end
    object TProdutoscodigofabricante: TWideStringField
      FieldName = 'codigofabricante'
      Origin = 'codigofabricante'
      Size = 30
    end
    object TProdutossyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TProdutoscustomedio: TBCDField
      FieldName = 'customedio'
      Origin = 'customedio'
      Precision = 15
    end
    object TProdutossaldoatual: TBCDField
      FieldName = 'saldoatual'
      Origin = 'saldoatual'
      Precision = 15
    end
    object TProdutosiderp: TIntegerField
      FieldName = 'iderp'
      Origin = 'iderp'
    end
  end
  object TMaquinas: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' m.*,'
      ' a.nome Grupo,'
      ' sb.nome SubGrupo,'
      ' a2.nome Marca,'
      ' case '
      '  when m.tipomedicao=0 then '#39'HOR'#205'METRO'#39
      '  when m.tipomedicao=1 then '#39'KM'#39
      '  when m.tipomedicao=2 then '#39'AMBOS'#39
      ' end tipomedicaoStr'
      'from maquinaveiculo m'
      'join auxgrupomaquinaveiculos a on a.id=m.idgrupo'
      'join auxsubgrupoveiculos sb  on sb.id=m.idsubgrupo '
      'join auxmarcas a2 on a2.id=m.idmarca '
      'order by prefixo')
    Left = 264
    Top = 352
    object TMaquinasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TMaquinasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TMaquinasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TMaquinasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TMaquinasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TMaquinasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TMaquinasidmarca: TIntegerField
      FieldName = 'idmarca'
      Origin = 'idmarca'
    end
    object TMaquinasmodelo: TWideStringField
      FieldName = 'modelo'
      Origin = 'modelo'
      Size = 50
    end
    object TMaquinasplaca: TWideStringField
      FieldName = 'placa'
      Origin = 'placa'
    end
    object TMaquinasano: TIntegerField
      FieldName = 'ano'
      Origin = 'ano'
    end
    object TMaquinaschassi: TWideStringField
      FieldName = 'chassi'
      Origin = 'chassi'
      Size = 30
    end
    object TMaquinasidcombustivel: TIntegerField
      FieldName = 'idcombustivel'
      Origin = 'idcombustivel'
    end
    object TMaquinasimg: TBlobField
      FieldName = 'img'
      Origin = 'img'
    end
    object TMaquinasprefixo: TWideStringField
      FieldName = 'prefixo'
      Origin = 'prefixo'
    end
    object TMaquinassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TMaquinassyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TMaquinasultimoabastecimento: TDateField
      FieldName = 'ultimoabastecimento'
      Origin = 'ultimoabastecimento'
    end
    object TMaquinashorimetroultimarev: TBCDField
      FieldName = 'horimetroultimarev'
      Origin = 'horimetroultimarev'
      Precision = 15
      Size = 3
    end
    object TMaquinashorimetroatual: TBCDField
      FieldName = 'horimetroatual'
      Origin = 'horimetroatual'
      Precision = 15
      Size = 3
    end
    object TMaquinasqrcode: TWideStringField
      FieldName = 'qrcode'
      Origin = 'qrcode'
    end
    object TMaquinasidsubgrupo: TIntegerField
      FieldName = 'idsubgrupo'
      Origin = 'idsubgrupo'
    end
    object TMaquinasidgrupo: TIntegerField
      FieldName = 'idgrupo'
      Origin = 'idgrupo'
    end
    object TMaquinaskmatual: TBCDField
      FieldName = 'kmatual'
      Origin = 'kmatual'
      Precision = 15
      Size = 3
    end
    object TMaquinasgrupo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grupo'
      Origin = 'grupo'
      Size = 50
    end
    object TMaquinassubgrupo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'subgrupo'
      Origin = 'subgrupo'
      Size = 50
    end
    object TMaquinasmarca: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'marca'
      Origin = 'marca'
      Size = 50
    end
    object TMaquinastipomedicao: TIntegerField
      FieldName = 'tipomedicao'
      Origin = 'tipomedicao'
    end
    object TMaquinastipomedicaostr: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tipomedicaostr'
      Origin = 'tipomedicaostr'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TMaquinasiderp: TIntegerField
      FieldName = 'iderp'
      Origin = 'iderp'
    end
  end
  object TCentroCusto: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select c.*,'
      'case'
      ' when status=1 then '#39'ATIVO'#39
      ' when status=0 then '#39'INATIVO'#39
      'end statusStr '
      'from centrocusto c'
      'where status>-1')
    Left = 480
    Top = 232
    object TCentroCustoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TCentroCustostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TCentroCustodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TCentroCustoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TCentroCustodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TCentroCustoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TCentroCustonome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TCentroCustosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TCentroCustostatusstr: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'statusstr'
      Origin = 'statusstr'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TCentroCustoiderp: TIntegerField
      FieldName = 'iderp'
      Origin = 'iderp'
    end
  end
  object TAbastecimento: TFDQuery
    CachedUpdates = True
    OnReconcileError = TAbastecimentoReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' a.*,'
      ' l.nome localdeEstoque,'
      ' m.prefixo,'
      ' p.nome produto,'
      ' o.nome operador,'
      ' a2.nome Atividade,'
      ' c.nome centrocustonome '
      'from abastecimento a '
      'join centrocusto c  on a.idcentrocusto=c.id '
      'join localestoque l on a.idlocalestoque=l.id'
      'join maquinaveiculo m on a.idmaquina=m.id'
      'join produtos p on a.combustivel = p.id '
      'join operadormaquinas o on a.idoperador=o.id '
      'join auxatividadeabastecimento a2 on a2.id=a.idatividade ')
    Left = 480
    Top = 288
    object TAbastecimentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAbastecimentostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAbastecimentodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAbastecimentoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAbastecimentodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAbastecimentoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAbastecimentoidlocalestoque: TIntegerField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
    end
    object TAbastecimentoidmaquina: TIntegerField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
    end
    object TAbastecimentoidoperador: TIntegerField
      FieldName = 'idoperador'
      Origin = 'idoperador'
    end
    object TAbastecimentovolumelt: TBCDField
      FieldName = 'volumelt'
      Origin = 'volumelt'
      Precision = 15
      Size = 3
    end
    object TAbastecimentocombustivel: TIntegerField
      FieldName = 'combustivel'
      Origin = 'combustivel'
    end
    object TAbastecimentodataabastecimento: TDateField
      FieldName = 'dataabastecimento'
      Origin = 'dataabastecimento'
    end
    object TAbastecimentohora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TAbastecimentosyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAbastecimentohorimetro: TBCDField
      FieldName = 'horimetro'
      Origin = 'horimetro'
      Precision = 15
      Size = 3
    end
    object TAbastecimentoidatividade: TIntegerField
      FieldName = 'idatividade'
      Origin = 'idatividade'
    end
    object TAbastecimentoobs: TWideStringField
      FieldName = 'obs'
      Origin = 'obs'
      Size = 100
    end
    object TAbastecimentoimg: TBlobField
      FieldName = 'img'
      Origin = 'img'
    end
    object TAbastecimentoimg2: TBlobField
      FieldName = 'img2'
      Origin = 'img2'
    end
    object TAbastecimentoimg3: TBlobField
      FieldName = 'img3'
      Origin = 'img3'
    end
    object TAbastecimentoimg4: TBlobField
      FieldName = 'img4'
      Origin = 'img4'
    end
    object TAbastecimentoimg5: TBlobField
      FieldName = 'img5'
      Origin = 'img5'
    end
    object TAbastecimentovalorlitro: TBCDField
      FieldName = 'valorlitro'
      Origin = 'valorlitro'
      Precision = 15
      Size = 3
    end
    object TAbastecimentoexterno: TIntegerField
      FieldName = 'externo'
      Origin = 'externo'
    end
    object TAbastecimentoidcentrocusto: TIntegerField
      FieldName = 'idcentrocusto'
      Origin = 'idcentrocusto'
    end
    object TAbastecimentokmatual: TBCDField
      FieldName = 'kmatual'
      Origin = 'kmatual'
      Precision = 15
      Size = 3
    end
    object TAbastecimentolocaldeestoque: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'localdeestoque'
      Origin = 'localdeestoque'
      Size = 50
    end
    object TAbastecimentoprefixo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'prefixo'
      Origin = 'prefixo'
    end
    object TAbastecimentoproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 50
    end
    object TAbastecimentooperador: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'operador'
      Origin = 'operador'
      Size = 50
    end
    object TAbastecimentoatividade: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'atividade'
      Origin = 'atividade'
      Size = 50
    end
    object TAbastecimentocentrocustonome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'centrocustonome'
      Origin = 'centrocustonome'
      Size = 50
    end
    object TAbastecimentolatitude: TFMTBCDField
      FieldName = 'latitude'
      Origin = 'latitude'
      Precision = 9
      Size = 6
    end
    object TAbastecimentolongitude: TFMTBCDField
      FieldName = 'longitude'
      Origin = 'longitude'
      Precision = 9
      Size = 6
    end
  end
  object TAbastecimentoOutros: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'idabastecimento'
    MasterFields = 'id'
    DetailFields = 'idabastecimento'
    Connection = FDConPG
    SQL.Strings = (
      'select a.*,p.nome produto from abastecimentooutros a '
      'join produtos p on a. idproduto=p.id '
      'where a.status =1 and idabastecimento=1')
    Left = 480
    Top = 352
    object TAbastecimentoOutrosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAbastecimentoOutrosstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAbastecimentoOutrosdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAbastecimentoOutrosidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAbastecimentoOutrosdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAbastecimentoOutrosidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAbastecimentoOutrosidabastecimento: TIntegerField
      FieldName = 'idabastecimento'
      Origin = 'idabastecimento'
    end
    object TAbastecimentoOutrosidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TAbastecimentoOutrosquantidade: TBCDField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Precision = 15
      Size = 3
    end
    object TAbastecimentoOutrossyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TAbastecimentoOutrossyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TAbastecimentoOutrosproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 50
    end
  end
  object TEstoqueEntrada: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' a.*,'
      ' b.nome Fornecedor, '
      ' d.nome CentroCusto'
      'from nfentrada a'
      'join fornecedor b on a.idFornecedor=b.id'
      'join centrocusto d on d.id=a.idcentrocusto'
      'where a.status=1')
    Left = 478
    Top = 96
    object TEstoqueEntradaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TEstoqueEntradastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TEstoqueEntradadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TEstoqueEntradaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TEstoqueEntradadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TEstoqueEntradaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TEstoqueEntradaidfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      Origin = 'idfornecedor'
    end
    object TEstoqueEntradaidpedido: TIntegerField
      FieldName = 'idpedido'
      Origin = 'idpedido'
    end
    object TEstoqueEntradanumeronf: TIntegerField
      FieldName = 'numeronf'
      Origin = 'numeronf'
    end
    object TEstoqueEntradadataemissao: TDateField
      FieldName = 'dataemissao'
      Origin = 'dataemissao'
    end
    object TEstoqueEntradadataentradaestoque: TDateField
      FieldName = 'dataentradaestoque'
      Origin = 'dataentradaestoque'
    end
    object TEstoqueEntradavalortotalnf: TFMTBCDField
      FieldName = 'valortotalnf'
      Origin = 'valortotalnf'
      Precision = 18
      Size = 2
    end
    object TEstoqueEntradaidcentrocusto: TIntegerField
      FieldName = 'idcentrocusto'
      Origin = 'idcentrocusto'
    end
    object TEstoqueEntradasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TEstoqueEntradatipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TEstoqueEntradafornecedor: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'fornecedor'
      Origin = 'fornecedor'
      Size = 100
    end
    object TEstoqueEntradacentrocusto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'centrocusto'
      Origin = 'centrocusto'
      Size = 50
    end
  end
  object TEstoqueSaida: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' a.*,'
      ' c.nome localEstoque,'
      ' d.nome CentroCusto,'
      ' e.nome Produto,'
      ' e.codigofabricante ProdutoCodFabricante,'
      ' case'
      '   when tipo_baixa=0 then '#39'Baixa Estoque'#39
      '   when tipo_baixa=1 then '#39'Acerto Estoque'#39' '
      ' end TipoStr,'
      'a.valorsaida/a.qtditens valoTotal'
      'from estoquesaida a '
      'join localestoque c on c.id=a.idlocalestoque'
      'join centrocusto d on d.id=a.idcentrocusto'
      'join produtos e on e.id=a.idproduto'
      'where a.status=1')
    Left = 478
    Top = 160
    object TEstoqueSaidaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object TEstoqueSaidastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TEstoqueSaidadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TEstoqueSaidaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TEstoqueSaidadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TEstoqueSaidaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TEstoqueSaidaidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TEstoqueSaidadatasaidaestoque: TDateField
      FieldName = 'datasaidaestoque'
      Origin = 'datasaidaestoque'
    end
    object TEstoqueSaidaqtditens: TFMTBCDField
      FieldName = 'qtditens'
      Origin = 'qtditens'
      Precision = 18
      Size = 2
    end
    object TEstoqueSaidaunidademedida: TWideStringField
      FieldName = 'unidademedida'
      Origin = 'unidademedida'
    end
    object TEstoqueSaidaidlocalestoque: TIntegerField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
    end
    object TEstoqueSaidaidcentrocusto: TIntegerField
      FieldName = 'idcentrocusto'
      Origin = 'idcentrocusto'
    end
    object TEstoqueSaidasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TEstoqueSaidatipo_baixa: TIntegerField
      FieldName = 'tipo_baixa'
      Origin = 'tipo_baixa'
    end
    object TEstoqueSaidaidresponsavel: TIntegerField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
    end
    object TEstoqueSaidavalorsaida: TBCDField
      FieldName = 'valorsaida'
      Origin = 'valorsaida'
      Precision = 15
      Size = 3
    end
    object TEstoqueSaidaidabastecimento: TIntegerField
      FieldName = 'idabastecimento'
      Origin = 'idabastecimento'
    end
    object TEstoqueSaidaidreceiturario: TIntegerField
      FieldName = 'idreceiturario'
      Origin = 'idreceiturario'
    end
    object TEstoqueSaidaidlocaldestino: TIntegerField
      FieldName = 'idlocaldestino'
      Origin = 'idlocaldestino'
    end
    object TEstoqueSaidalocalestoque: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'localestoque'
      Origin = 'localestoque'
      Size = 50
    end
    object TEstoqueSaidacentrocusto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'centrocusto'
      Origin = 'centrocusto'
      Size = 50
    end
    object TEstoqueSaidaproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 50
    end
    object TEstoqueSaidaprodutocodfabricante: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produtocodfabricante'
      Origin = 'produtocodfabricante'
      Size = 30
    end
    object TEstoqueSaidatipostr: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tipostr'
      Origin = 'tipostr'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object TEstoqueSaidavalototal: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valototal'
      Origin = 'valototal'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object TnotaFiscalIntem: TFDQuery
    CachedUpdates = True
    OnReconcileError = TnotaFiscalIntemReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' ROW_NUMBER () OVER (ORDER BY a.id)Item,'
      ' a.*,'
      ' b.id ProdutoId,'
      ' b.unidademedida ProdutoUnidade,'
      ' b.nome ProdutoNome,'
      ' b.codigofabricante ProdutoFabricante,'
      ' c.nome LocalEstoque,'
      ' a.valortotalnf/a.qtditens valoruni'
      'from notafiscalitems a'
      'join produtos b on a.idproduto=b.id'
      'join localestoque c on c.id=a.idlocalestoque'
      '')
    Left = 478
    Top = 48
    object TnotaFiscalIntemitem: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'item'
      Origin = 'item'
      ReadOnly = True
    end
    object TnotaFiscalIntemid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TnotaFiscalIntemstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TnotaFiscalIntemdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TnotaFiscalIntemidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TnotaFiscalIntemdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TnotaFiscalIntemidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TnotaFiscalIntemidnota: TIntegerField
      FieldName = 'idnota'
      Origin = 'idnota'
    end
    object TnotaFiscalIntemidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TnotaFiscalIntemvalortotalnf: TFMTBCDField
      FieldName = 'valortotalnf'
      Origin = 'valortotalnf'
      Precision = 18
      Size = 2
    end
    object TnotaFiscalIntemqtditens: TFMTBCDField
      FieldName = 'qtditens'
      Origin = 'qtditens'
      Precision = 18
      Size = 2
    end
    object TnotaFiscalIntemunidademedida: TWideStringField
      FieldName = 'unidademedida'
      Origin = 'unidademedida'
    end
    object TnotaFiscalIntempesoembalagem: TFMTBCDField
      FieldName = 'pesoembalagem'
      Origin = 'pesoembalagem'
      Precision = 18
      Size = 2
    end
    object TnotaFiscalIntemidlocalestoque: TIntegerField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
    end
    object TnotaFiscalIntemsyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TnotaFiscalIntemprodutoid: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'produtoid'
      Origin = 'produtoid'
    end
    object TnotaFiscalIntemprodutounidade: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produtounidade'
      Origin = 'produtounidade'
      Size = 10
    end
    object TnotaFiscalIntemprodutonome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produtonome'
      Origin = 'produtonome'
      Size = 50
    end
    object TnotaFiscalIntemprodutofabricante: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produtofabricante'
      Origin = 'produtofabricante'
      Size = 30
    end
    object TnotaFiscalIntemlocalestoque: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'localestoque'
      Origin = 'localestoque'
      Size = 50
    end
    object TnotaFiscalIntemvaloruni: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valoruni'
      Origin = 'valoruni'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
  object TLocalEstoque: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' a.*,'
      ' b.nome centrocusto,'
      ' p.nome Combustivel'
      'from LocalEstoque a'
      'join centrocusto b on a.idcentrocusto=b.id'
      'join produtos p on p.id=a.idcombustivel '
      'where a.status=1')
    Left = 270
    Top = 112
    object TLocalEstoqueid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TLocalEstoquestatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TLocalEstoquedatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TLocalEstoqueidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TLocalEstoquedataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TLocalEstoqueidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TLocalEstoquenome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TLocalEstoquecapacidade: TBCDField
      FieldName = 'capacidade'
      Origin = 'capacidade'
      Precision = 15
      Size = 3
    end
    object TLocalEstoquesyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TLocalEstoqueidcentrocusto: TIntegerField
      FieldName = 'idcentrocusto'
      Origin = 'idcentrocusto'
    end
    object TLocalEstoquecentrocusto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'centrocusto'
      Origin = 'centrocusto'
      Size = 50
    end
    object TLocalEstoqueidcombustivel: TIntegerField
      FieldName = 'idcombustivel'
      Origin = 'idcombustivel'
    end
    object TLocalEstoqueiderp: TIntegerField
      FieldName = 'iderp'
      Origin = 'iderp'
    end
    object TLocalEstoquecombustivel: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'combustivel'
      Origin = 'combustivel'
      Size = 50
    end
  end
  object TFornecedores: TFDQuery
    CachedUpdates = True
    OnReconcileError = TFornecedoresReconcileError
    Connection = FDConPG
    SQL.Strings = (
      'select * from fornecedor'
      'where status=1')
    Left = 274
    Top = 43
    object TFornecedoresid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TFornecedoresstatus: TIntegerField
      FieldName = 'status'
    end
    object TFornecedoresdatareg: TSQLTimeStampField
      FieldName = 'datareg'
    end
    object TFornecedoresidusuario: TIntegerField
      FieldName = 'idusuario'
    end
    object TFornecedoresdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
    end
    object TFornecedoresidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
    end
    object TFornecedoresnome: TWideStringField
      FieldName = 'nome'
      Size = 100
    end
    object TFornecedorescidade: TWideStringField
      FieldName = 'cidade'
      Size = 100
    end
    object TFornecedoresuf: TWideStringField
      FieldName = 'uf'
      FixedChar = True
      Size = 2
    end
    object TFornecedorescpf_cnpj: TWideStringField
      FieldName = 'cpf_cnpj'
      Size = 30
    end
    object TFornecedorestelefone_fixo: TWideStringField
      FieldName = 'telefone_fixo'
    end
    object TFornecedorescelular: TWideStringField
      FieldName = 'celular'
    end
    object TFornecedoresemail: TWideStringField
      FieldName = 'email'
      Size = 100
    end
    object TFornecedorescontatopessoa: TWideStringField
      FieldName = 'contatopessoa'
      Size = 100
    end
    object TFornecedoressenha: TWideStringField
      FieldName = 'senha'
    end
    object TFornecedoressyncaws: TIntegerField
      FieldName = 'syncaws'
    end
    object TFornecedoresrazaosocial: TWideStringField
      FieldName = 'razaosocial'
      Size = 100
    end
    object TFornecedoresinscricaoestadual: TWideStringField
      FieldName = 'inscricaoestadual'
    end
  end
  object TMovLocalEstoque: TFDQuery
    CachedUpdates = True
    Connection = FDConPG
    SQL.Strings = (
      'select '
      ' a.*,'
      ' co.nome CentroCustoOrigem,'
      ' o.nome LocalOrigem,'
      ' cd.nome CentroCustoDestino,'
      ' d.nome LocalDestino,'
      ' c.nome Produto '
      'from tranferenciaLocalestoque A '
      'join localestoque o on o.id=a.idlocalestoqueorigem'
      'join centrocusto co on co.id=o.idcentrocusto '
      'join localestoque d on d.id=a.idlocalestoquedetino'
      'join centrocusto cd on cd.id=d.idcentrocusto '
      'join produtos c on a.idproduto=c.id'
      'where a.status=1')
    Left = 366
    Top = 168
    object TMovLocalEstoqueid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TMovLocalEstoquestatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TMovLocalEstoquedatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TMovLocalEstoqueidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TMovLocalEstoquedataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TMovLocalEstoqueidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TMovLocalEstoqueidlocalestoqueorigem: TIntegerField
      FieldName = 'idlocalestoqueorigem'
      Origin = 'idlocalestoqueorigem'
    end
    object TMovLocalEstoqueidlocalestoquedetino: TIntegerField
      FieldName = 'idlocalestoquedetino'
      Origin = 'idlocalestoquedetino'
    end
    object TMovLocalEstoqueidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object TMovLocalEstoqueqtde: TBCDField
      FieldName = 'qtde'
      Origin = 'qtde'
      Precision = 15
      Size = 3
    end
    object TMovLocalEstoquedatamov: TDateField
      FieldName = 'datamov'
      Origin = 'datamov'
    end
    object TMovLocalEstoquehora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TMovLocalEstoquesyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TMovLocalEstoquelocalorigem: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'localorigem'
      Origin = 'localorigem'
      Size = 50
    end
    object TMovLocalEstoquelocaldestino: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'localdestino'
      Origin = 'localdestino'
      Size = 50
    end
    object TMovLocalEstoqueproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 50
    end
    object TMovLocalEstoquecentrocustoorigem: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'centrocustoorigem'
      Origin = 'centrocustoorigem'
      Size = 50
    end
    object TMovLocalEstoquecentrocustodestino: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'centrocustodestino'
      Origin = 'centrocustodestino'
      Size = 50
    end
  end
  object TStartBomba: TFDQuery
    Connection = FDConPG
    SQL.Strings = (
      'select s.*,l.nome LocalEstoque,'
      'p.nome CombustivelNome,'
      'c.nome Centrocusto,'
      's.volumelitrosini+(s.volumelitrosfim-s.volumelitrosini) saldo,'
      's.volumelitrosfim-s.volumelitrosini volumeutilizado '
      'from startbomba s '
      'join localestoque l on l.id=s.idlocalestoque '
      'join produtos p on p.id =s.combustivel '
      'join centrocusto c on c.id=l.idcentrocusto')
    Left = 384
    Top = 240
    object TStartBombaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TStartBombastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TStartBombadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TStartBombaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TStartBombadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TStartBombaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TStartBombaidlocalestoque: TIntegerField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
    end
    object TStartBombaidcentrocusto: TIntegerField
      FieldName = 'idcentrocusto'
      Origin = 'idcentrocusto'
    end
    object TStartBombacombustivel: TIntegerField
      FieldName = 'combustivel'
      Origin = 'combustivel'
    end
    object TStartBombadataastart: TDateField
      FieldName = 'dataastart'
      Origin = 'dataastart'
    end
    object TStartBombahorastart: TTimeField
      FieldName = 'horastart'
      Origin = 'horastart'
    end
    object TStartBombadataaend: TDateField
      FieldName = 'dataaend'
      Origin = 'dataaend'
    end
    object TStartBombahoraend: TTimeField
      FieldName = 'horaend'
      Origin = 'horaend'
    end
    object TStartBombasyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TStartBombavolumelitrosini: TBCDField
      FieldName = 'volumelitrosini'
      Origin = 'volumelitrosini'
      Precision = 15
      Size = 3
    end
    object TStartBombaobs: TWideStringField
      FieldName = 'obs'
      Origin = 'obs'
      Size = 100
    end
    object TStartBombaimgstart: TWideMemoField
      FieldName = 'imgstart'
      Origin = 'imgstart'
      BlobType = ftWideMemo
    end
    object TStartBombaimgend: TWideMemoField
      FieldName = 'imgend'
      Origin = 'imgend'
      BlobType = ftWideMemo
    end
    object TStartBombavolumelitrosfim: TBCDField
      FieldName = 'volumelitrosfim'
      Origin = 'volumelitrosfim'
      Precision = 15
      Size = 3
    end
    object TStartBombalocalestoque: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'localestoque'
      Origin = 'localestoque'
      Size = 50
    end
    object TStartBombacombustivelnome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'combustivelnome'
      Origin = 'combustivelnome'
      Size = 50
    end
    object TStartBombacentrocusto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'centrocusto'
      Origin = 'centrocusto'
      Size = 50
    end
    object TStartBombasaldo: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'saldo'
      Origin = 'saldo'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
    object TStartBombavolumeutilizado: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'volumeutilizado'
      Origin = 'volumeutilizado'
      ReadOnly = True
      Precision = 64
      Size = 0
    end
  end
end
