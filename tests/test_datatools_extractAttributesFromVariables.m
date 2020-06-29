nombreArchivo = 'example.nc';
nombreVariable = 'temperature';
%%
Atributo = datatools.extractAttributesFromVariables(nombreArchivo, nombreVariable);
esEstructura = isstruct(Atributo);
assert(esEstructura);
esAtributoCorrecto = isfield(Atributo,'units');
assert(esAtributoCorrecto);