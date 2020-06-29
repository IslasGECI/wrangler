TablaDatos = datatools.importExcel([toolboxes.getDataPath() filesep 'TODAS_ISLAS_BUSQUEDA.xlsx']);
%%
nombreVariable = TablaDatos.getVariableNameFromAxis(Axis.C);
isColony = @(x) x.(nombreVariable) == "Zapato";
TablaDatos.where(isColony).select(nombreVariable)
TablaDatos.select(nombreVariable).where(isColony)