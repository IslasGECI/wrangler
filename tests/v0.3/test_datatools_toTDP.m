nombreArchivo = 'morfometria_albatros_laysan_guadalupe.xls';
TablaDatos = datatools.importExcel(nombreArchivo);
TablaDatos.toTabularDataPackage()
% jsonschema -i ejemplo_datatools\datapackage.json tabular-data-package.json
% cd ejemplo_datatools
% goodtables validate datapackage.json