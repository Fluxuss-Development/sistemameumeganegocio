unit UvalidaCPF;

interface
function isCPF(CPF: string): boolean;
function imprimeCPF(CPF: string): string;

implementation
uses SysUtils; // necess�rio para utilizar a fun��o "StrToInt"

function isCPF(CPF: string): boolean;
var  dig10, dig11: string;
    s, i, r, peso: integer;
begin
// length - retorna o tamanho da string (CPF � um n�mero formado por 11 d�gitos)
  if ((CPF = '00000000000') or (CPF = '11111111111') or
      (CPF = '22222222222') or (CPF = '33333333333') or
      (CPF = '44444444444') or (CPF = '55555555555') or
      (CPF = '66666666666') or (CPF = '77777777777') or
      (CPF = '88888888888') or (CPF = '99999999999') or
      (length(CPF) <> 11))
     then begin
              isCPF := false;
              exit;
            end;

// try - protege o c�digo para eventuais erros de convers�o de tipo na fun��o StrToInt
  try
{ *-- C�lculo do 1o. Digito Verificador --* }
    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
// StrToInt converte o i-�simo caractere do CPF em um n�mero
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig10 := '0'
    else str(r:1, dig10); // converte um n�mero no respectivo caractere num�rico

{ *-- C�lculo do 2o. Digito Verificador --* }
    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig11 := '0'
    else str(r:1, dig11);

{ Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig10 = CPF[10]) and (dig11 = CPF[11]))
       then isCPF := true
    else isCPF := false;
  except
    isCPF := false
  end;
end;

function imprimeCPF(CPF: string): string;
begin
  imprimeCPF := copy(CPF, 1, 3) + '.' + copy(CPF, 4, 3) + '.' +
    copy(CPF, 7, 3) + '-' + copy(CPF, 10, 2);
end;

end.
