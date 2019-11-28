unit Ugraficosdosistema;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMXTee.Engine, FMXTee.Series, FMXTee.Procs, FMXTee.Chart;

type
  Tfrmgraficosdosistema = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Chart1: TChart;
    Series1: TFastLineSeries;
    Rectangle2: TRectangle;
    Chart2: TChart;
    Series2: TFastLineSeries;
    Chart3: TChart;
    Series3: TFastLineSeries;
    Chart4: TChart;
    Series4: TFastLineSeries;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmgraficosdosistema: Tfrmgraficosdosistema;

implementation

{$R *.fmx}

uses Umodulo;

//DLL DAS MENSAGENS CUSTOMIZADAS
function mostraMensagem(Msg1, Msg2, btn1: string): integer; stdcall;
  external 'PexibirMensagem.dll' name 'mostraMensagem';
//FIM DO DLL

procedure Tfrmgraficosdosistema.FormShow(Sender: TObject);
var
i: integer;
begin
try
  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
  Series4.Clear;
  dm.consultaparaanalytics.Close;
  dm.consultaparaanalytics.SQL.Text := 'SELECT * FROM vendas where ventotal > 0 and DAYOFMONTH(vendataven) = DAYOFMONTH(" ' + FormatDateTime('yyyy-mm-dd-', date) + '")';
  dm.consultaparaanalytics.Open;
  dm.consultaparaanalytics.First;
  i := 0;
  while not dm.consultaparaanalytics.Eof do
  begin
    i := i + 1;
    Series1.AddXY(i, dm.consultaparaanalytics.FieldByName('ventotal').AsFloat);
    dm.consultaparaanalytics.Next;
  end;

  dm.consultaparaanalytics.Close;
  dm.consultaparaanalytics.SQL.Text := 'SELECT * FROM caixas where DAYOFMONTH(caiaberto) = DAYOFMONTH(" ' + FormatDateTime('yyyy-mm-dd-', date) + '")';
  dm.consultaparaanalytics.Open;
  dm.consultaparaanalytics.First;
  while not dm.consultaparaanalytics.Eof do
  begin
    Series2.AddXY(dm.consultaparaanalytics.FieldByName('caivlrabert').AsFloat ,dm.consultaparaanalytics.FieldByName('caivlrfech').AsFloat);
    dm.consultaparaanalytics.Next;
  end;

  dm.consultaparaanalytics.Close;
  dm.consultaparaanalytics.SQL.Text := 'SELECT * FROM vendas where ventotal > 0 and MONTH(vendataven) = MONTH(" ' + FormatDateTime('yyyy-mm-dd-', date) + '")';
  dm.consultaparaanalytics.Open;
  dm.consultaparaanalytics.First;

  i := 0;
  while not dm.consultaparaanalytics.Eof do
  begin
    i := i + 1;
    Series3.AddXY(i ,dm.consultaparaanalytics.FieldByName('ventotal').AsFloat);
    dm.consultaparaanalytics.Next;
  end;

  dm.consultaparaanalytics.Close;
  dm.consultaparaanalytics.SQL.Text := 'SELECT * FROM vendas where ventotal > 0 and YEAR(vendataven) = YEAR(" ' + FormatDateTime('yyyy-mm-dd-', date) + '")';
  dm.consultaparaanalytics.Open;
  dm.consultaparaanalytics.First;
  i := 0;
  while not dm.consultaparaanalytics.Eof do
  begin
    i := i + 1;
    Series4.AddXY(i ,dm.consultaparaanalytics.FieldByName('ventotal').AsFloat);
    dm.consultaparaanalytics.Next;
  end;
except
// ShowMessage('Ocorreu um erro ao gerar seus flows(Gráficos) !');
 mostraMensagem('Ocorreu um erro ao gerar seus flows(Gráficos) !', 'Ocorreu um erro ao gerar seus flows(Gráficos) !', 'OK');
end;
end;

end.
