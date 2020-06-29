rutaNetCDF = toolboxes.getNetcdfPath();
nombreCarpeta = 'mur-sst-mensual';
nombreArchivo = 'mur-sst-concatenado-mensual-2003-2017.nc';
Revillagigedo = islas.Region(RegionID.revillagigedo);

rutaArchivo = [rutaNetCDF filesep nombreCarpeta filesep nombreArchivo];
Temperatura = datatools.importData(rutaArchivo,Revillagigedo);

metadatosArchivo = ncinfo(rutaArchivo);
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

axisX = DatosAmbientales.getVariableNameFromStandardName(StandardName.longitude); % eje x
axisY = DatosAmbientales.getVariableNameFromStandardName(StandardName.latitude); % eje y


IndicesCoordenadas = datatools.getCoordinateStartCount(rutaArchivo,Revillagigedo, axisX, axisY);
%% 
esStruct = isstruct(IndicesCoordenadas);
assert(esStruct);
esCorrectoInicioLat = isequal(IndicesCoordenadas.inicioLat,23);
assert(esCorrectoInicioLat);
esCorrectoInicioLon = isequal(IndicesCoordenadas.inicioLon,3727);
assert(esCorrectoInicioLon);
esCorrectoNLat = isequal(IndicesCoordenadas.nLat,297);
assert(esCorrectoNLat);
esCorrectoNLon = isequal(IndicesCoordenadas.nLon,609);
assert(esCorrectoNLon);
