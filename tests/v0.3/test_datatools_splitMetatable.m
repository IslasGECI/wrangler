rutaDatos = toolboxes.getDataPath();
nombreArchivo = 'TODAS_ISLAS_TRANSECTO_NOCTURNO.xlsx';
archivoDatos = [rutaDatos filesep nombreArchivo];
Metatabla  = readtable(archivoDatos,'Sheet',2,'ReadRowNames',true,'Basic',true);
%% Salida es del tipo correcto
[MetadatosVariable, MetadatosRecurso] = datatools.splitMetatable(Metatabla);
esVariableMetadata = isa(MetadatosVariable,'datatools.VariableMetadata');
assert(esVariableMetadata,'Los metadatos de variable deben ser clase <strong>datatools.VariableMetadata</strong>');
esResourceMetadata = isa(MetadatosRecurso,'datatools.ResourceMetadata');
assert(esResourceMetadata,'Los metadatos de recurso deben ser clase <strong>datatools.ResourceMetadata</strong>');
%% Salida es del tamaño correcto
[MetadatosVariable, MetadatosRecurso] = datatools.splitMetatable(Metatabla);
alturaMetadatos = height(Metatabla);
nMetadatosVariable = length(MetadatosVariable.getName);
esAlturaCorrecta = nMetadatosVariable == alturaMetadatos - 1;
assert(esAlturaCorrecta,'Un renglón de los metadatos de entrada deben corresponder a los metadatos de tabla');
