unit UMovEntreLocalEstoque;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.DateTimeCtrls,
  FMX.ListBox;

type
  TfrmMovLocalEstoque = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    edtDataInicio: TDateEdit;
    edtDataFim: TDateEdit;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Label4: TLabel;
    Layout6: TLayout;
    Label5: TLabel;
    Layout7: TLayout;
    ComboBox1: TComboBox;
    Layout13: TLayout;
    edtLocalDestino: TEdit;
    EditButton1: TEditButton;
    Layout46000000: TLayout;
    Rectangle16000000: TRectangle;
    Layout490000000000000: TLayout;
    Layout47000000000: TLayout;
    Label31000000000: TLabel;
    layCapDadosPasto: TLayout;
    lbll: TLabel;
    Label7: TLabel;
    Layout48000000000: TLayout;
    cbxCurralPastoGrupo: TComboBox;
    LayValueDadosPasto: TLayout;
    edtProduto: TEdit;
    btnBuscaProduto: TEditButton;
    edtqtd: TEdit;
    Layout14: TLayout;
    Rectangle2: TRectangle;
    Layout15: TLayout;
    Rectangle3: TRectangle;
    Layout16: TLayout;
    Layout17: TLayout;
    Label6: TLabel;
    Layout18: TLayout;
    Label9: TLabel;
    Layout19: TLayout;
    ComboBox3: TComboBox;
    Layout20: TLayout;
    edtDataMov: TDateEdit;
    Label11: TLabel;
    edtHoraMov: TTimeEdit;
    laySubSubCad: TLayout;
    Rsub: TRectangle;
    laySubSubSubCad: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    Label8: TLabel;
    Layout10: TLayout;
    Label13: TLabel;
    Layout11: TLayout;
    ComboBox2: TComboBox;
    Layout12: TLayout;
    edtLocalOrigem: TEdit;
    EditButton2: TEditButton;
    Rectangle4: TRectangle;
    SearchEditButton1: TSearchEditButton;
    ClearEditButton1: TClearEditButton;
    ClearEditButton2: TClearEditButton;
    ClearEditButton3: TClearEditButton;
    Label10: TLabel;
    edtCentroCustoOrigem: TEdit;
    EditButton3: TEditButton;
    ClearEditButton4: TClearEditButton;
    Label12: TLabel;
    edtCentroCustoDestino: TEdit;
    EditButton4: TEditButton;
    ClearEditButton5: TClearEditButton;
    Label14: TLabel;
    Label15: TLabel;
    lblSaldoAtualOrigem: TLabel;
    lblSaldoAtualDestino: TLabel;
    btnRepLista: TRectangle;
    Image1: TImage;
    Label24: TLabel;
    edtCentroCustoOriF: TEdit;
    ClearEditButton6: TClearEditButton;
    SearchEditButton2: TSearchEditButton;
    Label16: TLabel;
    btnListaMovFoto: TRectangle;
    Image9: TImage;
    Label17: TLabel;
    procedure FormShow(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure btnBuscaProdutoClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure edtqtdKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure btnBuscarFiltroClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure EditButton3Click(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);
    procedure btnRepListaClick(Sender: TObject);
    procedure SearchEditButton2Click(Sender: TObject);
    procedure btnListaMovFotoClick(Sender: TObject);
  private
    vIdLocalOrigem,vIdLocalDestino,vIdProduto:string;
    procedure Filtro;
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmMovLocalEstoque: TfrmMovLocalEstoque;

implementation

{$R *.fmx}

uses UDMDB, ULocalEstoque, UProdutos, UPrincipal, UCentrodeCusto, UdmReport;

procedure TfrmMovLocalEstoque.btnAddClick(Sender: TObject);
begin
  LimpaCampos;
  dmdb.TMovLocalEstoque.Close;
  dmdb.TMovLocalEstoque.Open;
  dmdb.TMovLocalEstoque.Insert;
  inherited;
end;

procedure TfrmMovLocalEstoque.btnBuscaProdutoClick(Sender: TObject);
begin
 frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    frmCadProdutos.ShowModal;
  finally
    vIdProduto         := dmdb.TProdutosid.AsString;
    edtProduto.Text    := dmdb.TProdutosnome.AsString;
  end;
end;

procedure TfrmMovLocalEstoque.btnBuscarFiltroClick(Sender: TObject);
begin
  Filtro;
end;

procedure TfrmMovLocalEstoque.btnDeletarClick(Sender: TObject);
begin
  MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dmdb.TMovLocalEstoque.Edit;
        dmdb.TMovLocalEstoqueStatus.AsInteger := -1;
        dmdb.TMovLocalEstoqueIdUsuarioAlteracao.AsString  := dmdb.vIdUsuarioLogado;
        dmdb.TMovLocalEstoqueDataAlteracao.AsDateTime     := now;
        try
          dmdb.TMovLocalEstoquesyncaws.AsInteger            :=0;
          dmdb.TMovLocalEstoque.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          Filtro;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;

end;

procedure TfrmMovLocalEstoque.btnEditarClick(Sender: TObject);
begin
  dmdb.TEstoqueEntrada.Edit;
  vIdProduto                                         := dmdb.TMovLocalEstoqueidproduto.AsString;
  edtProduto.Text                                    := dmdb.TMovLocalEstoqueidproduto.AsString;
  vIdLocalOrigem                                     := dmdb.TMovLocalEstoqueidlocalestoqueorigem.AsString;
  vIdLocalDestino                                    := dmdb.TMovLocalEstoqueidlocalestoquedetino.AsString;
  edtDataMov.Date                                    := dmdb.TMovLocalEstoquedatamov.AsDateTime;
  edtHoraMov.Date                                    := dmdb.TMovLocalEstoquehora.AsDateTime;
  edtqtd.Text                                        := dmdb.TMovLocalEstoqueqtde.AsString;
  inherited;
end;

procedure TfrmMovLocalEstoque.btnListaMovFotoClick(Sender: TObject);
begin
 if StringGrid1.RowCount>0 then
 begin
   BindSourceDB1.DataSet :=nil;
   dmReport.ppRepMovEstoqueFoto.Print;
   BindSourceDB1.DataSet :=dmdb.TMovLocalEstoque;
 end;
end;

procedure TfrmMovLocalEstoque.btnRepListaClick(Sender: TObject);
begin
 if StringGrid1.RowCount>0 then
 begin
  BindSourceDB1.DataSet :=nil;
  dmReport.ppRepMovEstoque.Print;
  BindSourceDB1.DataSet :=dmdb.TMovLocalEstoque;
 end;
end;

procedure TfrmMovLocalEstoque.btnSalvarClick(Sender: TObject);
begin
 if edtLocalOrigem.Text.Length=0 then
 begin
   MyShowMessage('Informe o Local de Origem!',false);
   edtLocalOrigem.SetFocus;
   Exit;
 end;
 if edtLocalDestino.Text.Length=0 then
 begin
   MyShowMessage('Informe o Local de Destino!',false);
   edtLocalDestino.SetFocus;
   Exit;
 end;
 if edtProduto.Text.Length=0 then
 begin
   MyShowMessage('Informe o Prtoduto!',false);
   edtProduto.SetFocus;
   Exit;
 end;
 if(edtqtd.Text.Length=0)or(edtqtd.Text='0') then
 begin
   MyShowMessage('Informe a Quantidade!',false);
   edtqtd.SetFocus;
   Exit;
 end;
 if (StrToInt(edtqtd.Text))>(StrToInt(lblSaldoAtualOrigem.Text)) then
 begin
   MyShowMessage('Quantidade não pode ser maior que o saldo atual da origem!!!',false);
   Exit;
 end;
 if dmdb.TMovLocalEstoque.State=dsInsert then
 begin
   dmdb.TMovLocalEstoqueidusuario.AsString := dmdb.vIdUsuarioLogado;
 end;
 if dmdb.TMovLocalEstoque.State=dsEdit then
 begin
   dmdb.TMovLocalEstoqueidusuarioalteracao.AsString := dmdb.vIdUsuarioLogado;
   dmdb.TMovLocalEstoquedataalteracao.AsDateTime    := now;
 end;
 dmdb.TMovLocalEstoqueidproduto.AsString             := vIdProduto;
 dmdb.TMovLocalEstoqueidlocalestoqueorigem.AsString  := vIdLocalOrigem;
 dmdb.TMovLocalEstoqueidlocalestoquedetino.AsString  := vIdLocalDestino;
 dmdb.TMovLocalEstoqueqtde.AsString                  := edtqtd.Text;
 dmdb.TMovLocalEstoquedatamov.AsDateTime             := edtDataMov.DateTime;
 dmdb.TMovLocalEstoquehora.AsDateTime                := edtHoraMov.DateTime;
 try
  dmdb.TMovLocalEstoque.ApplyUpdates(-1);
  MyShowMessage('Movimentação realizada com sucesso!',false);
  dmdb.MovLocalEstoque('');
  inherited;
 except
 on E: Exception do
    ShowMessage('Erro ao salvar Registro:'+E.Message);
 end;
end;

procedure TfrmMovLocalEstoque.EditButton1Click(Sender: TObject);
begin
 if edtCentroCustoDestino.Text.Length=0 then
  begin
   MyShowMessage('Selecione o Centro de Custo de Destino!',false);
   Exit;
  end;
  frmAuxLocalEstoque := TfrmAuxLocalEstoque.Create(Self);
  try
    frmAuxLocalEstoque.edtCentroCustoF.Text    := edtCentroCustoDestino.Text;
    frmAuxLocalEstoque.edtCentroCustoF.Enabled := false;
    frmAuxLocalEstoque.btnBuscarFiltroClick(Sender);
    frmAuxLocalEstoque.ShowModal;
  finally
    frmAuxLocalEstoque.edtCentroCustoF.Text    := '';
    frmAuxLocalEstoque.edtCentroCustoF.Enabled := true;
    vIdLocalDestino           := dmdb.TLocalEstoqueid.AsString;
    lblSaldoAtualDestino.Text := dmdb.RetornaSaldoAtualLocal(vIdLocalDestino);
    edtLocalDestino.Text      := dmdb.TLocalEstoquenome.AsString;
  end;
end;

procedure TfrmMovLocalEstoque.EditButton2Click(Sender: TObject);
begin
  if edtCentroCustoOrigem.Text.Length=0 then
  begin
   MyShowMessage('Selecione o Centro de Custo de Origem!',false);
   Exit;
  end;
  frmAuxLocalEstoque := TfrmAuxLocalEstoque.Create(Self);
  try
    frmAuxLocalEstoque.edtCentroCustoF.Text    := edtCentroCustoOrigem.Text;
    frmAuxLocalEstoque.edtCentroCustoF.Enabled := false;
    frmAuxLocalEstoque.btnBuscarFiltroClick(Sender);
    frmAuxLocalEstoque.ShowModal;
  finally
    vIdLocalOrigem           := dmdb.TLocalEstoqueid.AsString;
    lblSaldoAtualOrigem.Text := dmdb.RetornaSaldoAtualLocal(vIdLocalOrigem);
    edtLocalOrigem.Text      := dmdb.TLocalEstoquenome.AsString;
  end;
end;

procedure TfrmMovLocalEstoque.EditButton3Click(Sender: TObject);
begin
  frmCentroCusto := TfrmCentroCusto.Create(Self);
  try
    frmCentroCusto.ShowModal;
  finally
    edtCentroCustoOrigem.Text := dmdb.TCentroCustonome.AsString;
  end;
end;

procedure TfrmMovLocalEstoque.EditButton4Click(Sender: TObject);
begin
  frmCentroCusto := TfrmCentroCusto.Create(Self);
  try
    frmCentroCusto.ShowModal;
  finally
    edtCentroCustoDestino.Text := dmdb.TCentroCustonome.AsString;
  end;
end;

procedure TfrmMovLocalEstoque.edtqtdKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if (keyChar in ['0'..'9',','] = false) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmMovLocalEstoque.Filtro;
var
 vFiltro:string;
 vDataDe,vDataAte:string;
begin
 vFiltro:='';
 vDataDe  := FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString;
 vDataAte := FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
 vFiltro  := vFiltro+' and cast(a.datamov as date) between '+vDataDe+' and '+vDataAte;
 if edtNomeFiltro.Text.Length>0 then
  vFiltro:=vFiltro+' and c.nome like '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 if edtCentroCustoOriF.Text.Length>0 then
  vFiltro:=vFiltro+' and co.nome='+edtCentroCustoOriF.Text.QuotedString;
 dmdb.MovLocalEstoque(vFiltro);
 lblFoterCout.Text := intToStr(StringGrid1.RowCount);
end;

procedure TfrmMovLocalEstoque.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if (Key=13)and(tbPrincipal.TabIndex=0) then
   Filtro;
end;

procedure TfrmMovLocalEstoque.FormShow(Sender: TObject);
begin
  lblAdd.Text        := 'Adicionar';
  lblEdit.Text       := 'Editar';
  lblDeleta.Text     := 'Deletar';
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
  edtDataInicio.Date      := Date-30;
  edtDataFim.Date         := Date;
  Filtro;
end;

procedure TfrmMovLocalEstoque.LimpaCampos;
begin
 edtDataMov.Date            := date;
 edtProduto.Text            := '';
 edtqtd.Text                :='0';
 edtLocalDestino.Text       :='';
 edtLocalDestino.Text       :='';
 edtCentroCustoOrigem.Text  :='';
 edtCentroCustoOrigem.Text  :='';
 lblSaldoAtualOrigem.Text   :='0';
 lblSaldoAtualDestino.Text  :='0';
end;



procedure TfrmMovLocalEstoque.SearchEditButton1Click(Sender: TObject);
begin
  frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    frmCadProdutos.ShowModal;
  finally
    vIdProduto      := dmdb.TProdutosid.AsString;
    edtNomeFiltro.Text := dmdb.TProdutosnome.AsString;
  end;
end;

procedure TfrmMovLocalEstoque.SearchEditButton2Click(Sender: TObject);
begin
  frmCentroCusto := TfrmCentroCusto.Create(Self);
  try
    frmCentroCusto.ShowModal;
  finally
    edtCentroCustoOriF.Text := dmdb.TCentroCustonome.AsString;
  end;
end;

end.
