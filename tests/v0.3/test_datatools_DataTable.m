% Datos
x_values = [1; 2; 3; 4; 5];
y_values = [6; 7; 2; 3; 6];
datos = table(x_values, y_values);
% Metadatos
name = {'x_values';'y_values'};
long_name = {'Horizontal variable';'Vertical variable'};
nombre_largo = {'Variable horizontal';'Variable vertical'};
metatabla = table(long_name,nombre_largo,'RowNames',name);
metadatos = datatools.VariableMetadata(metatabla);

%% Constructor sin argumentos de entrada
TablaDatos = datatools.DataTable();
esDataTable = isa(TablaDatos, 'datatools.DataTable');
assert(esDataTable);
%% Tabla de datos es clase *DataTable*
TablaDatos = datatools.DataTable();
TablaDatos = TablaDatos.setVariableMetadata(metadatos);
TablaDatos = TablaDatos.setData(datos);
esDataTable = isa(TablaDatos, 'datatools.DataTable');
assert(esDataTable);
%% Tabla a partir de archivo de Excel
rutaDatos = toolboxes.getDataPath();
nombreArchivo = 'TODAS_ISLAS_TRANSECTO_NOCTURNO.xlsx';
archivoDatos = [rutaDatos filesep nombreArchivo];
TablaDatos = datatools.importExcel(archivoDatos);
esDataTable = isa(TablaDatos,'datatools.DataTable');
assert(esDataTable);
%% Obten nombre_largo de todas las variables
TablaDatos = datatools.DataTable();
TablaDatos = TablaDatos.setVariableMetadata(metadatos);
TablaDatos = TablaDatos.setData(datos);
longNames = TablaDatos.getLongNameList();
esLongNameEsperado = isequal(longNames,long_name);
assert(esLongNameEsperado);
nombresLargos = TablaDatos.getNombreLargoList();
esNombresLargoEsperado = isequal(nombresLargos,nombre_largo);
assert(esNombresLargoEsperado);