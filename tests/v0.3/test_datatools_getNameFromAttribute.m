rutaDatos = toolboxes.getDataPath();
nombreArchivo = 'TODAS_ISLAS_TRANSECTO_NOCTURNO.xlsx';
archivoDatos = [rutaDatos filesep nombreArchivo];
TablaDatos = datatools.importExcel(archivoDatos);

%%
propiedad = VariableAttribute.units;
valor = 'm';
nombreColumnaObtenido = TablaDatos.getVariableNameFromAttribute(propiedad, valor);
nombreColumnaEsperado = 'DistanciaDelAvistamiento';
nombreCorrecto = isequal(nombreColumnaObtenido, nombreColumnaEsperado);
assert(nombreCorrecto);

%%
eje = Axis.T;
nombreColumnaObtenido = TablaDatos.getVariableNameFromAxis(eje);
nombreColumnaEsperado = 'Fecha';
nombreCorrecto = isequal(nombreColumnaObtenido, nombreColumnaEsperado);
assert(nombreCorrecto);

%%
nombreEstandar = StandardName.projection_x_coordinate;
nombreColumnaObtenido = TablaDatos.getVariableNameFromStandardName(nombreEstandar);
nombreColumnaEsperado = 'X';
nombreCorrecto = isequal(nombreColumnaObtenido, nombreColumnaEsperado);
assert(nombreCorrecto);