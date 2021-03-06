unit Uconsultafornecedor;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.ListView, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  Tfrmconsultafornecedor = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    lsfornecedores: TListView;
    Layout3: TLayout;
    Label1: TLabel;
    edtbuscar: TEdit;
    btnbuscar: TRoundRect;
    Label2: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure btnbuscarClick(Sender: TObject);
    procedure lsfornecedoresItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconsultafornecedor: Tfrmconsultafornecedor;

implementation

{$R *.fmx}

uses Umodulo, Ucadfornecedores;

procedure Tfrmconsultafornecedor.btnbuscarClick(Sender: TObject);
begin
dm.consultafornecedor.Close;
dm.consultafornecedor.SQL.Text := 'select * from fornecedores where fornome like ' + QuotedStr(edtbuscar.Text + '%');
dm.consultafornecedor.Open;
end;

procedure Tfrmconsultafornecedor.lsfornecedoresItemClickEx(
  const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
dm.consultafornecedor.RecNo := lsfornecedores.Selected.Index + 1;
frmcadfornecedor.edtnomefor.Text := dm.consultafornecedorfornome.AsString;
frmcadfornecedor.edtendfor.Text := dm.consultafornecedorforendereco.AsString;
frmcadfornecedor.edttelefonefor.Text := dm.consultafornecedorfortelefone.AsString;
frmcadfornecedor.edtcelular.Text := dm.consultafornecedorforcelular.AsString;
frmcadfornecedor.edtcomentariosfor.Text := dm.consultafornecedorforcomentarios.AsString;
frmcadfornecedor.codigo_do_fornecedor_para_alteracao := dm.consultafornecedorforcod.AsInteger;
frmcadfornecedor.btncadastrar.Visible := false;
frmcadfornecedor.btnalterar.Visible := true;
frmconsultafornecedor.Hide;
frmcadfornecedor.Show;
end;

end.
