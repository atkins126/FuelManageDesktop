unit UCadMaquina;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UCadPadrao, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ActnList,
  System.Actions, FMX.TabControl, FMX.Ani, FMX.ScrollBox, FMX.Grid, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.ListBox,Winapi.Windows, FMX.Menus, FMX.WebBrowser, FMX.DateTimeCtrls;

type
  TfrmCadMaquinaVeiculo = class(TfrmCadPadrao)
    OpenImg: TOpenDialog;
    PopupMnuGrid: TPopupMenu;
    mnuVerImagem: TMenuItem;
    layImg: TLayout;
    Rectangle6: TRectangle;
    Layout17: TLayout;
    Layout18: TLayout;
    ToolBar4: TToolBar;
    lblNomeProduto: TLabel;
    Image10: TImage;
    imgVisualizar: TImage;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Layout2: TLayout;
    Layout4: TLayout;
    Layout6: TLayout;
    Label15: TLabel;
    Label18: TLabel;
    edtPlaca: TEdit;
    cbxAno: TComboBox;
    edtChassi: TEdit;
    lblPf: TLabel;
    edtPlacaF: TEdit;
    Label14: TLabel;
    edtPrefixoF: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    lblSegmento: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    ClearEditButton1: TClearEditButton;
    ClearEditButton2: TClearEditButton;
    edtMarcaF: TEdit;
    SearchEditButton1: TSearchEditButton;
    ClearEditButton3: TClearEditButton;
    edtGrupoF: TEdit;
    SearchEditButton2: TSearchEditButton;
    ClearEditButton4: TClearEditButton;
    Label4: TLabel;
    edtSubGrupoF: TEdit;
    SearchEditButton3: TSearchEditButton;
    ClearEditButton5: TClearEditButton;
    Layout3: TLayout;
    Rectangle4: TRectangle;
    Layout11: TLayout;
    Layout12: TLayout;
    Layout13: TLayout;
    Label5: TLabel;
    Label13: TLabel;
    edtPrefixo: TEdit;
    ClearEditButton6: TClearEditButton;
    edtGrupo: TEdit;
    SearchEditButton4: TSearchEditButton;
    ClearEditButton7: TClearEditButton;
    Label7: TLabel;
    edtSubGrupo: TEdit;
    SearchEditButton5: TSearchEditButton;
    ClearEditButton8: TClearEditButton;
    Layout7: TLayout;
    Rectangle3: TRectangle;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout10: TLayout;
    Label10: TLabel;
    Label11: TLabel;
    edtHorimetroAtual: TEdit;
    ClearEditButton9: TClearEditButton;
    edtKmAtual: TEdit;
    ClearEditButton10: TClearEditButton;
    Label9: TLabel;
    cbxTipoMedicao: TComboBox;
    Label12: TLabel;
    edtMarca: TEdit;
    SearchEditButton6: TSearchEditButton;
    ClearEditButton11: TClearEditButton;
    Label6: TLabel;
    edtModelo: TEdit;
    ClearEditButton12: TClearEditButton;
    GridMaquinas: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    procedure btnAddClick(Sender: TObject);
    procedure EditButton4Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure mnuVerImagemClick(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure StringGrid1CellDblClick(const Column: TColumn;
      const Row: Integer);
    procedure StringGrid1CellClick(const Column: TColumn; const Row: Integer);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure SearchEditButton2Click(Sender: TObject);
    procedure SearchEditButton3Click(Sender: TObject);
    procedure btnBuscarFiltroClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure GridMaquinasCellDblClick(const Column: TColumn;
      const Row: Integer);
  private
    vIdMarca,vIdGrupo,vIdSubgrupo:string;
  public
    vFilter    :integer;
    vIdMaquina :string;
    procedure LimpaCampos;
    procedure Filtro;
  end;

var
  frmCadMaquinaVeiculo: TfrmCadMaquinaVeiculo;

implementation

{$R *.fmx}

uses UPrincipal, UAuxMarcas,uFormat,UdmDB, UAuxGrupo, UAuxSubGrupo;

procedure TfrmCadMaquinaVeiculo.btnAddClick(Sender: TObject);
begin
  vFilter            :=1;
  LimpaCampos;
  dmdb.TMaquinas.Close;
  dmdb.TMaquinas.Open;
  dmdb.TMaquinas.Insert;
  inherited;
end;

procedure TfrmCadMaquinaVeiculo.btnBuscarClick(Sender: TObject);
begin
 if layFiltros.Height =0 then
  layFiltros.Height  := 140
 else
   layFiltros.Height := 0;
end;

procedure TfrmCadMaquinaVeiculo.btnBuscarFiltroClick(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmCadMaquinaVeiculo.btnCancelaClick(Sender: TObject);
begin
  vFilter       :=0;
  inherited;
end;

procedure TfrmCadMaquinaVeiculo.btnConfirmaClick(Sender: TObject);
var
  Stream: TMemoryStream;
begin
 if edtPrefixo.Text.Length=0 then
 begin
  MyShowMessage('Informe o Prefixo!',false);
  edtPrefixo.SetFocus;
  Exit;
 end;
 if edtGrupo.Text.Length=0 then
 begin
  MyShowMessage('Informe o Grupo!',false);
  edtGrupo.SetFocus;
  Exit;
 end;
 if edtSubGrupo.Text.Length=0 then
 begin
  MyShowMessage('Informe o Subgrupo!',false);
  edtSubGrupo.SetFocus;
  Exit;
 end;

 if edtMarca.Text.Length=0 then
 begin
  MyShowMessage('Informe a Marca!',false);
  edtMarca.SetFocus;
  Exit;
 end;
 if edtModelo.Text.Length=0 then
 begin
  MyShowMessage('Informe o Modelo!',false);
  edtModelo.SetFocus;
  Exit;
 end;
 if cbxTipoMedicao.ItemIndex=-1 then
 begin
   MyShowMessage('Informe o Tipo de Medição!',false);
   cbxTipoMedicao.SetFocus;
   Exit;
 end;
 if dmdb.TMaquinas.State=dsInsert then
  dmdb.TMaquinasIdUsuario.AsString          := dmdb.vIdUsuarioLogado
 else
 begin
  dmdb.TMaquinasIdUsuarioAlteracao.AsString := dmdb.vIdUsuarioLogado;
  dmdb.TMaquinasDataAlteracao.AsDateTime    := now;
 end;
 dmdb.TMaquinasprefixo.AsString             := edtPrefixo.Text;
 dmdb.TMaquinasidgrupo.AsString             := vIdGrupo;
 dmdb.TMaquinasidsubgrupo.AsString          := vIdSubGrupo;
 dmdb.TMaquinasidmarca.AsString             := vIdMarca;
 dmdb.TMaquinasmodelo.AsString              := edtModelo.Text;
 if edtPlaca.Text.Length>0 then
  dmdb.TMaquinasplaca.AsString              := edtPlaca.Text;
 if cbxAno.ItemIndex>-1 then
  dmdb.TMaquinasano.AsString                := cbxAno.Selected.Text;
 if edtChassi.Text.Length>0 then
  dmdb.TMaquinaschassi.AsString             := edtChassi.Text;
 dmdb.TMaquinastipomedicao.AsInteger        := cbxTipoMedicao.ItemIndex;
 try
  dmdb.TMaquinas.ApplyUpdates(-1);
  MyShowMessage('Maquina Cadastrado com Sucesso!',false);
  dmdb.TMaquinas.Close;
  dmdb.TMaquinas.Open;
  vFilter       :=0;
  MudarAba(tbiLista,sender);
 except
   on E: Exception do
    myShowMessage('Erro ao salvar Maquina:'+E.Message,false);
 end;
end;

procedure TfrmCadMaquinaVeiculo.btnDeletarClick(Sender: TObject);
begin
   MyShowMessage('Deseja Realmente Deletar esse registro?',true);
   case frmPrincipal.vMsgConfirma of
     1:begin
        dmdb.TMaquinas.Edit;
        dmdb.TMaquinasStatus.AsInteger := -1;
        dmdb.TMaquinasIdUsuarioAlteracao.AsString  := dmdb.vIdUsuarioLogado;
        dmdb.TMaquinasDataAlteracao.AsDateTime     := now;
        try
          dmdb.TMaquinas.ApplyUpdates(-1);
          MyShowMessage('Registro Excluido com sucesso!',false);
          dmdb.TMaquinas.Close;
          dmdb.TMaquinas.Open();
        except
         on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
        end;
     end;
   end;
end;

procedure TfrmCadMaquinaVeiculo.btnEditarClick(Sender: TObject);
var
 Stream : TMemoryStream;
begin
 vFilter                      :=1;
 edtPrefixo.Text              := dmdb.TMaquinasprefixo.AsString;
 vIdGrupo                     := dmdb.TMaquinasidgrupo.AsString;
 vIdSubgrupo                  := dmdb.TMaquinasidsubgrupo.AsString;
 vIdMarca                     := dmdb.TMaquinasidmarca.AsString;
 edtMarca.Text                := dmdb.TMaquinasmarca.AsString;
 edtModelo.Text               := dmdb.TMaquinasmodelo.AsString;
 edtPlaca.Text                := dmdb.TMaquinasplaca.AsString;
 cbxAno.ItemIndex             := cbxAno.Items.IndexOf(dmdb.TMaquinasano.AsString);
 edtChassi.Text               := dmdb.TMaquinaschassi.AsString;
 cbxTipoMedicao.ItemIndex     := dmdb.TMaquinastipomedicao.AsInteger;
 dmdb.TMaquinas.Edit;
 inherited;
end;
procedure TfrmCadMaquinaVeiculo.btnVoltarClick(Sender: TObject);
begin
  vFilter       :=0;
  inherited;
end;

procedure TfrmCadMaquinaVeiculo.EditButton4Click(Sender: TObject);
begin
  frmCadAuxMarcas := TfrmCadAuxMarcas.Create(Self);
  try
    frmCadAuxMarcas.ShowModal;
  finally
    vIdMarca      := dmdb.TAuxMarcaid.AsString;
    edtMarca.Text := dmdb.TAuxMarcanome.AsString;
  end;
end;

procedure TfrmCadMaquinaVeiculo.edtValorKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if ((keyChar in ['0'..'9',','] = false) and (word(key) <> vk_back)) then
 begin
   KeyChar := #0;
 end;
end;

procedure TfrmCadMaquinaVeiculo.Filtro;
var
 vFiltro:string;
begin
 vFiltro := 'status=1';
 if edtPrefixoF.Text.Length>0 then
   vFiltro := vFiltro+' and prefixo like'+ QuotedStr('%'+edtPrefixoF.Text+'%');

 if edtPlacaF.Text.Length>0 then
   vFiltro := vFiltro+' and placa like'+QuotedStr('%'+edtPlacaF.Text+'%');

 if edtNomeFiltro.Text.Length>0 then
   vFiltro := vFiltro+'and modelo like '+QuotedStr('%'+edtNomeFiltro.Text+'%');

 if edtMarcaF.Text.Length>0 then
  vFiltro := vFiltro+' and idmarca='+vIdMarca;

 if edtGrupoF.Text.Length>0 then
   vFiltro := vFiltro+' and idgrupo ='+vIdGrupo;

 if edtSubGrupoF.Text.Length>0 then
   vFiltro := vFiltro+' and idsubgrupo ='+vIdSubgrupo;
 dmdb.AbreMaquinas(vFiltro);
 lblFoterCout.Text := intToStr(GridMaquinas.RowCount)
end;

procedure TfrmCadMaquinaVeiculo.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if(tbPrincipal.TabIndex=0) and (key=13) then
  Filtro;
end;

procedure TfrmCadMaquinaVeiculo.FormShow(Sender: TObject);
begin
  vFilter            :=0;
  layImg.Visible     := false;
  lblAdd.Text        := 'Adicionar';
  lblEdit.Text       := 'Editar';
  lblDeleta.Text     := 'Deletar';
  layListaMnu.Width  := 150;
  tbPrincipal.TabPosition := TTabPosition.None;
  tbPrincipal.ActiveTab   := tbiLista;
  dmdb.AbreMaquinas('');
  lblFoterCout.Text := intToStr(GridMaquinas.RowCount)
end;

procedure TfrmCadMaquinaVeiculo.GridMaquinasCellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 Close;
end;

procedure TfrmCadMaquinaVeiculo.Image10Click(Sender: TObject);
begin
 layImg.Visible := false;
end;

procedure TfrmCadMaquinaVeiculo.LimpaCampos;
begin
 edtModelo.Text               :='';
 edtGrupo.Text                :='';
 edtSubGrupo.Text             :='';
 edtPlaca.Text                :='';
 cbxAno.ItemIndex             :=-1;
 cbxTipoMedicao.ItemIndex     :=-1;
 edtChassi.Text               :='';
 edtPrefixo.Text              :='';
end;

procedure TfrmCadMaquinaVeiculo.MenuItem1Click(Sender: TObject);
var
 I:integer;
begin
 vIdMaquina :='1';
 for I := 0 to StringGrid1.RowCount -1 do
 begin
   StringGrid1.Cells[0,i]:='True';
 end;
end;

procedure TfrmCadMaquinaVeiculo.MenuItem2Click(Sender: TObject);
var
 I:integer;
begin
 vIdMaquina :='';
 for I := 0 to StringGrid1.RowCount -1 do
 begin
   StringGrid1.Cells[0,i]:='False';
 end;
end;

procedure TfrmCadMaquinaVeiculo.mnuVerImagemClick(Sender: TObject);
var
 Stream : TMemoryStream;
begin
  if dmdb.TMaquinasImg.AsString.Length>0 then
  begin
   Stream := TMemoryStream.Create;
   dmdb.TMaquinasImg.SaveToStream(Stream);
   imgVisualizar.Bitmap.LoadFromStream(Stream);
   lblNomeProduto.Text  := dmdb.TMaquinasModelo.AsString;
   layImg.Visible := true;
  end
  else
    MyShowMessage('Maquina sem Imagem para Exibir',false);
end;

procedure TfrmCadMaquinaVeiculo.SearchEditButton1Click(Sender: TObject);
begin
  frmCadAuxMarcas := TfrmCadAuxMarcas.Create(Self);
  try
    frmCadAuxMarcas.ShowModal;
  finally
    vIdMarca        := dmdb.TAuxMarcaid.AsString;
    if vFilter=0 then
     edtMarcaF.Text := dmdb.TAuxMarcanome.AsString;
    if vFilter=1 then
     edtMarca.Text  := dmdb.TAuxMarcanome.AsString;
    frmCadAuxMarcas.Free;
  end;
end;

procedure TfrmCadMaquinaVeiculo.SearchEditButton2Click(Sender: TObject);
begin
 frmAuxGrupo := TfrmAuxGrupo.Create(Self);
  try
    frmAuxGrupo.ShowModal;
  finally
    vIdGrupo := dmdb.TAuxGrupoMaquinasid.AsString;
    if vFilter=0 then
     edtGrupoF.Text := dmdb.TAuxGrupoMaquinasnome.AsString;
    if vFilter=1 then
     edtGrupo.Text  := dmdb.TAuxGrupoMaquinasnome.AsString;
    frmAuxGrupo.Free;
  end;
end;

procedure TfrmCadMaquinaVeiculo.SearchEditButton3Click(Sender: TObject);
begin
  frmAuxSubGrupo := TfrmAuxSubGrupo.Create(Self);
  try
    frmAuxSubGrupo.ShowModal;
  finally
    vIdSubGrupo := dmdb.TAuxSubGrupoid.AsString;
    if vFilter=0 then
     edtSubGrupoF.Text := dmdb.TAuxSubGruponome.AsString;
    if vFilter=1 then
     edtSubGrupo.Text  := dmdb.TAuxSubGruponome.AsString;
    frmAuxSubGrupo.Free;
  end;
end;

procedure TfrmCadMaquinaVeiculo.StringGrid1CellClick(const Column: TColumn;
  const Row: Integer);
begin
 vIdMaquina := dmdb.TMaquinasid.AsString;
end;

procedure TfrmCadMaquinaVeiculo.StringGrid1CellDblClick(const Column: TColumn;
  const Row: Integer);
begin
 vIdMaquina := dmdb.TMaquinasid.AsString;
 if StringGrid1.ColumnIndex>0 then
  Close
 else
  StringGrid1.Cells[0,StringGrid1.Row]:='True';
end;

end.
