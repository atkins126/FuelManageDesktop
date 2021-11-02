unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.TabControl, FMX.Ani, FMX.ActnList, System.Actions,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.TreeView,Winapi.Windows,
  FMX.Effects, System.Notification, FMX.ScrollBox, FMX.Memo, FMX.WebBrowser,
  shellapi, FMX.Memo.Types, View.WebCharts,Charts.Types;

type
  TfrmPrincipal = class(TForm)
    tbPrincipal: TTabControl;
    tbiLogin: TTabItem;
    tbiMenu: TTabItem;
    layLogin: TLayout;
    Image2: TImage;
    layMnuPrincipal: TLayout;
    Layout2: TLayout;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    AcMudarAbaChart: TAction;
    AcMudarAbaDespesas: TAction;
    AcLeft: TAction;
    AcRigth: TAction;
    Timer1: TTimer;
    StyleBook1: TStyleBook;
    layLoginAnimaiton: TLayout;
    recLogin: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    Label1: TLabel;
    edtUsuario: TEdit;
    Label2: TLabel;
    edtSenha: TEdit;
    Layout5: TLayout;
    btnEntrar: TRectangle;
    Label3: TLabel;
    Image4: TImage;
    Layout6: TLayout;
    Image1: TImage;
    Animation: TFloatAnimation;
    AnimationPrincipal: TFloatAnimation;
    ToolBar1: TToolBar;
    ToolBar3: TToolBar;
    Label4: TLabel;
    Image16: TImage;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    lblVersao: TLabel;
    NotificationCenter1: TNotificationCenter;
    laySync: TLayout;
    Rectangle5: TRectangle;
    Layout1: TLayout;
    Layout7: TLayout;
    imgSync: TImage;
    Label6: TLabel;
    ProgressBarSync: TProgressBar;
    msmoSync: TMemo;
    Animacao: TFloatAnimation;
    Rectangle6: TRectangle;
    layMnu: TLayout;
    AnimacaoMnu: TFloatAnimation;
    TreeMnu: TTreeView;
    TreeCadastrosGerais: TTreeViewItem;
    TreeViewItem1: TTreeViewItem;
    Image5: TImage;
    TreeExAuxiliares: TTreeViewItem;
    TreeAuxMarca: TTreeViewItem;
    Image13: TImage;
    TreeGrupoMaquina: TTreeViewItem;
    Image14: TImage;
    Image12: TImage;
    Image27: TImage;
    ShadowEffect1: TShadowEffect;
    ToolBar2: TToolBar;
    Rectangle2: TRectangle;
    lblVersao2: TLabel;
    lblTipoDB: TLabel;
    lblPathDB: TLabel;
    ToolBar4: TToolBar;
    Rectangle1: TRectangle;
    mnu: TImage;
    btnFechar: TImage;
    Label5: TLabel;
    Rectangle7: TRectangle;
    layDash: TLayout;
    TreeAbastecimento: TTreeViewItem;
    Image8: TImage;
    WebCharts1: TWebCharts;
    Layout16: TLayout;
    Image3: TImage;
    TreeSubGrupo: TTreeViewItem;
    Image9: TImage;
    TreeAuxOperador: TTreeViewItem;
    Image10: TImage;
    TreeAuxAtividade: TTreeViewItem;
    Image11: TImage;
    TreeProdutos: TTreeViewItem;
    Image6: TImage;
    TreeMaquinas: TTreeViewItem;
    Image7: TImage;
    TreeCentroCusto: TTreeViewItem;
    Image17: TImage;
    TreeEstoque: TTreeViewItem;
    Image18: TImage;
    TreeFornecedores: TTreeViewItem;
    Image19: TImage;
    TreeEntradaNF: TTreeViewItem;
    Image20: TImage;
    TreeLocalEstoque: TTreeViewItem;
    Image21: TImage;
    TreeSaidaEstoque: TTreeViewItem;
    Image22: TImage;
    TreeMovEstoque: TTreeViewItem;
    Image23: TImage;
    TreeStartDiario: TTreeViewItem;
    Image15: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure TreeExAuxiliaresClick(Sender: TObject);
    procedure TreeExAgriculturaClick(Sender: TObject);
    procedure mnuClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure TreeCadastrosGeraisClick(Sender: TObject);
    procedure TreeViewItem1Click(Sender: TObject);
    procedure TreeAuxMarcaClick(Sender: TObject);
    procedure TreeGrupoMaquinaClick(Sender: TObject);
    procedure TreeSubGrupoClick(Sender: TObject);
    procedure TreeAuxOperadorClick(Sender: TObject);
    procedure TreeAuxAtividadeClick(Sender: TObject);
    procedure TreeProdutosClick(Sender: TObject);
    procedure TreeMaquinasClick(Sender: TObject);
    procedure TreeCentroCustoClick(Sender: TObject);
    procedure TreeAbastecimentoClick(Sender: TObject);
    procedure TreeLocalEstoqueClick(Sender: TObject);
    procedure TreeFornecedoresClick(Sender: TObject);
    procedure TreeEntradaNFClick(Sender: TObject);
    procedure TreeEstoqueClick(Sender: TObject);
    procedure TreeSaidaEstoqueClick(Sender: TObject);
    procedure TreeMovEstoqueClick(Sender: TObject);
    procedure TreeStartDiarioClick(Sender: TObject);
  private
    vWebBrowser:TWebBrowser;
    procedure ReCreateBrowser(URL: STRING);
  public
    vPositionX,vPositionY:Single;
    iTimer,vMsgConfirma,vTSelectTalhao :integer;
    procedure MudarAba(ATabItem: TTabItem; sender: TObject);
    procedure MyShowMessage(msg: string;btnCancel:Boolean);
    function  GetVersaoArq: string;
    procedure Notificacao(Titulo,Notificacao:string);
    procedure GeraDash;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses UMsgDlg,UCadPadrao, UdmDB, UUsuarios, UAuxMarcas, UAuxGrupo, UAuxSubGrupo,
  UOperadorMaquinas, UAuxAtividadeAbastecimento, UProdutos, UCadMaquina,
  UCentrodeCusto, UAbastecimento, LocalEstoque, UFornecedor, UEntradaEstoque,
  USaidaEstoque, UMovEntreLocalEstoque, UStartBomba;

procedure TfrmPrincipal.Notificacao(Titulo,Notificacao:string);
var
  MyNotification: TNotification;
  iOcorrencia,iEvento:integer;
begin
  MyNotification := NotificationCenter1.CreateNotification;
  try
    MyNotification.Name := 'NotificationOcorrencias';
    MyNotification.Title := Titulo;
    MyNotification.AlertBody := Notificacao;
    NotificationCenter1.PresentNotification(MyNotification);
  finally
    MyNotification.Free;
  end;
end;

procedure TfrmPrincipal.ReCreateBrowser(URL: STRING);
begin
    layDash.Visible            := true;
    vWebBrowser                := TWebBrowser.Create(LayDash);
    vWebBrowser.Name           := 'WebBrowser';
    vWebBrowser.Parent         := LayDash;
    vWebBrowser.Visible        := true;
    vWebBrowser.Margins.Top    := 10;
    vWebBrowser.Margins.Left   := 10;
    vWebBrowser.Align          := TAlignLayout.Client;
    vWebBrowser.Opacity        := 0.5;
    vWebBrowser.URL :=URL;
end;

procedure TfrmPrincipal.GeraDash;
begin
 
end;

function TfrmPrincipal.GetVersaoArq: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(
  ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0,
  VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue),
  VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(
    dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(
    dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(
    dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

procedure TfrmPrincipal.btnEntrarClick(Sender: TObject);
begin
 if edtUsuario.Text.Length=0 then
 begin
  MyShowMessage('Informe o Usuario',false);
  edtUsuario.SetFocus;
  Exit;
 end;
 if edtSenha.Text.Length=0 then
 begin
  MyShowMessage('Informe a Senha',false);
  edtSenha.SetFocus;
  Exit;
 end;
 if not dmdb.ValidaUsuario(edtUsuario.Text, edtSenha.Text) then
 begin
  MudarAba(tbiMenu,Sender);
  AnimacaoMnu.Start;
 end
 else
 begin
  MyShowMessage('Usuario ou Senha invalidos!',false);
  edtSenha.SetFocus;
  edtSenha.SelectAll;
 end;
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TfrmPrincipal.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
  btnEntrarClick(sender);
end;

procedure TfrmPrincipal.edtUsuarioExit(Sender: TObject);
begin
 TThread.CreateAnonymousThread(procedure()
 begin
  TThread.Synchronize(TThread.CurrentThread,
  procedure ()
  begin
    edtSenha.SetFocus;
  end);
 end).Start;
end;

procedure TfrmPrincipal.edtUsuarioKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
  btnEntrarClick(sender);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
 Timer1.Enabled   := false;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
 Arquivo,
 vDataBase,vServer,vUser_name,vPassword,vPorta :string;
begin
 Arquivo := ExtractFilePath(ParamStr(0))+'ReplyAWS.exe';
 if(Key=VK_F5) then
 begin
  if not FileExists(Arquivo) then
  begin
    ShowMessage('Arquivo ReplyAWS.exe não localizado no seguinte diretorio:'+#13+
    Arquivo);
    Exit;
  end
  else
   ShellExecute(GetDesktopWindow,'open',pchar(Arquivo),nil,nil,sw_show);
 end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  dmdb.ConectaPG;
  GeraDash;
  TreeMnu.CollapseAll;
  laySync.Visible := false;
  lblVersao.Text            := 'Versão: '+GetVersaoArq;
  lblVersao2.Text           := 'Versão: '+GetVersaoArq;
  layMnu.Opacity            := 0;
  tbPrincipal.TabPosition   := TTabPosition.None;
  tbPrincipal.ActiveTab     := tbiLogin;
  layLoginAnimaiton.Visible := false;
  Timer1.Enabled            := true;
  edtUsuario.SetFocus;
end;

procedure TfrmPrincipal.mnuClick(Sender: TObject);
begin
 if layMnu.Width=250 then
  layMnu.Width:=0
 else
  layMnu.Width:=250
end;

procedure TfrmPrincipal.MudarAba(ATabItem: TTabItem; sender: TObject);
begin
   actMudarAba.Tab := ATabItem;
   actMudarAba.ExecuteTarget(sender);
end;

procedure TfrmPrincipal.MyShowMessage(msg: string; btnCancel: Boolean);
var
 dlg :TFrmmsgDlg;
begin
  dlg := TFrmmsgDlg.Create(nil);
  dlg.Position := TFormPosition.ScreenCenter;
  dlg.msg.Text := msg;
  dlg.btnCancel.Visible := btnCancel;
  dlg.ShowModal(
  procedure(ModalResult: TModalResult)
  begin
  end);
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
 layLoginAnimaiton.Visible := true;
 Animation.Start;
 Timer1.Enabled := false;
end;

procedure TfrmPrincipal.TreeEntradaNFClick(Sender: TObject);
begin
  frmCadEntradaEstoque := TfrmCadEntradaEstoque.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadEntradaEstoque.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadEntradaEstoque.Free;
  end;
end;

procedure TfrmPrincipal.TreeExAgriculturaClick(Sender: TObject);
begin
 TreeExAuxiliares.IsExpanded := false;
end;

procedure TfrmPrincipal.TreeExAuxiliaresClick(Sender: TObject);
begin
 if TreeExAuxiliares.IsExpanded then
  TreeExAuxiliares.IsExpanded := false
 else
  TreeExAuxiliares.IsExpanded := true;
end;

procedure TfrmPrincipal.TreeFornecedoresClick(Sender: TObject);
begin
  frmCadFornecedor := TfrmCadFornecedor.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadFornecedor.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadFornecedor.Free;
  end;
end;

procedure TfrmPrincipal.TreeGrupoMaquinaClick(Sender: TObject);
begin
  frmAuxGrupo := TfrmAuxGrupo.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAuxGrupo.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAuxGrupo.Free;
  end;
end;

procedure TfrmPrincipal.TreeLocalEstoqueClick(Sender: TObject);
begin
  frmLocalEstoque := frmLocalEstoque.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmLocalEstoque.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmLocalEstoque.Free;
  end;
end;

procedure TfrmPrincipal.TreeMaquinasClick(Sender: TObject);
begin
 frmCadMaquinaVeiculo := TfrmCadMaquinaVeiculo.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadMaquinaVeiculo.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadMaquinaVeiculo.Free;
  end;
end;

procedure TfrmPrincipal.TreeMovEstoqueClick(Sender: TObject);
begin
  frmMovLocalEstoque := TfrmMovLocalEstoque.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmMovLocalEstoque.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmMovLocalEstoque.Free;
  end;
end;

procedure TfrmPrincipal.TreeProdutosClick(Sender: TObject);
begin
  frmCadProdutos := TfrmCadProdutos.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadProdutos.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadProdutos.Free;
  end;
end;

procedure TfrmPrincipal.TreeSaidaEstoqueClick(Sender: TObject);
begin
 frmSaidaEstoque := TfrmSaidaEstoque.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmSaidaEstoque.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmSaidaEstoque.Free;
  end;
end;

procedure TfrmPrincipal.TreeStartDiarioClick(Sender: TObject);
begin
  frmSatrtDiario := TfrmSatrtDiario.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmSatrtDiario.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmSatrtDiario.Free;
  end;
end;

procedure TfrmPrincipal.TreeSubGrupoClick(Sender: TObject);
begin
 frmAuxSubgrupo := TfrmAuxSubgrupo.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAuxSubgrupo.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAuxSubgrupo.Free;
  end;
end;

procedure TfrmPrincipal.TreeViewItem1Click(Sender: TObject);
begin
  frmUsuarios := TfrmUsuarios.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmUsuarios.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmUsuarios.Free;
  end;
end;

procedure TfrmPrincipal.TreeEstoqueClick(Sender: TObject);
begin
if TreeEstoque.IsExpanded then
  TreeEstoque.IsExpanded := false
 else
 begin
  TreeMnu.CollapseAll;
  TreeEstoque.IsExpanded := true;
 end;
end;

procedure TfrmPrincipal.TreeAbastecimentoClick(Sender: TObject);
begin
  frmAbastecimento := TfrmAbastecimento.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAbastecimento.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAbastecimento.Free;
  end;
end;

procedure TfrmPrincipal.TreeAuxAtividadeClick(Sender: TObject);
begin
   frmAuxAtividadeAbastecimento := TfrmAuxAtividadeAbastecimento.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmAuxAtividadeAbastecimento.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmAuxAtividadeAbastecimento.Free;
  end;
end;

procedure TfrmPrincipal.TreeAuxMarcaClick(Sender: TObject);
begin
  frmCadAuxMarcas := TfrmCadAuxMarcas.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCadAuxMarcas.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCadAuxMarcas.Free;
  end;
end;

procedure TfrmPrincipal.TreeAuxOperadorClick(Sender: TObject);
begin
  frmOperadorMaquinas := TfrmOperadorMaquinas.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmOperadorMaquinas.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmOperadorMaquinas.Free;
  end;
end;

procedure TfrmPrincipal.TreeCadastrosGeraisClick(Sender: TObject);
begin
 if TreeCadastrosGerais.IsExpanded then
  TreeCadastrosGerais.IsExpanded := false
 else
 begin
  TreeMnu.CollapseAll;
  TreeCadastrosGerais.IsExpanded := true;
 end;
end;

procedure TfrmPrincipal.TreeCentroCustoClick(Sender: TObject);
begin
  frmCentroCusto := TfrmCentroCusto.Create(Self);
  try
    layMnuPrincipal.Opacity :=0;
    frmCentroCusto.ShowModal;
  finally
    AnimationPrincipal.Start;
    frmCentroCusto.Free;
  end;
end;

end.
