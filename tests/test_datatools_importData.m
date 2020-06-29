rutaNetCDF = toolboxes.getNetcdfPath();
Archivos = struct(...
    'nombreCarpeta', {'mur-sst-mensual', 'modis-chl-mensual'}, ...
    'nombreArchivo', {'mur-sst-concatenado-mensual-2003-2017.nc','modis-chl-concatenado-mensual-2003-2017.nc'});
Revillagigedo = islas.Region(RegionID.revillagigedo);
%%
nArchivos = length(Archivos);
for iArchivo = 1:nArchivos
    rutaArchivo = [rutaNetCDF filesep Archivos(iArchivo).nombreCarpeta filesep Archivos(iArchivo).nombreArchivo];
    Variable = datatools.importData(rutaArchivo,Revillagigedo);
    esCampo = isa(Variable,'geoambiental.Field');
    assert(esCampo);
    sonPropiedadesEsperados = all(ismember({'tiempo','valor'},properties(Variable)));
    assert(sonPropiedadesEsperados)
end