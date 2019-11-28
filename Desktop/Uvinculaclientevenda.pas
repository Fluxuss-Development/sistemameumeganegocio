unit Uvinculaclientevenda;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FMX.Objects, FMX.Edit, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView,
  FMX.Layouts;

type
  Tfrmvinculaclientevenda = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    lsclientevenda: TListView;
    Layout3: TLayout;
    Label1: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    edtbuscar: TEdit;
    btnbuscar: TRoundRect;
    Label2: TLabel;
    procedure btnbuscarClick(Sender: TObject);
    procedure lsclientevendaItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmvinculaclientevenda: Tfrmvinculaclientevenda;

implementation

{$R *.fmx}

uses Umodulo, Uvenda;

//DLL DAS MENSAGENS CUSTOMIZADAS
function mostraMensagem(Msg1, Msg2, btn1: string): integer; stdcall;
  external 'PexibirMensagem.dll' name 'mostraMensagem';
//FIM DO DLL

procedure Tfrmvinculaclientevenda.btnbuscarClick(Sender: TObject);
begin
dm.consultacliente.Close;
dm.consultacliente.SQL.Text := 'SELECT * from clientes where cliativo = 1 and clinome like ' + QuotedStr(edtbuscar.Text + '%');
dm.consultacliente.Open;
end;

procedure Tfrmvinculaclientevenda.lsclientevendaItemClickEx(
  const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
dm.consultacliente.RecNo := lsclientevenda.Selected.Index + 1;
frmvenda.edtcpfcli.Text := dm.consultaclienteclicpf.AsString;
mostraMensagem('O Cliente ' + dm.consultaclienteclinome.AsString + ' foi vinculado a venda !', 'O Cliente ' + dm.consultaclienteclinome.AsString + ' foi vinculado a venda !', 'OK');
frmvinculaclientevenda.Close;
end;

end.
