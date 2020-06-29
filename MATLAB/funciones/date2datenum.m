% >> date2datenum('07/Oct/1998')
% ans =
%      730035
% >> datestr(date2datenum('9/Jan/2000'))
% ans =
%     '09-Jan-2000'
% >> datestr(date2datenum('9/Ene/2000'))
% ans =
%     '09-Jan-2000'
% >> datestr(date2datenum('9-Aug-2000'))
% ans =
%     '09-Aug-2000'
% >> datestr(date2datenum('9-Ago-2000'))
% ans =
%     '09-Aug-2000'
function fechaNumerica = date2datenum(fecha)
expresion = '(-|\/)';
esTamanoCorrecto = length(fecha) == 10 | length(fecha) == 11;
assert(esTamanoCorrecto,'La fecha debe ser de la forma dd/mmm/aaaa, e.g: 07/Oct/1998')
separadores = regexp(fecha,expresion);
nSeparadores = length(separadores);
esDosSeparadores = nSeparadores == 2;
assert(esDosSeparadores, 'La fecha debe contener dos diagonales, e.g: 07/Oct/1998')
esDiaDosDigitos = separadores(1) == 3 | separadores(1) == 2;
assert(esDiaDosDigitos, 'El día debe ir al principio y tener dos dígitos, e.g: 07/Oct/1998')
longitudMes = diff(separadores)-1;
esMesTresLetras = longitudMes == 3;
assert(esMesTresLetras, 'El mes debe ir en medio y tener tres letras, e.g: 07/Oct/1998')
longitudAno = length(fecha)-separadores(2);
esAnoCuatroDigitos = longitudAno == 4;
assert(esAnoCuatroDigitos, 'El año debe ir al final y tener cuatro dígitos, e.g: 07/Oct/1998')

dia = str2double(fecha(1:separadores(1)-1));
mes = fecha(separadores(1)+1:separadores(2)-1);
ano = str2double(fecha(separadores(2)+1:end));

switch lower(mes)
    case {'jan','ene'}
        mes = 1;
    case {'feb'}
        mes = 2;
    case {'mar'}
        mes = 3;
    case {'apr','abr'}
        mes = 4;
    case {'may'}
        mes = 5;
    case {'jun'}
        mes = 6;
    case {'jul'}
        mes = 7;
    case {'aug','ago'}
        mes = 8;
    case {'sep'}
        mes = 9;
    case {'oct'}
        mes = 10;
    case {'nov'}
        mes = 11;
    case {'dec','dic'}
        mes = 12;
    otherwise
        error(['No sé cuál es el mes ' mes])
end

fechaNumerica = datenum(ano,mes,dia);