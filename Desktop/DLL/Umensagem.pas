unit Umensagem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Ani;

type
  Tfrmmensagem = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    lbltextomensagem: TLabel;
    mensagemacao: TLabel;
    btnok: TRoundRect;
    lbltextomensagembotao: TLabel;
    ScaleX: TFloatAnimation;
    ScaleY: TFloatAnimation;
    procedure btnokClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Click : integer;
  end;

var
  frmmensagem: Tfrmmensagem;

implementation

{$R *.fmx}

//VIDEO QUE ENSINOU PARA MIM O MASSETE DE USAR A DLL
//https://youtu.be/sfBqyjFnsDo

procedure Tfrmmensagem.btnokClick(Sender: TObject);
begin
  Click := (Sender as TRoundRect).Tag;
  Self.Close;
end;

procedure Tfrmmensagem.FormShow(Sender: TObject);
begin
Click := 0;
self.WindowState := TWindowState.wsMaximized;
btnok.Visible := lbltextomensagembotao.Text <> '';
end;

end.
