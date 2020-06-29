directorioDP = '.\datapackage';
isDP = @() exist(directorioDP,'dir') == 7;
if isDP()
    rmdir(directorioDP, 's')
end
assert(~isDP())
nombreArchivo = 'morfometria_albatros_laysan_guadalupe.xls';
TablaDatos = datatools.importExcel(nombreArchivo);
nombreTablaCSV = 'tabla_de_datos';
TablaDatos.toTabularDataPackage(nombreTablaCSV)
assert(exist([directorioDP filesep nombreTablaCSV '.csv'],'file') == 2);
assert(exist([directorioDP filesep 'datapackage.json'],'file') == 2)
rmdir(directorioDP, 's')