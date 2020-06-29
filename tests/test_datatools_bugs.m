rutaDatos = toolboxes.getDataPath();
nombreArchivo = 'TODAS_ISLAS_TRANSECTO_NOCTURNO.xlsx';
archivoDatos = [rutaDatos filesep nombreArchivo];
TablaDatos = datatools.importExcel(archivoDatos);
%%
nombrePrimerColumna = 'Fecha';
longName = TablaDatos.getVariableLongName(nombrePrimerColumna);
esLongNameEsperado = string(longName) == "Date";
assert(esLongNameEsperado)
%%
nombreEsperado = "Fecha";
nombreObtenido = TablaDatos.getVariableNameFromAxis(Axis.T);
esNombreEsperado = nombreEsperado == string(nombreObtenido);
assert(esNombreEsperado)
%%
nombreEsperado = "Fecha";
nombreObtenido = TablaDatos.getVariableNameFromAttribute('axis',Axis.T);
esNombreEsperado = nombreEsperado == string(nombreObtenido);
assert(esNombreEsperado)