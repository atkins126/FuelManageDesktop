unit UAbastecimento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListBox,
  FMX.DateTimeCtrls, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope,Winapi.Windows;

type
  TfrmAbastecimento = class(TfrmCadPadrao)
    Label22: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Label7: TLabel;
    edtDataAbastecimento: TDateEdit;
    Label8: TLabel;
    edtHoraAbastecimento: TTimeEdit;
    Maquina: TLabel;
    edtMaquina: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtVolumeLitros: TEdit;
    ClearEditButton2: TClearEditButton;
    Layout9: TLayout;
    ToolBar4: TToolBar;
    Label14: TLabel;
    Label13: TLabel;
    Image10: TImage;
    BindSourceDB2: TBindSourceDB;
    layNewOutros: TLayout;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Label17: TLabel;
    Image13: TImage;
    Rectangle8: TRectangle;
    edtOutroProduto: TEdit;
    SearchEditButton1: TSearchEditButton;
    ClearEditButton3: TClearEditButton;
    Rectangle14: TRectangle;
    edtQuantidade: TEdit;
    edtCentroCusto: TEdit;
    Label15: TLabel;
    edtOperador: TEdit;
    ClearEditButton1: TClearEditButton;
    edtHorimetro: TEdit;
    Label16: TLabel;
    edtAtividade: TEdit;
    ClearEditButton4: TClearEditButton;
    Layout11: TLayout;
    Layout12: TLayout;
    Layout13: TLayout;
    Label19: TLabel;
    edtObs: TEdit;
    btnExcel: TRectangle;
    Label20: TLabel;
    Label21: TLabel;
    Rectangle9: TRectangle;
    Label24: TLabel;
    Image11: TImage;
    Image12: TImage;
    Rectangle5: TRectangle;
    Label23: TLabel;
    edtcombustivel: TEdit;
    ClearEditButton5: TClearEditButton;
    Layout14: TLayout;
    Layout15: TLayout;
    Image14: TImage;
    ClearEditButton6: TClearEditButton;
    Layout16: TLayout;
    btnRepConsumo: TRectangle;
    SaveDialog1: TSaveDialog;
    Label18: TLabel;
    edtKMAtual: TEdit;
    GroupBox1: TGroupBox;
    Label25: TLabel;
    Label27: TLabel;
    edtDataInicio: TDateEdit;
    edtDataFim: TDateEdit;
    Z: TLabel;
    edtCentroCustoF: TEdit;
    ClearEditButton8: TClearEditButton;
    SearchEditButton4: TSearchEditButton;
    edtAtividadeF: TEdit;
    ClearEditButton9: TClearEditButton;
    SearchEditButton5: TSearchEditButton;
    Label26: TLabel;
    cbxBombaF: TComboBox;
    Label28: TLabel;
    edtcombustivelf: TEdit;
    ClearEditButton10: TClearEditButton;
    SearchEditButton7: TSearchEditButton;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    lblTotalLitrosGrid: TLabel;
    layTipoReport: TLayout;
    Rectangle3: TRectangle;
    ToolBar50552: TToolBar;
    Rectangle16: TRectangle;
    Label36: TLabel;
    Image17: TImage;
    Layout10: TLayout;
    Layout20: TLayout;
    btnComFoto: TRectangle;
    btnSemFoto: TRectangle;
    Label32: TLabel;
    Label33: TLabel;
    Image15: TImage;
    Image16: TImage;
    edtLocalEstoque: TEdit;
    ClearEditButton11: TClearEditButton;
    SearchEditButton8: TSearchEditButton;
    chkComAlerta: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure edtVolumeLitrosChangeTracking(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure EditButton5Click(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtVolumeLitrosKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtQuantidadeChangeTracking(Sender: TObject);
    procedure edtQuantidadeKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure btnAdicionarTalhaoClick(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure edtHorimetroKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtHorimetroChangeTracking(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure cbxBombaFChange(Sender: TObject);
    procedure btnBuscaCombustivelClick(Sender: TObject);
    procedure btnBuscaCentroCustoClick(Sender: TObject);
    procedure cbxBombaFClick(Sender: TObject);
    procedure cbxLocalEstoqueClick(Sender: TObject);
    procedure SearchEditButton2Click(Sender: TObject);
    procedure SearchEditButton3Click(Sender: TObject);
    procedure SearchEditButton6Click(Sender: TObject);
    procedure SearchEditButton4Click(Sender: TObject);
    procedure SearchEditButton5Click(Sender: TObject);
    procedure SearchEditButton7Click(Sender: TObject);
    procedure btnBuscarFiltroClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Rectangle9Click(Sender: TObject);
    procedure btnConfirmaPluviClick(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure btnRepConsumoClick(Sender: TObject);
    procedure Image17Click(Sender: TObject);
    procedure btnComFotoClick(Sender: TObject);
    procedure btnSemFotoClick(Sender: TObject);
    procedure btnSemFotoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnSemFotoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnComFotoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnComFotoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure SearchEditButton8Click(Sender: TObject);
  private
    vIdCerntroCusto,vIdMaquina,vIdOperador,vIdLocalEstoque,vIDProduto,vIdAtividade,
    vCombustivelEx,vBombaEx,IdCombustivel:string;
    vTipoMedicao:integer;
    procedure SomarColunasGrid;
  public
    procedure Filtro;
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.fmx}

uses UDmDB, UCadMaquina, UOperadorMaquinas, UPrincipal, UProdutos,
  UAuxAtividadeAbastecimento,UCentrodeCusto, UdmReport, ULocalEstoque;

procedure TfrmAbastecimento.btnAddClick(Sender: TObject);
begin
  edtAtividade.Text           :='';
  edtMaquina.Text             :='';
  edtHorimetro.Text           :='0';
  edtOperador.Text            :='';
  edtLocalEstoque.Text        :='';
  edtcombustivel.Text         :='';
  edtVolumeLitros.Text        :='0';
  edtCentroCusto.Text         :='';
  edtObs.Text                 :='';
  dmDB.TAbastecimento.Insert;
  inherited;
end;

procedure TfrmAbastecimento.btnAdicionarTalhaoClick(Sender: TObject);
begin
 edtOutroProduto.Text :='';
 edtQuantidade.Text   :='0';
 layNewOutros.Visible := true;
end;

procedure TfrmAbastecimento.btnBuscaCentroCustoClick(Sender: TObject);
begin
  frmCentroCusto := TfrmCentroCusto.Create(Self);
  try
    frmCentroCusto.ShowModal;
  finally
    vIdCerntroCusto      := dmDB.TCentroCustoid.AsString;
    edtCentroCusto.Text  := dmDB.TCentroCustonome.AsString;
  end;
end;

procedure TfrmAbastecimento.btnBuscaCombustivelClick(Sender: TObject);
begin
  frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    frmCadProdutos.ShowModal;
  finally
    IdCombustivel           := dmDB.TProdutosid.AsString;
    edtcombustivel.Text     := dmDB.TProdutosnome.AsString;
  end;
end;

procedure TfrmAbastecimento.btnBuscarFiltroClick(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmAbastecimento.btnConfirmaPluviClick(Sender: TObject);
begin
 edtOutroProduto.Text :='';
 edtQuantidade.Text   :='0';
 layNewOutros.Visible := true;
end;

procedure TfrmAbastecimento.btnDeletarClick(Sender: TObject);
begin
 MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dmDB.TAbastecimento.Edit;
        dmDB.TAbastecimentostatus.AsInteger := -1;
        dmDB.TAbastecimentoIdUsuarioAlteracao.AsString  := dmDB.vIdUsuarioLogado;
        dmDB.TAbastecimentoDataAlteracao.AsDateTime     := now;
        dmDB.TAbastecimentosyncaws.AsInteger            :=0;
        try
          dmDB.TAbastecimento.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          Filtro;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmAbastecimento.btnEditarClick(Sender: TObject);
begin
 dmDB.TAbastecimento.Edit;
 edtCentroCusto.Text       := dmDB.TAbastecimentocentrocustonome.AsString;
 vIdCerntroCusto           := dmDB.TAbastecimentoidcentrocusto.AsString;
// edtAtividade.Text         := dmDB.TAbastecimentoAtividade.AsString;
 vIdAtividade              := dmDB.TAbastecimentoidAtividade.AsString;
 edtDataAbastecimento.Date := dmDB.TAbastecimentodataabastecimento.AsDateTime;
 vIdLocalEstoque           := dmDB.TAbastecimentoidlocalestoque.AsString;
 edtLocalEstoque.text      := dmDB.TAbastecimentolocaldeEstoque.AsString;
 vIdMaquina                := dmDB.TAbastecimentoidmaquina.AsString;
 edtMaquina.Text           := dmDB.TAbastecimentoprefixo.AsString;
 vIdOperador               := dmDB.TAbastecimentoidoperador.AsString;
// edtOperador.Text          := dmDB.TAbastecimentooperador.AsString;
 edtVolumeLitros.Text      := dmDB.TAbastecimentovolumelt.AsString;
 edtcombustivel.Text       := dmDB.TAbastecimentoproduto.AsString;
 edtHorimetro.Text         := dmDB.TAbastecimentohorimetro.AsString;
 edtKMAtual.Text           := dmDB.TAbastecimentokmatual.AsString;
 edtObs.Text               := dmDB.TAbastecimentoobs.AsString;
 IdCombustivel             := dmDB.TAbastecimentocombustivel.AsString;
 inherited;
end;

procedure TfrmAbastecimento.btnExcelClick(Sender: TObject);
var
 csv: tstringlist;
 row, col: integer;
 s: string;
begin
 if SaveDialog1.Execute then
 begin
   csv:= tstringlist.create;
   for row:= 1 to StringGrid1.rowcount do
    begin
     s:= '';
     if row=1 then
     begin
       for col:= 0 to StringGrid1.ColumnCount-1 do
        s:= s + StringGrid1.Columns[col].Header + ';';
       csv.add(s)
     end
     else
     begin
       for col:= 0 to StringGrid1.ColumnCount-1 do
        s:= s + StringGrid1.Cells[col, row-1] + ';';
       csv.add(s)
     end;
    end;
   csv.savetofile(SaveDialog1.FileName);
   csv.free;
 end;
end;

procedure TfrmAbastecimento.btnRepConsumoClick(Sender: TObject);
begin
 layTipoReport.Visible := true;
end;

procedure TfrmAbastecimento.btnSalvarClick(Sender: TObject);
var
 vIdMax:string;
 vEdit:Integer;
begin
  if edtCentroCusto.Text.Length=0 then
  begin
    MyShowMessage('Informe o Centro de Custo!!',false);
    Exit;
  end;
  if edtMaquina.Text.Length=0 then
  begin
    MyShowMessage('Informe a maquina!!',false);
    Exit;
  end;
//  if edtOperador.Text.Length=0 then
//  begin
//    MyShowMessage('Informe o Operador!!',false);
//    Exit;
//  end;
  if edtLocalEstoque.Text.Length=0  then
  begin
    MyShowMessage('Informe o Local Estoque!!',false);
    Exit;
  end;
  if edtCombustivel.Text.Length=0 then
  begin
    MyShowMessage('Informe o Combustivel!!',false);
    Exit;
  end;

  if edtVolumeLitros.Text='0' then
  begin
    MyShowMessage('Informe a quantidade de Litros!!',false);
    Exit;
  end;

//  if edtAtividade.Text.Length=0 then
//  begin
//    MyShowMessage('Informe a Atividade!!',false);
//    Exit;
//  end;

  if dmDB.TAbastecimento.State=dsInsert then
  begin
   dmDB.TAbastecimentoidusuario.AsString := dmDB.vIdUsuarioLogado;
   vEdit:=0;
  end
  else
  begin
    dmDB.TAbastecimentoidusuarioalteracao.AsString := dmDB.vIdUsuarioLogado;
    dmDB.TAbastecimentodataalteracao.AsDateTime    := now;
    vEdit:=1;
  end;
  case vTipoMedicao of
   0:begin
      if (edtHorimetro.Text.Length=0) or (edtHorimetro.Text='0') then
      begin
        MyShowMessage('Informe o Horimetro Atual!',false);
        Exit;
      end;
     end;
   1:begin
      if(edtKMAtual.Text.Length=0) or (edtKMAtual.Text='0') then
      begin
        MyShowMessage('Informe o KM Atual!',false);
        Exit;
      end;
     end;
   2:begin
      if (edtKMAtual.Text.Length=0) or (edtKMAtual.Text='0') then
      begin
        MyShowMessage('Informe o KM Atual!',false);
        Exit;
      end;
      if(edtHorimetro.Text.Length=0) or (edtHorimetro.Text='0') then
      begin
        MyShowMessage('Informe o Horimetro Atual!',false);
        Exit;
      end;
     end;
  end;

//  dmDB.TAbastecimentoidAtividade.AsString        := vIdAtividade;
  dmDB.TAbastecimentoidlocalestoque.AsString     := vIdLocalEstoque;
  dmDB.TAbastecimentoidmaquina.AsString          := vIdMaquina;
//  dmDB.TAbastecimentoidoperador.AsString         := vIdOperador;
  dmDB.TAbastecimentovolumelt.AsFloat            := strToFloat(edtVolumeLitros.Text);
  dmDB.TAbastecimentocombustivel.AsString        := IdCombustivel;
  dmDB.TAbastecimentodataabastecimento.AsDateTime:= edtDataAbastecimento.DateTime;
  dmDB.TAbastecimentohora.AsDateTime             := edtHoraAbastecimento.DateTime;
  if edtHorimetro.Text.Length>0 then
   dmDB.TAbastecimentohorimetro.AsFloat           := strToFloat(edtHorimetro.Text);
  if edtKMAtual.Text.Length>0 then
   dmDB.TAbastecimentokmatual.AsFloat             := strToFloat(edtKMAtual.Text);
  dmDB.TAbastecimentoidcentrocusto.Asstring      := vIdCerntroCusto;
  if edtObs.Text.Length>0 then
   dmDB.TAbastecimentoobs.AsString := edtObs.Text;
  try
   dmDB.TAbastecimento.ApplyUpdates(-1);
   Filtro;
   SomarColunasGrid;
   inherited;
  except
   on E: Exception do
    myShowMessage('Erro ao salvar Abastecimento:'+E.Message,false);
  end;
end;


procedure TfrmAbastecimento.cbxBombaFChange(Sender: TObject);
begin
 if cbxBombaF.ItemIndex>-1 then
  vIdLocalEstoque := IntToStr(Integer(cbxBombaF.Items.Objects[cbxBombaF.ItemIndex]));
end;

procedure TfrmAbastecimento.cbxBombaFClick(Sender: TObject);
begin
 if edtCentroCustoF.Text.Length=0 then
 begin
  MyShowMessage('Selecione o Centro de Custo antes de selecionar o Local de Estoque!',false);
  Exit;
 end;
end;

procedure TfrmAbastecimento.cbxLocalEstoqueClick(Sender: TObject);
begin
 if edtCentroCusto.Text.Length=0 then
  MyShowMessage('Selecione o Centro de Custo antes de selecionar o Local de Estoque!',false);
end;

procedure TfrmAbastecimento.EditButton1Click(Sender: TObject);
begin
  frmAuxAtividadeAbastecimento := TfrmAuxAtividadeAbastecimento.Create(Self);
  try
    frmAuxAtividadeAbastecimento.ShowModal;
  finally
    vIdAtividade         := dmDB.Tauxatividadeabastecimentoid.AsString;
    edtAtividade.Text    := dmDB.Tauxatividadeabastecimentonome.AsString;
  end;
end;

procedure TfrmAbastecimento.EditButton4Click(Sender: TObject);
begin
  frmOperadorMaquinas := TfrmOperadorMaquinas.Create(Self);
  try
    frmOperadorMaquinas.ShowModal;
  finally
    vIdOperador      := dmDB.TOperadorMaquinaid.AsString;
    edtOperador.Text  := dmDB.TOperadorMaquinanome.AsString;
  end;
end;

procedure TfrmAbastecimento.EditButton5Click(Sender: TObject);
begin
  frmCadMaquinaVeiculo := TfrmCadMaquinaVeiculo.Create(Self);
  try
    frmCadMaquinaVeiculo.ShowModal;
  finally
    vIdMaquina           := dmDB.TMaquinasid.AsString;
    vTipoMedicao         := dmDB.TMaquinastipomedicao.AsInteger;
    edtMaquina.Text      := dmDB.TMaquinasprefixo.AsString;
    case vTipoMedicao of
      0:begin
         edtHorimetro.Enabled := true;
         edtKMAtual.Enabled   := false
        end;
      1:begin
         edtHorimetro.Enabled := false;
         edtKMAtual.Enabled   := true;
        end;
      2:begin
         edtHorimetro.Enabled := true;
         edtKMAtual.Enabled   := true;
        end;
    end;
  end;
end;

procedure TfrmAbastecimento.edtHorimetroChangeTracking(Sender: TObject);
begin
 if edtHorimetro.Text.Length=0 then
  edtHorimetro.Text:='0';
end;

procedure TfrmAbastecimento.edtHorimetroKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if((keyChar in ['0'..'9',','] = false) and (word(key) <> vk_back)) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmAbastecimento.edtQuantidadeChangeTracking(Sender: TObject);
begin
 if edtQuantidade.Text.Length=0 then
  edtQuantidade.Text:='0';
end;

procedure TfrmAbastecimento.edtQuantidadeKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if((keyChar in ['0'..'9',','] = false) and (word(key) <> vk_back)) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmAbastecimento.edtVolumeLitrosChangeTracking(Sender: TObject);
begin
 if edtVolumeLitros.Text.Length=0 then
  edtVolumeLitros.Text:='0';
end;

procedure TfrmAbastecimento.edtVolumeLitrosKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
 if((keyChar in ['0'..'9',','] = false) and (word(key) <> vk_back)) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmAbastecimento.Filtro;
var
 vFiltro:string;
begin
 vFiltro := '';
 if edtNomeFiltro.Text.Length>0 then
  vFiltro := ' and c.prefixo like '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 if edtcombustivelf.Text.Length>0 then
  vFiltro := vFiltro+' and a.combustivel='+IdCombustivel;
 if cbxBombaF.ItemIndex>0 then
  vFiltro := vFiltro+' and l.id='+vIdLocalEstoque;
 if edtCentroCustoF.Text.Length>0  then
  vFiltro := vFiltro+' and a.idcentrocusto ='+vIdCerntroCusto;
 vFiltro  := vFiltro+' and a.dataabastecimento between '+FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString+' and '+
 FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
 if chkComAlerta.IsChecked then
  vFiltro := ' and alerta>0';
 dmDB.AbreAbastecimento(vFiltro);
 SomarColunasGrid;
end;

procedure TfrmAbastecimento.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if(tbPrincipal.TabIndex=0) and (key=13) then
  Filtro;
end;

procedure TfrmAbastecimento.FormShow(Sender: TObject);
begin
  layTipoReport.Visible   := false;
  layNewOutros.Visible    := false;
  edtDataInicio.Date      := DATE-7;
  edtcombustivelF.Text    := '';
  Filtro;
  SomarColunasGrid;
  lblAdd.Text             := 'Adicionar';
  lblEdit.Text            := 'Editar';
  lblDeleta.Text          := 'Deletar';
  layListaMnu.Width       := 150;
  layListaMnu.Enabled     := true;
  btnAdd.Enabled          := true;
  btnDeletar.Enabled      := true;
  btnEditar.Enabled       := true;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
end;

procedure TfrmAbastecimento.Image13Click(Sender: TObject);
begin
 layNewOutros.Visible    := false;
end;

procedure TfrmAbastecimento.Image17Click(Sender: TObject);
begin
  layTipoReport.Visible := false;
end;

procedure TfrmAbastecimento.btnComFotoClick(Sender: TObject);
begin
 dmReport.ppLblPeriodoLista.Text := 'De '+edtDataInicio.Text+' Ate '+edtDataFim.Text;
 dmReport.ppRepListaFoto.print;
end;

procedure TfrmAbastecimento.btnComFotoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 btnComFoto.Opacity :=0.5;
end;

procedure TfrmAbastecimento.btnComFotoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 btnComFoto.Opacity :=1;
end;

procedure TfrmAbastecimento.btnSemFotoClick(Sender: TObject);
var
 vFiltro:string;
begin
 vFiltro := '';
 if edtNomeFiltro.Text.Length>0 then
  vFiltro := ' and c.prefixo like '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 if edtcombustivelf.Text.Length>0 then
  vFiltro := vFiltro+' and a.combustivel='+IdCombustivel;
 if cbxBombaF.ItemIndex>0 then
  vFiltro := vFiltro+' and l.id='+vIdLocalEstoque;
 if edtCentroCustoF.Text.Length>0  then
  vFiltro := vFiltro+' and a.idcentrocusto ='+vIdCerntroCusto;
 vFiltro  := vFiltro+' and a.dataabastecimento between '+FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString+' and '+
 FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
 if chkComAlerta.IsChecked then
  vFiltro := ' and alerta>0';
 dmReport.AbreAbastecimento(vFiltro);
 dmReport.ppLblPeriodoSemFoto.Text := 'De '+edtDataInicio.Text+' Ate '+edtDataFim.Text;
 if dmReport.TAbastecimento.IsEmpty then
 begin
   MyShowMessage('Sem dados para gerar o relatorio!',false);
   Exit;
 end
 else
  dmReport.ppRepListaSemFoto.print;
end;

procedure TfrmAbastecimento.btnSemFotoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 btnSemFoto.Opacity :=0.5;
end;

procedure TfrmAbastecimento.btnSemFotoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
 btnSemFoto.Opacity :=1;
end;

procedure TfrmAbastecimento.Rectangle9Click(Sender: TObject);
begin
 layNewOutros.Visible := false;
end;

procedure TfrmAbastecimento.SearchEditButton1Click(Sender: TObject);
begin
  frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    frmCadProdutos.ShowModal;
  finally
    vIDProduto            := dmDB.TProdutosid.AsString;
    edtOutroProduto.Text  := dmDB.TProdutosnome.AsString;
    frmCadProdutos.Free;
  end;
end;

procedure TfrmAbastecimento.SearchEditButton2Click(Sender: TObject);
begin
  frmCentroCusto := TfrmCentroCusto.Create(Self);
  try
    frmCentroCusto.ShowModal;
  finally
    vIdCerntroCusto      := dmDB.TCentroCustoid.AsString;
    edtCentroCusto.Text  := dmDB.TCentroCustonome.AsString;
  end;
end;

procedure TfrmAbastecimento.SearchEditButton3Click(Sender: TObject);
begin
  frmAuxAtividadeAbastecimento := TfrmAuxAtividadeAbastecimento.Create(Self);
  try
    frmAuxAtividadeAbastecimento.ShowModal;
  finally
    vIdAtividade         := dmDB.Tauxatividadeabastecimentoid.AsString;
    edtAtividade.Text    := dmDB.Tauxatividadeabastecimentonome.AsString;
  end;
end;

procedure TfrmAbastecimento.SearchEditButton4Click(Sender: TObject);
begin
  frmCentroCusto := TfrmCentroCusto.Create(Self);
  try
    frmCentroCusto.ShowModal;
  finally
    vIdCerntroCusto      := dmDB.TCentroCustoid.AsString;
    edtCentroCustoF.Text  := dmDB.TCentroCustonome.AsString;
  end;
end;

procedure TfrmAbastecimento.SearchEditButton5Click(Sender: TObject);
begin
  frmAuxAtividadeAbastecimento := TfrmAuxAtividadeAbastecimento.Create(Self);
  try
    frmAuxAtividadeAbastecimento.ShowModal;
  finally
    vIdAtividade         := dmDB.Tauxatividadeabastecimentoid.AsString;
    edtAtividadef.Text    := dmDB.Tauxatividadeabastecimentonome.AsString;
  end;
end;

procedure TfrmAbastecimento.SearchEditButton6Click(Sender: TObject);
begin
 frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    frmCadProdutos.ShowModal;
  finally
    IdCombustivel           := dmDB.TProdutosid.AsString;
    edtcombustivel.Text     := dmDB.TProdutosnome.AsString;
  end;
end;

procedure TfrmAbastecimento.SearchEditButton7Click(Sender: TObject);
begin
  frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    frmCadProdutos.ShowModal;
  finally
    IdCombustivel           := dmDB.TProdutosid.AsString;
    edtcombustivelF.Text     := dmDB.TProdutosnome.AsString;
  end;
end;

procedure TfrmAbastecimento.SearchEditButton8Click(Sender: TObject);
begin
 if edtCentroCusto.Text.Length=0 then
 begin
   MyShowMessage('Informe o Centro de Custo Antes!',false);
   Exit;
 end
 else
 begin
  frmAuxLocalEstoque := TfrmAuxLocalEstoque.Create(Self);
  try
    frmAuxLocalEstoque.vFiltro :=' and idcentrocusto='+vIdCerntroCusto;
    frmAuxLocalEstoque.ShowModal;
  finally
    vIdLocalEstoque       := dmDB.TLocalEstoqueid.AsString;
    edtLocalEstoque.Text  := dmDB.TLocalEstoquenome.AsString;
    IdCombustivel         := dmDB.TLocalEstoqueidcombustivel.AsString;
    edtcombustivel.Text   := dmDB.TLocalEstoquecombustivel.AsString;
  end;
 end;
end;

procedure TfrmAbastecimento.SomarColunasGrid;
var
  Sum : Double;
  Val : Double;
  I   : Integer;
begin
  Sum := 0;
  val := 0;
  I   := 0;
  for I := 0 to StringGrid1.RowCount-1 do
  begin
   if TryStrToFloat(StringGrid1.Cells[5,I],Val) then
    Sum := Sum + Val;
  end;
  if I>0 then
  begin
    lblFoterCout.Text            := IntToStr(I);
    lblTotalLitrosGrid.Text      := FormatFloat('####,##.00',(Sum));
  end
  else
  begin
    lblFoterCout.Text        := '0';
    lblTotalLitrosGrid.Text      := '0,00';
  end;
end;

end.

