%% Constructor de VariableMetadata sin argumentos de entrada
Metadatos = datatools.VariableMetadata();
esMetadatos = isa(Metadatos, 'datatools.VariableMetadata');
assert(esMetadatos);
%% Constructor de ResourceMetadata sin argumentos de entrada
Metadatos = datatools.ResourceMetadata();
esMetadatos = isa(Metadatos, 'datatools.ResourceMetadata');
assert(esMetadatos);
%% Constructor de PackageMetadata sin argumentos de entrada
Metadatos = datatools.PackageMetadata();
esMetadatos = isa(Metadatos, 'datatools.PackageMetadata');
assert(esMetadatos);