nombreArchivo = 'example.nc';
metadatos = ncinfo(nombreArchivo);
nombreAtributo = 'description';
%% 
Atributo = datatools.getAttributeFromVariables(metadatos,nombreAtributo);
esAtributoCorrecto = isequal('this variable has no dimensions', Atributo{1});
assert(esAtributoCorrecto);