unit ULubrificacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.DateTimeCtrls,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.ListBox, FMX.Menus;

type
  TfrmLubrificacao = class(TfrmCadPadrao)
    StringGrid2: TStringGrid;
    GroupBox1: TGroupBox;
    Label25: TLabel;
    Label27: TLabel;
    edtDataInicio: TDateEdit;
    edtDataFim: TDateEdit;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    laySubSubCad: TLayout;
    Rsub: TRectangle;
    laySubSubSubCad: TLayout;
    Layout8: TLayout;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtDataTroca: TDateEdit;
    edtCentroCusto: TEdit;
    ClearEditButton6: TClearEditButton;
    SearchEditButton2: TSearchEditButton;
    edtCentroCustoF: TEdit;
    ClearEditButton8: TClearEditButton;
    SearchEditButton4: TSearchEditButton;
    Z: TLabel;
    Layout14: TLayout;
    Rectangle13: TRectangle;
    Layout15: TLayout;
    Layout16: TLayout;
    Maquina: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label18: TLabel;
    edtMaquina: TEdit;
    ClearEditButton3: TClearEditButton;
    EditButton5: TSearchEditButton;
    edtOperador: TEdit;
    ClearEditButton5: TClearEditButton;
    EditButton4: TSearchEditButton;
    edtHorimetro: TEdit;
    edtKMAtual: TEdit;
    Layout2: TLayout;
    Rectangle6: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    lblTipo: TLabel;
    Label9: TLabel;
    Edit2: TEdit;
    ClearEditButton2: TClearEditButton;
    SearchEditButton5: TSearchEditButton;
    cbxTipo: TComboBox;
    Rectangle7: TRectangle;
    Layout6: TLayout;
    Label8: TLabel;
    Layout7: TLayout;
    Label10: TLabel;
    Label11: TLabel;
    Layout9: TLayout;
    edtProdutos: TEdit;
    ClearEditButton1: TClearEditButton;
    SearchEditButton1: TSearchEditButton;
    Layout10: TLayout;
    btnAddProduto: TRectangle;
    Label7: TLabel;
    Image11: TImage;
    StringGrid3: TStringGrid;
    StringColumn1: TStringColumn;
    FloatColumn1: TFloatColumn;
    Label12: TLabel;
    edtqtde: TEdit;
    PopupMenu1: TPopupMenu;
    mnuExcluirItem: TMenuItem;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    btnRepConsumo: TRectangle;
    Image10: TImage;
    Label4: TLabel;
    chkComAlerta: TCheckBox;
    procedure StringGrid1CellClick(const Column: TColumn; const Row: Integer);
    procedure StringGrid1SelChanged(Sender: TObject);
    procedure btnBuscarFiltroClick(Sender: TObject);
    procedure SearchEditButton4Click(Sender: TObject);
    procedure SearchEditButton2Click(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnAddProdutoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure EditButton5Click(Sender: TObject);
    procedure mnuExcluirItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnRepConsumoClick(Sender: TObject);
  private
    vIdMaquina,vIdCentroCusto,vIdProduto,vIdMax:string;
    vTipoMedicao:integer;
    procedure LimpaCampos;
    procedure GridDeleteRow(sg1: TstringGrid);
  public
    procedure Filtro;
  end;

var
  frmLubrificacao: TfrmLubrificacao;

implementation

{$R *.fmx}

uses UdmDB, UCentrodeCusto, UProdutos, UCadMaquina, UPrincipal, UdmReport;

procedure TfrmLubrificacao.btnAddClick(Sender: TObject);
begin
  LimpaCampos;
  dmdb.TLubrificacao.Close;
  dmdb.TLubrificacao.Open;
  dmdb.TLubrificacao.Insert;
  MudarAba(tbiCad,sender);
end;

procedure TfrmLubrificacao.btnAddProdutoClick(Sender: TObject);
begin
 if edtProdutos.Text.Length=0 then
 begin
   MyShowMessage('Informe o Produto!',false);
   Exit;
 end;
 if(edtqtde.Text.Length=0) or (edtqtde.Text='0') then
 begin
   MyShowMessage('Informe a Quantidade!',false);
   Exit;
 end;
 StringGrid3.RowCount := StringGrid3.RowCount+1;
 StringGrid3.RowCount := StringGrid3.RowCount;
 StringGrid3.Cells[0,StringGrid3.RowCount-1] := edtProdutos.Text;
 StringGrid3.Cells[1,StringGrid3.RowCount-1] := edtqtde.Text;
 StringGrid3.Cells[2,StringGrid3.RowCount-1] := vIdProduto;
 MyShowMessage('Produto Adicionado com sucesso!',false);
 edtProdutos.Text :='';
 edtqtde.Text     :='0';
end;

procedure TfrmLubrificacao.btnBuscarFiltroClick(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmLubrificacao.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dmDB.TLubrificacao.Edit;
        dmDB.TLubrificacaostatus.AsInteger := -1;
        dmDB.TLubrificacaoIdUsuarioAlteracao.AsString  := dmDB.vIdUsuarioLogado;
        dmDB.TLubrificacaoDataAlteracao.AsDateTime     := now;
        dmDB.TLubrificacaosyncaws.AsInteger            :=0;
        try
          dmDB.TLubrificacao.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          Filtro;
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmLubrificacao.btnEditarClick(Sender: TObject);
begin
  StringGrid3.RowCount  :=0;
  edtDataTroca.DateTime := dmdb.TLubrificacaodatatroca.AsDateTime;
  vIdCentroCusto        := dmdb.TLubrificacaoidcentrocusto.AsString;
  edtCentroCusto.Text   := dmdb.TLubrificacaocentrocusto.AsString;
  vIdMaquina            := dmdb.TLubrificacaoidmaquina.AsString;
  edtMaquina.Text       := dmdb.TLubrificacaomaquina.AsString;
  edtHorimetro.Text     := dmdb.TLubrificacaohorimetro.AsString;
  edtKMAtual.Text       := dmdb.TLubrificacaokm.AsString;
  cbxTipo.ItemIndex     := cbxTipo.Items.IndexOf(dmdb.TLubrificacaotipostr.AsString);
  dmdb.TLubrificacaoprodutos.First;
  while not dmdb.TLubrificacaoprodutos.Eof do
  begin
    StringGrid3.RowCount := StringGrid3.RowCount+1;
    StringGrid3.Cells[0,StringGrid3.RowCount-1] := dmdb.TLubrificacaoprodutosproduto.AsString;
    StringGrid3.Cells[1,StringGrid3.RowCount-1] := dmdb.TLubrificacaoprodutosqtd.AsString;
    StringGrid3.Cells[2,StringGrid3.RowCount-1] := dmdb.TLubrificacaoprodutosidproduto.AsString;
    StringGrid3.Cells[3,StringGrid3.RowCount-1] := dmdb.TLubrificacaoprodutosid.AsString;
    dmdb.TLubrificacaoprodutos.Next;
  end;
  dmdb.TLubrificacao.Edit;
  inherited;
end;

procedure TfrmLubrificacao.btnRepConsumoClick(Sender: TObject);
var
 vFiltro:string;
begin
 vFiltro := '';
 if edtNomeFiltro.Text.Length>0 then
  vFiltro := ' and m.prefixo like '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 if edtCentroCustoF.Text.Length>0 then
  vFiltro := ' and c.id ='+vIdCentroCusto;
 vFiltro  := vFiltro+' and l.datatroca between '+FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString+' and '+
 FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
 dmReport.AbreLubrificacao(vFiltro);
  if dmReport.qryLubrificacao.IsEmpty then
   MyShowMessage('Sem dados para gerar esse Relatório!',false);
end;

procedure TfrmLubrificacao.btnSalvarClick(Sender: TObject);
var
  I: Integer;
begin
 if edtCentroCusto.Text.Length=0 then
 begin
   MyShowMessage('Informe o Centro de Custo!',false);
   Exit;
 end;
 if edtMaquina.Text.Length=0 then
 begin
   MyShowMessage('Informe a Maquina!',false);
   Exit;
 end;
 case vTipoMedicao of
  0:begin
     if (edtHorimetro.Text='0') or (edtHorimetro.Text.Length=0) then
     begin
       MyShowMessage('Informe o Horimetro!',false);
       Exit;
     end;
    end;
  1:begin
     if (edtKMAtual.Text='0') or (edtKMAtual.Text.Length=0) then
     begin
       MyShowMessage('Informe o Km!',false);
       Exit;
     end;
    end;
  2:begin
     if (edtHorimetro.Text='0') or (edtHorimetro.Text.Length=0) then
     begin
       MyShowMessage('Informe o Horimetro!',false);
       Exit;
     end;
     if (edtKMAtual.Text='0') or (edtKMAtual.Text.Length=0) then
     begin
       MyShowMessage('Informe o Km!',false);
       Exit;
     end;
    end;
 end;
 if cbxTipo.ItemIndex=-1 then
 begin
   MyShowMessage('Informe o tipo!',false);
   Exit;
 end;
 if dmdb.TLubrificacao.State=dsInsert then
 begin
   dmdb.TLubrificacaoidusuario.AsString       := dmdb.vIdUsuarioLogado;
   dmdb.TLubrificacaodatatroca.AsDateTime     := edtDataTroca.Date;
   dmdb.TLubrificacaoidmaquina.AsString       := vIdMaquina;
   dmdb.TLubrificacaoidcentrocusto.AsString   := vIdCentroCusto;
   dmdb.TLubrificacaohorimetro.AsString       := edtHorimetro.Text;
   dmdb.TLubrificacaokm.AsString              := edtKMAtual.Text;
   if cbxTipo.ItemIndex=0 then
    dmdb.TLubrificacaotipo.AsInteger          :=1
   else
    dmdb.TLubrificacaotipo.AsInteger          :=2;
   try
    dmdb.TLubrificacao.ApplyUpdates(-1);
    vIdMax := dmdb.RetornaMaxId('lubrificacao');
    for I := 0 to StringGrid3.RowCount-1 do
    begin
      dmdb.TLubrificacaoprodutos.Close;
      dmdb.TLubrificacaoprodutos.Open;
      dmdb.TLubrificacaoprodutos.Insert;
      dmdb.TLubrificacaoprodutosidusuario.AsString      := dmdb.vIdUsuarioLogado;
      dmdb.TLubrificacaoprodutosidlubrificacao.AsString := vIdMax;
      dmdb.TLubrificacaoprodutosidproduto.AsString      := StringGrid3.Cells[2,I];
      dmdb.TLubrificacaoprodutosqtd.AsString            := StringGrid3.Cells[1,I];
      try
       dmdb.TLubrificacaoprodutos.ApplyUpdates(-1);
      except
      on E : Exception do
        myShowMessage('Erro: '+E.Message,false);
      end;
    end;
    MyShowMessage('Registro Atualizdo com sucesso!',false);
    Filtro;
    MudarAba(tbiLista,sender);
   except
     on E : Exception do
      myShowMessage('Erro: '+E.Message,false);
   end;
 end;
 if dmdb.TLubrificacao.State=dsEdit then
 begin
   dmdb.TLubrificacaodataalteracao.AsDateTime    := now;
   dmdb.TLubrificacaoidusuarioalteracao.AsString := dmdb.vIdUsuarioLogado;
   dmdb.TLubrificacaodatatroca.AsDateTime        := edtDataTroca.Date;
   dmdb.TLubrificacaoidmaquina.AsString          := vIdMaquina;
   dmdb.TLubrificacaoidcentrocusto.AsString      := vIdCentroCusto;
   dmdb.TLubrificacaohorimetro.AsString          := edtHorimetro.Text;
   dmdb.TLubrificacaokm.AsString                 := edtKMAtual.Text;
   if cbxTipo.ItemIndex=0 then
    dmdb.TLubrificacaotipo.AsInteger             :=1
   else
    dmdb.TLubrificacaotipo.AsInteger             :=2;
   try
    dmdb.TLubrificacao.ApplyUpdates(-1);
    vIdMax := dmdb.TLubrificacaoid.asstring;
    dmdb.DeletaProdutoLubAll(vIdMax);
    for I := 0 to StringGrid3.RowCount-1 do
    begin
      dmdb.TLubrificacaoprodutos.Close;
      dmdb.TLubrificacaoprodutos.Open;
      dmdb.TLubrificacaoprodutos.Insert;
      dmdb.TLubrificacaoprodutosidusuario.AsString      := dmdb.vIdUsuarioLogado;
      dmdb.TLubrificacaoprodutosidlubrificacao.AsString := vIdMax;
      dmdb.TLubrificacaoprodutosidproduto.AsString      := StringGrid3.Cells[2,I];
      dmdb.TLubrificacaoprodutosqtd.AsString            := StringGrid3.Cells[1,I];
      try
       dmdb.TLubrificacaoprodutos.ApplyUpdates(-1);
      except
      on E : Exception do
        myShowMessage('Erro: '+E.Message,false);
      end;
    end;
    MyShowMessage('Registro Atualizdo com sucesso!',false);
    Filtro;
    MudarAba(tbiLista,sender);
   except
     on E : Exception do
      myShowMessage('Erro: '+E.Message,false);
   end;
 end;
end;

procedure TfrmLubrificacao.EditButton5Click(Sender: TObject);
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

procedure TfrmLubrificacao.Filtro;
var
 vFiltro:string;
begin
 vFiltro := '';
 if edtNomeFiltro.Text.Length>0 then
  vFiltro := ' and m.prefixo like '+QuotedStr('%'+edtNomeFiltro.Text+'%');
 if edtCentroCustoF.Text.Length>0 then
  vFiltro := ' and c.id ='+vIdCentroCusto;
 vFiltro  := vFiltro+' and l.datatroca between '+FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString+' and '+
 FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
 if chkComAlerta.IsChecked then
  vFiltro := ' and alerta>0';
 dmDB.AbrirLubrificacao(vFiltro);
 lblFoterCout.Text := IntToStr(StringGrid1.RowCount)
end;

procedure TfrmLubrificacao.FormShow(Sender: TObject);
begin
  Filtro;
  LimpaCampos;
  StringGrid2.RowCount :=0;
  inherited;
end;

procedure TfrmLubrificacao.GridDeleteRow(sg1: TstringGrid);
var
 i, j : integer;
begin
 for i := sg1.Row to (sg1.RowCount - 1) do
  for j := 0 to (sg1.ColumnCount - 1) do
   sg1.Cells[j, i] := sg1.Cells[j, i + 1];
 sg1.RowCount := sg1.RowCount - 1;
end;

procedure TfrmLubrificacao.LimpaCampos;
begin
 edtCentroCusto.Text :='';
 edtMaquina.Text     :='';
 edtHorimetro.Text   :='0';
 edtKMAtual.Text     :='0';
 edtHorimetro.Text   :='0';
 cbxTipo.ItemIndex   :=-1;
 edtProdutos.Text    :='';
 edtqtde.Text        :='0';
 StringGrid3.RowCount:=0;
end;

procedure TfrmLubrificacao.mnuExcluirItemClick(Sender: TObject);
begin
  MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        try
         if dmdb.TLubrificacao.State=dsinsert then
          GridDeleteRow(StringGrid3)
         else
         begin
           GridDeleteRow(StringGrid3);
           dmdb.DeletaProdutoLub(StringGrid3.Cells[3,StringGrid3.Row]);
         end;
         MyShowMessage('Registro Excluido com sucesso!',false);
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmLubrificacao.SearchEditButton1Click(Sender: TObject);
begin
  frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    frmCadProdutos.ShowModal;
  finally
    vIdproduto            := dmDB.TProdutosid.AsString;
    edtProdutos.Text      := dmDB.TProdutosnome.AsString;
  end;
end;

procedure TfrmLubrificacao.SearchEditButton2Click(Sender: TObject);
begin
 frmCentroCusto := TfrmCentroCusto.Create(Self);
  try
    frmCentroCusto.ShowModal;
  finally
    vIdCentroCusto       := dmDB.TCentroCustoid.AsString;
    edtCentroCusto.Text  := dmDB.TCentroCustonome.AsString;
  end;
end;

procedure TfrmLubrificacao.SearchEditButton4Click(Sender: TObject);
begin
  frmCentroCusto := TfrmCentroCusto.Create(Self);
  try
    frmCentroCusto.ShowModal;
  finally
    vIdCentroCusto        := dmDB.TCentroCustoid.AsString;
    edtCentroCustoF.Text  := dmDB.TCentroCustonome.AsString;
  end;
end;

procedure TfrmLubrificacao.StringGrid1CellClick(const Column: TColumn;
  const Row: Integer);
begin
 dmdb.AbrirLubrificacaoprodutos(dmdb.TLubrificacaoid.AsString);
end;

procedure TfrmLubrificacao.StringGrid1SelChanged(Sender: TObject);
begin
 if dmdb.TLubrificacaoid.AsString.Length>0 then
  dmdb.AbrirLubrificacaoprodutos(dmdb.TLubrificacaoid.AsString);
end;

end.
