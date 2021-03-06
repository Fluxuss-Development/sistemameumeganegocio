unit Uconsultavendas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, FMX.ListView,
  FMX.Ani, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation, FMX.Edit,
  FMX.Layouts, FMX.DateTimeCtrls;

type
  Tfrmconsultarvendas = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    edtbuscar: TEdit;
    BtnBuscar: TRoundRect;
    Label1: TLabel;
    ScaleX: TFloatAnimation;
    ScaleY: TFloatAnimation;
    lsconsultavenda: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure BtnBuscarClick(Sender: TObject);
    procedure lsconsultavendaItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure FormShow(Sender: TObject);
    procedure edtbuscarKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconsultarvendas: Tfrmconsultarvendas;

implementation

{$R *.fmx}

uses Umodulo, Udetalhesvenda;

procedure Tfrmconsultarvendas.BtnBuscarClick(Sender: TObject);
begin
dm.viewexibedetalhesvendas.Close;                      //pega somente as vendas que render�o algum valor ou seja foram finalizadas
dm.viewexibedetalhesvendas.SQL.Text := 'select * from exibedetalhesvendas where ventotal > 0 and clinome like ' + QuotedStr(edtbuscar.Text + '%');
dm.viewexibedetalhesvendas.Open;
end;

procedure Tfrmconsultarvendas.edtbuscarKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
//DEIXA TUDO MAI�SCULO NA EDIT
keychar := UpCase(KeyChar);
end;

procedure Tfrmconsultarvendas.FormShow(Sender: TObject);
begin
dm.viewexibedetalhesvendas.Close;
end;

procedure Tfrmconsultarvendas.lsconsultavendaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
//vari�vel para cacatenar os m�todos de pagamento
var
metodospagamento : string;
begin
dm.viewexibedetalhesvendas.RecNo := lsconsultavenda.Selected.Index + 1;
frmdetalhesdavenda.lblcodigodavenda.Text := 'C�digo da venda: ' + dm.viewexibedetalhesvendasvencod.AsString;
frmdetalhesdavenda.lbldatavenda.Text := 'Data de venda: ' + dm.viewexibedetalhesvendasvendataven.AsString;
frmdetalhesdavenda.lbltotalvenda.Text := 'Total da venda: R$' + dm.viewexibedetalhesvendasventotal.AsString;
frmdetalhesdavenda.lbldesconto.Text := 'Desconto da venda: R$' + dm.viewexibedetalhesvendasvendesconto.AsString;
frmdetalhesdavenda.lblcliente.Text := 'Cliente: ' + dm.viewexibedetalhesvendasclinome.AsString;
frmdetalhesdavenda.lblvendedor.Text := 'Vendedor: ' + dm.viewexibedetalhesvendasempnome.AsString;
frmdetalhesdavenda.lblcodigocaixa.Text := 'C�digo do caixa: ' + dm.viewexibedetalhesvendasvencaicod.AsString;
frmdetalhesdavenda.lblmetodopag.Text := 'M�todo de pagamento dessa venda: ';
//rotina que vai percorrer tudo e trazer todos os m�todos de pagamentos
frmdetalhesdavenda.codigodavendaparafazeroselect := dm.viewexibedetalhesvendasvencod.AsString;
frmdetalhesdavenda.Show;
frmconsultarvendas.Close;
end;

end.
