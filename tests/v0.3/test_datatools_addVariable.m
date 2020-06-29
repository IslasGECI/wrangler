nombreVariable = '¡Hola Mundo!';
estatura = 180;
VariableDatos = datatools.DataVariable();
VariableDatos = VariableDatos.setName({nombreVariable});
VariableDatos = VariableDatos.setValue(estatura);
VariableDatos = VariableDatos.setUnits({'cm'});
VariableDatos = VariableDatos.setNombreLargo({'Estatura'});
%
Lat = datatools.DataVariable();
Lat = Lat.setName({'Lat'});
Lat = Lat.setStandardName({StandardName.latitude.char()});
Lat = Lat.setLongName({'Latitude'});
Lat = Lat.setNombreLargo({'Latitud'});
%
Lon = datatools.DataVariable();
Lon = Lon.setName({'Lon'});
Lon = Lon.setStandardName({StandardName.longitude.char()});
Lon = Lon.setLongName({'Longitude'});
Lon = Lon.setNombreLargo({'Longitud'});
%%
nombreVariableEsperado = string(matlab.lang.makeValidName(nombreVariable));
nombreVariableObtenido = string(VariableDatos.getName());
esNombreVariableValido = nombreVariableObtenido == nombreVariableEsperado;
assert(esNombreVariableValido);
%%
valorEsperado = estatura;
valorObtenido = VariableDatos.getValue();
esValorEsperado = valorEsperado == valorObtenido;
assert(esValorEsperado);
%%
TablaDatos = datatools.DataTable();
TablaDatos = TablaDatos.addDataVariable(VariableDatos);
%%
EstructuraDatos = datatools.DataStructure();
EstructuraDatos = EstructuraDatos.addDataVariable(Lat);
EstructuraDatos = EstructuraDatos.addDataVariable(Lon);
