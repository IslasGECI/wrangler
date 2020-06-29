nombreArchivo = 'example.nc';
metadatos = ncinfo(nombreArchivo);
%% 
nombreVariable = datatools.getDependentVariableName(metadatos);
esNombreCorrecto = isequal(nombreVariable{1}, 'peaks');
assert(esNombreCorrecto);