unit Uvenda;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.ListView, FMX.Layouts,
  FMX.Objects, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,          //FireDAC.Stan.Param evita warning
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FireDAC.Stan.Param;

type
  Tfrmvenda = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    lsitenvendas: TListView;
    Layout3: TLayout;
    edtcpfcli: TEdit;
    Label1: TLabel;
    lblcaixa: TLabel;
    Timer1: TTimer;
    lblhoradata: TLabel;
    Rectangle1: TRectangle;
    edtcodprod: TEdit;
    Label2: TLabel;
    Layout4: TLayout;
    btnbuscacodpro: TSpeedButton;
    edtquant: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtvalorunit: TEdit;
    lblmostracodigodavenda: TLabel;
    Line1: TLine;
    lblventotal: TLabel;
    Label6: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    Layout5: TLayout;
    btnbuscarclientecpf: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure edtcpfcliChange(Sender: TObject);
    procedure edtcpfcliKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure btnbuscacodproClick(Sender: TObject);
    procedure edtquantKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnbuscarclientecpfClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //para armazenar o id do cliente
    iddoclienteparaabrirvenda : integer;
    codigodavenda :integer;
    totalvenda : real;
  end;

var
  frmvenda: Tfrmvenda;

implementation

{$R *.fmx}

uses Umenu, Umodulo, Uconsultaprodutos, Ufechavenda, Uvinculaclientevenda;

//DLL DAS MENSAGENS CUSTOMIZADAS
function mostraMensagem(Msg1, Msg2, btn1: string): integer; stdcall;
  external 'PexibirMensagem.dll' name 'mostraMensagem';
//FIM DO DLL

procedure Tfrmvenda.btnbuscarclientecpfClick(Sender: TObject);
begin
frmvinculaclientevenda.ShowModal;
end;

procedure Tfrmvenda.edtcpfcliChange(Sender: TObject);
begin

end;

// key down tem o mesmo efeito do keypress do vcl
//documenta��o seguida:
// http://docwiki.embarcadero.com/Libraries/Tokyo/en/FMX.Forms.TCommonCustomForm.KeyDown
//padr�o de teclas segundo microsoft para usar
//https://docs.microsoft.com/en-us/windows/desktop/inputdev/virtual-key-codes
procedure Tfrmvenda.edtcpfcliKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin       //enter pressionado
  if key = $0D then
  begin
    dm.consultacliente.Close;
    dm.consultacliente.SQL.Text := 'select * from clientes where clicpf = ' + QuotedStr(edtcpfcli.Text);
    dm.consultacliente.Open;
    iddoclienteparaabrirvenda := dm.consultaclienteclicod.AsInteger;
    if(dm.consultacliente.RecordCount = 1) then
    begin
      //ShowMessage('Cliente valido pertence a : ' + dm.consultaclienteclinome.AsString);
      mostraMensagem('Cliente valido pertence a : ' + dm.consultaclienteclinome.AsString, 'Cliente valido pertence a : ' + dm.consultaclienteclinome.AsString, 'OK');
      //consulta para ver se j� possui uma venda aberta para o caixa id !
      dm.consultavenda.Close;
      dm.consultavenda.SQL.Text := 'select * from vendas where venclicod = ' + dm.consultaclienteclicod.AsString + ' and vencaicod = ' + IntToStr(frmmenu.codigodocaixaaberto) + ' and ventotal like' + '''0%''';
      //ShowMessage('deu pau aqui ! 1');
      dm.consultavenda.Open;
      dm.consultavenda.Last; //vai para a ultima posi��o do banco
      if(dm.consultavenda.RecordCount >= 1) then
      begin                         //isso serve para proteger os dados do cliente e a integridade do banco
         //ShowMessage('J� existe uma venda aberta !');
         mostraMensagem('J� existe uma venda aberta !', 'J� existe uma venda aberta !', 'OK');
         lblmostracodigodavenda.Text := 'C�digo da venda: ' + dm.consultavendavencod.AsString;
         codigodavenda := dm.consultavendavencod.AsInteger;
      end
      else
      begin
        //caso a valida��o acima n�o tenha encontrado nada ent�o ele faz a seguinte fun��o:
        dm.inserevenda.Params.ParamByName('ventotal').Value :=  '0';    //os valores recebem zero pois ser�o preenchidos mais tarde ao fechar a venda !
        dm.inserevenda.Params.ParamByName('vendesconto').Value := '0';   //os valores recebem zero pois ser�o preenchidos mais tarde ao fechar a venda !
        dm.inserevenda.Params.ParamByName('venclicod').Value := iddoclienteparaabrirvenda;
        dm.inserevenda.Params.ParamByName('vencaicod').Value := frmmenu.codigodocaixaaberto;
        dm.inserevenda.Params.ParamByName('venempcod').Value := frmmenu.empresarioid;
        dm.inserevenda.Prepare;
        dm.inserevenda.ExecSQL;
        if(dm.inserevenda.RowsAffected = 1) then
        begin
          dm.consultavenda.close;
          dm.consultavenda.SQL.Text := 'select * from vendas where vencaicod = ' + IntToStr(frmmenu.codigodocaixaaberto) + ' and ventotal like 0';
          dm.consultavenda.Open;
          dm.consultavenda.Last; //vai para a ultima posi��o do banco
          lblmostracodigodavenda.Text := 'C�digo da venda: ' + dm.consultavendavencod.AsString;
          codigodavenda := dm.consultavendavencod.AsInteger;
          //ShowMessage('C�digo da venda: ' + IntToStr(codigodavenda));
          mostraMensagem('C�digo da venda: ' + IntToStr(codigodavenda), 'C�digo da venda: ' + IntToStr(codigodavenda), 'Ok, prosseguir !');
        end
        else
        begin
          //ShowMessage('N�o foi possivel iniciar uma nova venda !');
          mostraMensagem('N�o foi possivel iniciar uma nova venda !', 'N�o foi possivel iniciar uma nova venda !', 'OK')
        end;

      end;
    end
    else
    begin
      //ShowMessage('CPF n�o pertence a nenhum cliente');
      mostraMensagem('CPF n�o pertence a nenhum cliente', 'CPF n�o pertence a nenhum cliente', 'OK')
    end;
  end;
end;

procedure Tfrmvenda.edtquantKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
  var
  calculo_valor_total_do_iten, precodoprodutofix, vamoarrumaessavirgula : string;
  quantidade_do_produto_para_subtrair : integer;
begin
//l�gica para impedir que seja adicionado texto ao inv�s de n�meros na edt !
if Key = $08 then    //backspace
begin
  //para n�o bugar mais
end
//somente n�meros
else if (KeyChar in ['a'..'z', 'A' .. 'Z', ',', '.', #8, #27, #32]) then
begin
  KeyChar := #0;
 //ShowMessage('Apenas N�meros !');
 mostraMensagem('Apenas N�meros !', 'Apenas N�meros !', 'OK')
end;
//l�gica para inserir os dados de itens de venda no banco e carregar no listview com o enter
if key = $0D then
begin
if(lblmostracodigodavenda.Text.Equals('') or lblcaixa.Text.Equals('') or lblmostracodigodavenda.Text.Equals('C�digo da venda: N�o esta vendendo !')) then
begin
  //ShowMessage('Inicie uma venda para continuar !');
  mostraMensagem('Inicie uma venda para continuar', 'Inicie uma venda', 'OK');
  abort;
end
else if(StrToInt(edtquant.Text) <= 0) then    //aqui caso o usu�rio insira algo menor que 0 na edt quantidade para n�o bugar
begin
   // ShowMessage('Voc� tem que adicionar pelo menos um produto de venda !');
    mostraMensagem('Voc� tem que adicionar pelo menos um produto de venda !', 'Voc� tem que adicionar pelo menos um produto de venda !', 'OK');
    abort;
end
else
begin
try
//aqui ele subtrai 1 da quantidade do produto para estoque

   dm.consultaproduto.Close;
   dm.consultaproduto.SQL.Text := 'select * from produtos where prodcod = ' + QuotedStr(edtcodprod.Text);
   dm.consultaproduto.Open;
   //aqui ele valida para ver se a quantidade de venda do produto � menor ou igual ao estoque
   if(StrToInt(edtquant.text) > dm.consultaprodutoprodquantidade.AsInteger) then
   begin
    // ShowMessage('Voc� n�o pode vender mais produtos do que possui no estoque !');
     mostraMensagem('Voc� n�o pode vender mais produtos do que possui no estoque !', 'Voc� n�o pode vender mais produtos do que possui no estoque !', 'OK');
     abort;
   end;


   //aqui ele adiciona no listview de itens de venda
   //agora ele traz a quantidade do produto
   quantidade_do_produto_para_subtrair := dm.consultaprodutoprodquantidade.AsInteger - StrToInt(edtquant.Text);
   dm.subtraiestoque.Params.ParamByName('prodquantidade').Value := quantidade_do_produto_para_subtrair;
   dm.subtraiestoque.Params.ParamByName('prodcod').Value := StrToInt(edtcodprod.Text);
   dm.subtraiestoque.Prepare;
   dm.subtraiestoque.ExecSQL;

  //arruma a cagada da , no formato de dinheiro e substitui pelo . americano !
  calculo_valor_total_do_iten := FloatToStr(StrToFloat(edtquant.Text) * StrToFloat(edtvalorunit.Text));
  precodoprodutofix := StringReplace(edtvalorunit.Text, ',', '.', [rfReplaceAll]);
  vamoarrumaessavirgula := StringReplace(calculo_valor_total_do_iten, ',', '.', [rfReplaceAll]);
  //aqui vai a l�gica para gravar no banco somar para mostrar na label de total da venda e gravar no itens venda
  dm.insereitensvenda.Params.ParamByName('itecodprod').Value := edtcodprod.Text;
  dm.insereitensvenda.Params.ParamByName('itevalunit').Value := precodoprodutofix;
  dm.insereitensvenda.Params.ParamByName('itequant').Value := edtquant.Text;
  dm.insereitensvenda.Params.ParamByName('itevalortotal').Value := vamoarrumaessavirgula; //calculo
  dm.insereitensvenda.Params.ParamByName('itenvenda').Value := codigodavenda;
  dm.insereitensvenda.Prepare;
  dm.insereitensvenda.ExecSQL;
  if(dm.insereitensvenda.RowsAffected = 1) then
  begin
    dm.consultaitensvenda.Close;
    dm.consultaitensvenda.SQL.Text := 'select prodnome, itequant, itevalunit, itevalortotal, itenvenda from itensdevenda, produtos WHERE itecodprod = prodcod and itenvenda = ' + IntToStr(codigodavenda);
    dm.consultaitensvenda.Open;
    totalvenda := 0;
    dm.consultaitensvenda.First; //vai para a primeira posi��o do banco
    while not dm.consultaitensvenda.Eof do
    begin
      totalvenda := totalvenda+dm.consultaitensvendaitevalortotal.AsFloat;
      dm.consultaitensvenda.Next;
    end;
    lblventotal.Text := 'Total da venda: R$'+ FloatToStr(totalvenda);
  end
  else
  begin
    //ShowMessage('Ocorreu um erro ao processar o item no banco de dados !');
    mostraMensagem('Ocorreu um erro ao processar o item no banco de dados !', 'Ocorreu um erro ao processar o item no banco de dados !', 'OK');
  end;
except
    //pass
   // ShowMessage('Ocorreu um erro ao processar os itens de venda !');
end;
end;
end;
end;

//para o yes e no no firemonkey
//https://stackoverflow.com/questions/28376120/messagedlg-in-delphi-xe7-android
procedure Tfrmvenda.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  opcaoparaxecluir, quantidadeestoquedeprodutos : integer;
begin         //f1
   if key = $70 then
   begin
     //verifica se pode continuar se ocorreu realmente uma venda !
     if(edtcpfcli.Text.Equals('')) then
     begin
       //ShowMessage('ERRO DE INTEGRIDADE | Fechar venda |Voc� n�o pode fechar algo que n�o existe !');
       mostraMensagem('ERRO DE INTEGRIDADE | Fechar venda |Voc� n�o pode fechar algo que n�o existe !', 'ERRO DE INTEGRIDADE | Fechar venda |Voc� n�o pode fechar algo que n�o existe !', 'OK');
       abort;
     end
     else if(lblventotal.Text = 'R$ 0,00') then
     begin
       mostraMensagem('ERRO DE INTEGRIDADE | Fechar venda |Voc� n�o pode fechar algo que n�o existe !', 'ERRO DE INTEGRIDADE | Fechar venda |Voc� n�o pode fechar algo que n�o existe !', 'OK');
       abort;
     end
     else if(lblventotal.Text = 'Total da venda:') then
     begin
       mostraMensagem('ERRO DE INTEGRIDADE | Fechar venda |Voc� n�o pode fechar algo que n�o existe !', 'ERRO DE INTEGRIDADE | Fechar venda |Voc� n�o pode fechar algo que n�o existe !', 'OK');
       abort;
     end;
     //ShowMessage('Iniciando fechamento da venda !');
     mostraMensagem('Iniciando fechamento da venda !', 'Iniciando fechamento da venda !', 'OK');
     frmfechavenda.lblcodigovenda.Text := 'C�digo da venda: ' + codigodavenda.ToString;
     frmfechavenda.lblcodigocaixa.Text := lblcaixa.Text;
     frmfechavenda.codigovenda := codigodavenda;
     frmfechavenda.valortotaldavenda_antes_de_pagar := totalvenda;
     frmfechavenda.lbltotaldavenda.Text := 'R$ ' + FloatToStr(totalvenda);
     frmfechavenda.ShowModal;
   end
   else if key = $75 then
   begin
  MessageDlg('Voc� tem certeza de quer quer cancelar a venda ?', System.UITypes.TMsgDlgType.mtInformation,
    [
      System.UITypes.TMsgDlgBtn.mbYes,
      System.UITypes.TMsgDlgBtn.mbNo
    ], 0,
    procedure(const AResult: System.UITypes.TModalResult)
    begin
      case AResult of
        mrYES:
          opcaoparaxecluir := 1;
        mrNo:
          opcaoparaxecluir := 10;
      end;
    end);
    if(opcaoparaxecluir = 1) then
    begin
    try
      begin
      opcaoparaxecluir := 100;
     // ShowMessage('Excluindo itens da venda e venda, e retornando produtos devolta ao estoque !');
      mostraMensagem('Excluindo itens da venda e venda, e retornando produtos devolta ao estoque !', 'Excluindo itens da venda e venda, e retornando produtos devolta ao estoque !', 'OK');

      //retorna o estoque de produtos devolta
      dm.retornaestoquevendacancel.Close;
      dm.retornaestoquevendacancel.SQL.Text := 'select * from itensdevenda where itenvenda = ' + QuotedStr(codigodavenda.ToString);
      dm.retornaestoquevendacancel.Open;
      dm.retornaestoquevendacancel.First;
      while not dm.retornaestoquevendacancel.Eof do
      begin
        quantidadeestoquedeprodutos := 0;
        //consulta o produto
        dm.consultaproduto.Close;
        dm.consultaproduto.SQL.Text := 'select * from produtos where prodcod = ' + QuotedStr(dm.retornaestoquevendacancelitecodprod.AsString);
        dm.consultaproduto.Open;

        //pega o estoque do produto soma o que foi tirado
        quantidadeestoquedeprodutos := dm.consultaprodutoprodquantidade.AsInteger;
        quantidadeestoquedeprodutos := quantidadeestoquedeprodutos + dm.retornaestoquevendacancelitequant.AsInteger;
        //ShowMessage('Produto: ' + dm.consultaprodutoprodnome.AsString + ' Quantidade estornada: ' + IntToStr(quantidadeestoquedeprodutos));
        dm.subtraiestoque.Params.ParamByName('prodquantidade').Value := quantidadeestoquedeprodutos;
        dm.subtraiestoque.Params.ParamByName('prodcod').Value := dm.consultaprodutoprodcod.AsInteger;
        dm.subtraiestoque.Prepare;
        dm.subtraiestoque.ExecSQL;

        //retorna o select ao normal
        dm.consultaproduto.Close;
        dm.consultaproduto.SQL.Text := 'select * from produtos';
        dm.consultaproduto.Open;

        //passa para o proximo registro
        dm.retornaestoquevendacancel.Next;
      end;

      //exclui os itens da venda
      dm.excluiitensvenda.Params.ParamByName('itenvenda').Value := codigodavenda;
      dm.excluiitensvenda.Prepare;
      dm.excluiitensvenda.ExecSQL;
      //exclui a venda
      dm.excluivenda.Params.ParamByName('vencod').Value  := codigodavenda;
      dm.excluivenda.Prepare;
      dm.excluivenda.ExecSQL;
      //abre a consulta novamente
      dm.consultaitensvenda.Close;
      dm.consultaitensvenda.Open;
      lblmostracodigodavenda.Text := '';
      lblventotal.Text := 'R$ 0,00';
      edtcpfcli.Text := '';
      edtcodprod.Text := '';
      edtquant.Text := '';
      edtvalorunit.Text := '';
      //ShowMessage('itens da venda e venda excluidos com sucesso !');
      mostraMensagem('itens da venda e venda excluidos com sucesso !', 'itens da venda e venda excluidos com sucesso !', 'OK');
      end;
    except
      mostraMensagem('Essa venda n�o pode ser cancelada pois tem um pagamento vinculado a ela !', 'Essa venda n�o pode ser cancelada pois tem um pagamento vinculado a ela !', 'OK');
    end;
    end
    else
    begin
     // ShowMessage('Exclus�o de itens da venda e venda cancelada !');
      mostraMensagem('Exclus�o de itens da venda e venda cancelada !', 'Exclus�o de itens da venda e venda cancelada !', 'OK');
    end;
   end;
end;

procedure Tfrmvenda.FormShow(Sender: TObject);
begin
  lblcaixa.Text := 'C�digo do caixa aberto: ' +
    frmmenu.codigodocaixaaberto.ToString;
end;

procedure Tfrmvenda.btnbuscacodproClick(Sender: TObject);
begin
frmconsultaproduto.e_para_vincular_em_uma_venda_ := 'sim';
frmconsultaproduto.Show;
end;

procedure Tfrmvenda.Timer1Timer(Sender: TObject);
var
data: TDateTime;
begin
data := now;
lblhoradata.Text := DateTimeToStr(data);
end;

end.
