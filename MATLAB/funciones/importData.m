%IMPORTDATA Importa datos desde un archivo NetCDF dentro de un dominio de
%tiempo y espacio definidos.
%
% Descripción:
%
%   Importa datos en formato NetCDF con las herramientas del paquete NetCDF
%   (The MathWorks, Inc) y los transforma a una estructura con campos
%   obtenidos a partir de la información de variables metadatos y
%   dimensiones del NetCDF.
%
% Autores:
%
%   Evaristo Rojas Mayoral <evaristo.rojas@islas.org.mx>
%   Daniela Munguía Cajigas <daniela.munguia@islas.org.mx>
%   Efren Cabrera Ortega <efren.cabrera@islas.org.mx>
%   Yutzil Lora Cabrera <yutzil.lora@islas.org.mx>
%
% Referencias:
%
%   -
%
% Sintaxis:
%
%   S = IMPORTDATA(nombreArchivo,nombreVariable, idRegion, vectorFechas)
%   importa y convierte a estructura la información obtenida del archivo
%   NetCDF dentro de una región y un periodo de tiempo dados.
%
% Entrada:
%
%   nombreArchivo (char)  Nombre del archivo NetCDF
%
%   nombreVariable (char) Nombre de la variable dentro del archivo NetCDF
%   
%   idRegion (RegionID) ID de la región
%
%   LimitesFecha (datenum) Vector con la fecha inicial y final para el
%   cual se quieren leer los datos
%
% Salida:
%
%   Estructura (struct) estructura con la información del NetCDF
%
% Ejemplos:
%
%   S = importData('mur-sst-concatenado-mensual-2003-2017.nc',RegionID.guadalupe,datenum(['2015-03-01' '2015-04-01']));
%
% See also: ncread
%
function Campo = importData(varargin)                
    Entrada = inputParser();
    Entrada.addRequired('nombreArchivo', @ischar);
    Entrada.addRequired('Geopoligono');
    Entrada.addParameter('inicio', [], @isdatetime);
    Entrada.addParameter('fin', [], @isdatetime);
    Entrada.parse(varargin{:});
    
    LimitesFecha = struct('inicio', Entrada.Results.inicio, 'fin', Entrada.Results.fin);    
    
    metadatosArchivo = ncinfo(Entrada.Results.nombreArchivo);
    % Se determina cuál es la variable dependiente a partir de las
    % dimensiones de las variables
    nombreVariable = datatools.getDependentVariableName(metadatosArchivo);
    
    DatosAmbientales = datatools.DataStructure();    
    % Metadatos variables ambientales    
    % Se usa el standard_name en vez del name para que se más general
    nombreVariables = {metadatosArchivo.Variables.Name}';
    standard_name = datatools.getStandardNameFromVariables(metadatosArchivo)';
    long_name = datatools.getAttributeFromVariables(metadatosArchivo, 'long_name')';
    nombre_largo = datatools.getAttributeFromVariables(metadatosArchivo, 'nombre_largo')';    
    MetatablaVariable = table(standard_name,nombre_largo,long_name,'RowNames',nombreVariables);
    MetadatosVariable = datatools.VariableMetadata(MetatablaVariable);
    DatosAmbientales = DatosAmbientales.setVariableMetadata(MetadatosVariable);
    
    % Se definen los nombres de las variables   
    axisX = DatosAmbientales.getVariableNameFromStandardName(StandardName.longitude); % eje x
    axisY = DatosAmbientales.getVariableNameFromStandardName(StandardName.latitude); % eje y
    axisT = DatosAmbientales.getVariableNameFromStandardName(StandardName.time); % eje tiempo

    %%
    IndicesCoordenadas = datatools.getCoordinateStartCount(Entrada.Results.nombreArchivo,Entrada.Results.Geopoligono, axisX, axisY);
    IndicesTiempo = datatools.getTimeStartCount(Entrada.Results.nombreArchivo, LimitesFecha);
    inicioDep = [IndicesCoordenadas.inicioLon, IndicesCoordenadas.inicioLat, IndicesTiempo.inicioFecha];
    numeroElementos = [IndicesCoordenadas.nLon, IndicesCoordenadas.nLat, IndicesTiempo.numeroElementosFecha];
    %
    
    %% Se cargan los datos en memoria dentro del dominio de espacio y tiempo definidos
    Estructura.Lat = ncread(Entrada.Results.nombreArchivo, axisY, IndicesCoordenadas.inicioLat, IndicesCoordenadas.nLat);
    Estructura.Lon = ncread(Entrada.Results.nombreArchivo, axisX, IndicesCoordenadas.inicioLon, IndicesCoordenadas.nLon);
    Estructura.Lon (Estructura.Lon  > 180) = Estructura.Lon (Estructura.Lon  > 180) - 360;
    varDep = ncread(Entrada.Results.nombreArchivo, cell2mat(nombreVariable), inicioDep, numeroElementos);
    tiempo = ncread(Entrada.Results.nombreArchivo, axisT, IndicesTiempo.inicioFecha, IndicesTiempo.numeroElementosFecha);
    %% Se modifican los valores de las variables según los metadatos
    MetadatosVarDep = datatools.extractAttributesFromVariables(Entrada.Results.nombreArchivo, nombreVariable);
    if isfield(MetadatosVarDep, 'valid_min')
        varDep(varDep < MetadatosVarDep.valid_min) = nan;
    end
    if isfield(MetadatosVarDep, 'valid_max')
        varDep(varDep > MetadatosVarDep.valid_max) = nan;
    end
    if isfield(MetadatosVarDep, 'units')
        unidadesVariable = MetadatosVarDep.units;
        if strcmpi(unidadesVariable,'kelvin')
            varDep = varDep - 273.15;
            unidadesVariable = 'celsius';
            unidadesEtiqueta = '°C';        
        end
    end
    MetadatosTiempo = datatools.extractAttributesFromVariables(Entrada.Results.nombreArchivo, DatosAmbientales.getVariableNameFromStandardName(StandardName.time));
    unidadesTiempo = MetadatosTiempo.units;
    if strcmp(unidadesTiempo, 'seconds since 1981-01-01 00:00:00 UTC')
        tiempo  = tiempo/60/60/24 + datenum('1981-01-01');
    elseif strcmp(unidadesTiempo, 'serial date number')
        tiempo = tiempo;
    elseif strcmp(unidadesTiempo, 'hours since 1900-01-01 00:00:0.0')
        tiempo = double(tiempo/24 + datenum('1900-01-01'));
    end
    %% Se copian los datos a la estructura que se va a regresar
    EstructuraDatosAmbientales.(DatosAmbientales.getVariableNameFromStandardName(StandardName.longitude)) = Estructura.Lon;
    EstructuraDatosAmbientales.(DatosAmbientales.getVariableNameFromStandardName(StandardName.latitude)) = Estructura.Lat;
    EstructuraDatosAmbientales.(DatosAmbientales.getVariableNameFromStandardName(StandardName.time)) = tiempo;
    EstructuraDatosAmbientales.(cell2mat(nombreVariable)) = varDep;
    %%
    DatosAmbientales = DatosAmbientales.setData(EstructuraDatosAmbientales);
    Campo = geoambiental.Field();
    Campo = Campo.setDataStructure(DatosAmbientales);
    Campo = Campo.setValueName(cell2mat(nombreVariable));
end