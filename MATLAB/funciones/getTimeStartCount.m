function Estructura = getTimeStartCount(nombreArchivo, LimitesFecha)    
    % Se leen las fechas y acomoda a formato datavec
    MetadatosTiempo = datatools.extractAttributesFromVariables(nombreArchivo, 'time');
    unidadesTiempo = MetadatosTiempo.units;
    tiempoDatos = ncread(nombreArchivo, 'time');
    if strcmp(unidadesTiempo, 'seconds since 1981-01-01 00:00:00 UTC')
        tiempo  = tiempoDatos/60/60/24 + datenum('1981-01-01');
    elseif strcmp(unidadesTiempo, 'serial date number')
        tiempo = tiempoDatos;
    elseif strcmp(unidadesTiempo, 'hours since 1900-01-01 00:00:0.0')
        tiempo = double(tiempoDatos/24 + datenum('1900-01-01'));
    end
    
    if isempty(LimitesFecha.inicio) && isempty(LimitesFecha.fin)
        LimitesFecha.inicio = tiempo(1);
        LimitesFecha.fin = tiempo(end);
    elseif isempty(LimitesFecha.inicio)
        LimitesFecha.inicio = tiempo(1);
    elseif isempty(LimitesFecha.fin)
        LimitesFecha.fin = tiempo(end); 
    end
    % Se buscan las fechas que caen dentro del dominio de las fechas
    [anioInicio, mesInicio, ~] = datevec(LimitesFecha.inicio);
    [anioFin, mesFin, ~] = datevec(LimitesFecha.fin);
    [anioGeoCampo, mesGeoCampo, ~] = datevec(double(tiempo));
    esMesInicioDominio = mesInicio == mesGeoCampo;
    esAnioInicioDominio = anioInicio == anioGeoCampo;
    esMesFinDominio = mesFin == mesGeoCampo;
    esAnioFinDominio = anioFin == anioGeoCampo;
    Estructura.inicioFecha = find((esMesInicioDominio & esAnioInicioDominio), 1);
    finFecha = find((esMesFinDominio & esAnioFinDominio), 1);
    % Se resta la fecha inicial a la fecha final para obtener la cantidad de
    % meses en el intervalo de tiempo. Pero esto hace que se descarte el último
    % valor del intervalo, por lo que se le tiene que sumar este mes (1) e.g.
    % Se tienen datos de enero (1) y febrero (2). Esto sería 2 meses de datos,
    % pero 2-1 = 1
    Estructura.numeroElementosFecha = finFecha - Estructura.inicioFecha + 1;
end