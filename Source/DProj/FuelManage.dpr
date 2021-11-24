program FuelManage;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in '..\Principal\UPrincipal.pas' {frmPrincipal},
  UCadPadrao in '..\CadPadrao\UCadPadrao.pas' {frmCadPadrao},
  UMsgDlg in '..\msg\UMsgDlg.pas' {FrmmsgDlg},
  UUsuarios in '..\Usuarios\UUsuarios.pas' {frmUsuarios},
  UdmDB in '..\dmDB\UdmDB.pas' {dmdb: TDataModule},
  UAuxMarcas in '..\Auxiliares\AuxMarcas\UAuxMarcas.pas' {frmCadAuxMarcas},
  UAuxGrupo in '..\Auxiliares\GrupoMaquinas\UAuxGrupo.pas' {frmAuxGrupo},
  UAuxSubGrupo in '..\Auxiliares\AuxTipoMaquina\UAuxSubGrupo.pas' {frmAuxSubgrupo},
  UOperadorMaquinas in '..\Auxiliares\AuxOperadorMaquinas\UOperadorMaquinas.pas' {frmOperadorMaquinas},
  uFormat in '..\Util\uFormat.pas',
  UAuxAtividadeAbastecimento in '..\Auxiliares\AuxAtividades\UAuxAtividadeAbastecimento.pas' {frmAuxAtividadeAbastecimento},
  UProdutos in '..\Produtos\UProdutos.pas' {frmCadProdutos},
  UCadMaquina in '..\Maquinas\UCadMaquina.pas' {frmCadMaquinaVeiculo},
  UCentrodeCusto in '..\Auxiliares\AuxCentroCusto\UCentrodeCusto.pas' {frmCentroCusto},
  UdmReport in '..\dmReport\UdmReport.pas' {dmReport: TDataModule},
  UAbastecimento in '..\Abastecimento\UAbastecimento.pas' {frmAbastecimento},
  UEntradaEstoque in '..\Estoque\Entrada\UEntradaEstoque.pas' {frmCadEntradaEstoque},
  UFornecedor in '..\Fornecedores\UFornecedor.pas' {frmCadFornecedor},
  USaidaEstoque in '..\Estoque\Saida\USaidaEstoque.pas' {frmSaidaEstoque},
  UMovEntreLocalEstoque in '..\Estoque\MovEntreLocal\UMovEntreLocalEstoque.pas' {frmMovLocalEstoque},
  UStartBomba in '..\StartBomba\UStartBomba.pas' {frmSatrtDiario},
  ULocalEstoque in '..\Auxiliares\AuxLocalEstoque\ULocalEstoque.pas' {frmAuxLocalEstoque};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdmdb, dmdb);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmReport, dmReport);
  Application.Run;
end.
