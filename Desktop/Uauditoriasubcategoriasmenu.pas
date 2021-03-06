unit Uauditoriasubcategoriasmenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  Tfrmauditoriasubcategorias = class(TForm)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    RoundRect1: TRoundRect;
    RoundRect2: TRoundRect;
    Label1: TLabel;
    Label2: TLabel;
    procedure RoundRect2Click(Sender: TObject);
    procedure RoundRect1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmauditoriasubcategorias: Tfrmauditoriasubcategorias;

implementation

{$R *.fmx}

uses Uativarsubcategoria, Udesativarsubcategoria;

procedure Tfrmauditoriasubcategorias.RoundRect1Click(Sender: TObject);
begin
frmdesativarsubcategoria.ShowModal;
end;

procedure Tfrmauditoriasubcategorias.RoundRect2Click(Sender: TObject);
begin
frmativarsubcategoria.ShowModal;
end;

end.
