unit Urelatorios;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  Tfrmrelatorios = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    btngerarrelatorio: TRoundRect;
    btnvisualizarrelatorios: TRoundRect;
    Label2: TLabel;
    Label1: TLabel;
    procedure btnvisualizarrelatoriosClick(Sender: TObject);
    procedure btngerarrelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelatorios: Tfrmrelatorios;

implementation

{$R *.fmx}

uses Urelatoriossalvos, Ugerarrelatorio;

procedure Tfrmrelatorios.btngerarrelatorioClick(Sender: TObject);
begin
frmgerarrelatorio.ShowModal;
end;

procedure Tfrmrelatorios.btnvisualizarrelatoriosClick(Sender: TObject);
begin
frmrelatoriossalvos.ShowModal;
end;

end.
