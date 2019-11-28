unit Uativarcategoria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.Objects, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  Tfrmativarcategorias = class(TForm)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Label1: TLabel;
    lsativarcategoria: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure FormShow(Sender: TObject);
    procedure lsativarcategoriaItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmativarcategorias: Tfrmativarcategorias;

implementation

{$R *.fmx}

uses Umodulo, Ulogin, Umenu;

//DLL DAS MENSAGENS CUSTOMIZADAS
function mostraMensagem(Msg1, Msg2, btn1: string): integer; stdcall;
  external 'PexibirMensagem.dll' name 'mostraMensagem';
//FIM DO DLL


procedure Tfrmativarcategorias.FormShow(Sender: TObject);
begin
dm.consultacategoria.Close;
dm.consultacategoria.SQL.Text := 'select * from categorias where cateativo = 0';
dm.consultacategoria.Open;
end;

procedure Tfrmativarcategorias.lsativarcategoriaItemClickEx(
  const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
  var
   comentario : string;
begin
dm.consultacategoria.RecNo := lsativarcategoria.Selected.Index + 1;
dm.ativacategorias.Params.ParamByName('catecod').Value := dm.consultacategoriacatecod.AsInteger;
dm.ativacategorias.Prepare;
dm.ativacategorias.ExecSQL;
comentario := 'Categoria ' + dm.consultacategoriacatenome.AsString + ' ativada, pelo ' + frmlogin.nome_do_usuario_logado_para_proteger_integridade_do_sistema;
dm.inserelogalteracoes.Params.ParamByName('logcomentario').Value := comentario;
dm.inserelogalteracoes.Params.ParamByName('codemp').Value := frmmenu.empresarioid;
dm.inserelogalteracoes.Prepare;
dm.inserelogalteracoes.ExecSQL;
//ShowMessage('Categoria ativada com sucesso ::: ' + dm.consultacategoriacatenome.AsString);
mostraMensagem('Categoria ativada com sucesso ::: ' + dm.consultacategoriacatenome.AsString, 'Categoria ativada com sucesso ::: ' + dm.consultacategoriacatenome.AsString, 'OK');
dm.consultacategoria.Close;
dm.consultacategoria.Open;
end;

end.