rutaNetCDF = toolboxes.getNetcdfPath();
nombreCarpeta = 'mur-sst-mensual';
nombreArchivo = 'mur-sst-concatenado-mensual-2003-2017.nc';
Revillagigedo = islas.Region(RegionID.revillagigedo);
rutaArchivo = [rutaNetCDF filesep nombreCarpeta filesep nombreArchivo];
Temperatura = datatools.importData(rutaArchivo,Revillagigedo);
LimitesFecha = struct('inicio', [], 'fin', []);
IndicesTiempo = datatools.getTimeStartCount(rutaArchivo, LimitesFecha);
%% 
esStruct = isstruct(IndicesTiempo);
assert(esStruct);
esCorrectoFechaInicio = isequal(IndicesTiempo.inicioFecha,1);
assert(esCorrectoFechaInicio);
esCorrectoNumeroElementosFecha = isequal(IndicesTiempo.numeroElementosFecha,180);
assert(esCorrectoNumeroElementosFecha);
