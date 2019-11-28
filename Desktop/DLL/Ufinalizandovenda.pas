unit Ufinalizandovenda;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  Tfrmfinalizandovenda = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    Layout3: TLayout;
    Image1: TImage;
    Rectangle3: TRectangle;
    lblcodigodavenda: TLabel;
    Layout4: TLayout;
    lbltroco: TLabel;
    Layout5: TLayout;
    lbltotalvenda: TLabel;
    BtnOK: TRoundRect;
    Label2: TLabel;
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Click : integer;
  end;

var
  frmfinalizandovenda: Tfrmfinalizandovenda;

implementation

{$R *.fmx}


procedure Tfrmfinalizandovenda.BtnOKClick(Sender: TObject);
begin
Click := (Sender as TRoundRect).Tag;
Self.Close;
end;

procedure Tfrmfinalizandovenda.FormShow(Sender: TObject);
begin
Click := 0;
self.WindowState := TWindowState.wsMaximized;
end;


end.
