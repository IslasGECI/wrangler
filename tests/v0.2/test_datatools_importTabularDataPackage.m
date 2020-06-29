nombreArchivo = [toolboxes.getTextDataPath() filesep 'datapackage/gps-albatros-y-pardela/gps-albatros-isla-guadalupe.csv'];
TablaDatos = datatools.importTabularDataResource(nombreArchivo);
%% Tabla de datos es clase *DataTable*
esDataTable = isa(TablaDatos,'datatools.DataTable');
assert(esDataTable);