MapaEstructura = struct('Lat', NaN, 'Lon', NaN, 'valor', NaN);
%%
MetadatosVariable = datatools.VariableMetadata();
esCongruente = datatools.isDataCongruentWithMetadata(MapaEstructura, MetadatosVariable);
assert(~esCongruente)
%%
MetatablaVariable = table('RowNames',{'Lat', 'Lon', 'valor'});
MetadatosVariable = datatools.VariableMetadata(MetatablaVariable);
esCongruente = datatools.isDataCongruentWithMetadata(MapaEstructura, MetadatosVariable);
assert(esCongruente)