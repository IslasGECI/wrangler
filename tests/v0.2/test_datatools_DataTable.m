rutaDatos = toolboxes.getDataPath();
nombreArchivo = 'TODAS_ISLAS_TRANSECTO_NOCTURNO.xlsx';
archivoDatos = [rutaDatos filesep nombreArchivo];
TablaDatos = datatools.importExcel(archivoDatos);
%% Constructor sin argumentos de entrada
clear TablaDatos;
TablaDatos = datatools.DataTable();
esDataTable = isa(TablaDatos, 'datatools.DataTable');
assert(esDataTable);
%% Tabla de datos es clase *DataTable*
esDataTable = isa(TablaDatos,'datatools.DataTable');
assert(esDataTable);
%% Obten nombre_largo de todas las variables
longNames = TablaDatos.getLongNameList();
esVacio = isempty(longNames);
assert(~esVacio);
nombresLargos = TablaDatos.getNombreLargoList();
esVacio = isempty(nombresLargos);
assert(~esVacio);