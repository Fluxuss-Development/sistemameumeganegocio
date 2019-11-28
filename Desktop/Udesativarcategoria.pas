unit Udesativarcategoria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.Objects, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  Tfrmdesativarcategoria = class(TForm)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Label1: TLabel;
    lsdesativarcategoria: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure lsdesativarcategoriaItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmdesativarcategoria: Tfrmdesativarcategoria;

implementation

{$R *.fmx}

uses Umodulo, Ulogin, Umenu;

//DLL DAS MENSAGENS CUSTOMIZADAS
function mostraMensagem(Msg1, Msg2, btn1: string): integer; stdcall;
  external 'PexibirMensagem.dll' name 'mostraMensagem';
//FIM DO DLL

procedure Tfrmdesativarcategoria.FormShow(Sender: TObject);
begin
dm.consultacategoria.Close;
dm.consultacategoria.SQL.Text := 'select * from categorias where cateativo = 1';
dm.consultacategoria.Open;
end;

procedure Tfrmdesativarcategoria.lsdesativarcategoriaItemClickEx(
  const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
    var
   comentario : string;
begin
dm.consultacategoria.RecNo := lsdesativarcategoria.Selected.Index + 1;
dm.desativarcategorias.Params.ParamByName('catecod').Value := dm.consultacategoriacatecod.AsInteger;
dm.desativarcategorias.Prepare;
dm.desativarcategorias.ExecSQL;
comentario := 'Categoria ' + dm.consultacategoriacatenome.AsString + ' desativada, pelo ' + frmlogin.nome_do_usuario_logado_para_proteger_integridade_do_sistema;
dm.inserelogalteracoes.Params.ParamByName('logcomentario').Value := comentario;
dm.inserelogalteracoes.Params.ParamByName('codemp').Value := frmmenu.empresarioid;
dm.inserelogalteracoes.Prepare;
dm.inserelogalteracoes.ExecSQL;
//ShowMessage('Categoria desativada com sucesso ::: ' + dm.consultacategoriacatenome.AsString);
mostraMensagem('Categoria desativada com sucesso ::: ' + dm.consultacategoriacatenome.AsString, 'Categoria desativada com sucesso ::: ' + dm.consultacategoriacatenome.AsString, 'OK');
dm.consultacategoria.Close;
dm.consultacategoria.Open;
end;

end.