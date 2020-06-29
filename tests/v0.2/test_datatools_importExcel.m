rutaDatos = toolboxes.getDataPath();
nombreArchivo = 'TODAS_ISLAS_TRANSECTO_NOCTURNO.xlsx';
archivoDatos = [rutaDatos filesep nombreArchivo];
TablaDatos = datatools.importExcel(archivoDatos);
%% Tabla de datos es clase *DataTable*
esDataTable = isa(TablaDatos,'datatools.DataTable');
assert(esDataTable);