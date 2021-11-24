unit UStartBomba;

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
  FMX.DateTimeCtrls, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid,
  Data.Bind.DBScope;

type
  TfrmSatrtDiario = class(TfrmCadPadrao)
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    btnExcel: TRectangle;
    Image11: TImage;
    Label8: TLabel;
    layTipoReport: TLayout;
    Rectangle3: TRectangle;
    Layout10: TLayout;
    Layout20: TLayout;
    btnSemFoto: TRectangle;
    Label32: TLabel;
    Image15: TImage;
    btnComFoto: TRectangle;
    Label33: TLabel;
    Image16: TImage;
    ToolBar50552: TToolBar;
    Rectangle16: TRectangle;
    Label36: TLabel;
    Image17: TImage;
    Label4: TLabel;
    edtCentroCusto: TEdit;
    ClearEditButton1: TClearEditButton;
    SearchEditButton1: TSearchEditButton;
    SearchEditButton2: TSearchEditButton;
    cbxBombaF: TComboBox;
    GroupBox1: TGroupBox;
    Label25: TLabel;
    Label27: TLabel;
    edtDataInicio: TDateEdit;
    edtDataFim: TDateEdit;
    SaveDialog1: TSaveDialog;
    btnRepConsumo: TRectangle;
    Image10: TImage;
    Label7: TLabel;
    procedure btnExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Rectangle5Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure cbxBombaFChange(Sender: TObject);
    procedure btnBuscarListaClick(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure cbxLocalEstoqueClick(Sender: TObject);
    procedure btnBuscarFiltroClick(Sender: TObject);
    procedure btnRepConsumoClick(Sender: TObject);
    procedure Image17Click(Sender: TObject);
    procedure btnComFotoClick(Sender: TObject);
    procedure btnSemFotoClick(Sender: TObject);
  private
    procedure CarregaLocalEstoque(vIdCen: string);
  public
    var
     vIdCerntroCusto, vIdLocalEstoque:string;
    procedure Filtro;
  end;

var
  frmSatrtDiario: TfrmSatrtDiario;

implementation

{$R *.fmx}

uses UdmDB, UdmReport, ULocalEstoque, UCentrodeCusto;

{ TfrmCadPadrao1 }

procedure TfrmSatrtDiario.btnBuscarFiltroClick(Sender: TObject);
begin
 if edtCentroCusto.Text.Length=0 then
 begin
   MyShowMessage('Informe o centro de Custo!',false);
   Exit;
 end;
  Filtro;
end;

procedure TfrmSatrtDiario.btnBuscarListaClick(Sender: TObject);
begin
 Filtro;
end;

procedure TfrmSatrtDiario.btnComFotoClick(Sender: TObject);
begin
 dmReport.ppLblPeriodoStart.Text := 'De '+edtDataInicio.Text+' Ate '+edtDataFim.Text;
 BindSourceDB1.DataSet:= nil;
 dmReport.ppRepStartBombaFoto.print;
 BindSourceDB1.DataSet:= dmDB.TstartBomba;
end;

procedure TfrmSatrtDiario.btnExcelClick(Sender: TObject);
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

procedure TfrmSatrtDiario.btnRepConsumoClick(Sender: TObject);
begin
 layTipoReport.Visible := true;
end;

procedure TfrmSatrtDiario.btnSemFotoClick(Sender: TObject);
begin
 dmReport.lblPeriodoStartSemFoto.Text := 'De '+edtDataInicio.Text+' Ate '+edtDataFim.Text;
 BindSourceDB1.DataSet:= nil;
 dmReport.ppRepStartBomba.print;
 BindSourceDB1.DataSet:= dmDB.TstartBomba;
end;

procedure TfrmSatrtDiario.CarregaLocalEstoque(vIdCen: string);
var
 vQry : TFDQuery;
begin
 vQry := TFDQuery.Create(nil);
 vQry.Connection := dmDB.FDConPG;
 cbxBombaF.Items.Clear;
 cbxBombaF.Items.Add('Todas');
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('select * from localestoque');
   Add('where status=1 and idcentrocusto='+vIdCen);
   Open;
   while not vQry.Eof do
   begin
     cbxBombaF.Items.AddObject(vQry.FieldByName('nome').AsString,
      TObject(vQry.FieldByName('id').AsInteger));
     vQry.Next;
   end;
 end;
 cbxBombaF.ItemIndex :=0;
 vQry.Free;
end;

procedure TfrmSatrtDiario.cbxBombaFChange(Sender: TObject);
begin
 if cbxBombaF.ItemIndex>-1 then
  vIdLocalEstoque := IntToStr(Integer(cbxBombaF.Items.Objects[cbxBombaF.ItemIndex]));
end;

procedure TfrmSatrtDiario.cbxLocalEstoqueClick(Sender: TObject);
begin
 if edtCentroCusto.Text.Length=0 then
 begin
  MyShowMessage('Selecione o Centro de Custo antes de selecionar o Local de Estoque!',false);
  Exit;
 end;
end;

procedure TfrmSatrtDiario.Filtro;
var
 vFiltro:string;
begin
 vFiltro := '';
 if cbxBombaF.ItemIndex>0 then
  vFiltro := vFiltro+' and l.id='+vIdLocalEstoque;
 if edtCentroCusto.Text.Length>-1 then
  vFiltro := vFiltro+' and s.idcentrocusto ='+vIdCerntroCusto;
 vFiltro  := vFiltro+' and s.dataastart between '+FormatDateTime('yyyy-mm-dd',edtDataInicio.Date).QuotedString+' and '+
 FormatDateTime('yyyy-mm-dd',edtDataFim.Date).QuotedString;
 dmDB.AbreStartBomba(vFiltro);
end;

procedure TfrmSatrtDiario.FormShow(Sender: TObject);
begin
  StringGrid1.RowCount :=0;
  layTipoReport.Visible := false;
  inherited;
end;

procedure TfrmSatrtDiario.Image12Click(Sender: TObject);
begin
 layTipoReport.Visible := false;
end;

procedure TfrmSatrtDiario.Image17Click(Sender: TObject);
begin
 layTipoReport.Visible := false;
end;

procedure TfrmSatrtDiario.Rectangle5Click(Sender: TObject);
begin
  layTipoReport.Visible := true;
end;

procedure TfrmSatrtDiario.SearchEditButton1Click(Sender: TObject);
begin
  frmCentroCusto := TfrmCentroCusto.Create(Self);
  try
    frmCentroCusto.ShowModal;
  finally
    vIdCerntroCusto      := dmDB.TCentroCustoid.AsString;
    edtCentroCusto.Text  := dmDB.TCentroCustonome.AsString;
    CarregaLocalEstoque(vIdCerntroCusto);
  end;
end;

end.

