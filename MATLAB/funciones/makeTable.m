function Tabla = makeTable(Datos, MetadatosVariable)
    MetadatosVariable.Properties.RowNames = matlab.lang.makeValidName(MetadatosVariable.Properties.RowNames);
    Datos.Properties.UserData = MetadatosVariable;
    datatools.assertValidTable(Datos)
    Tabla = Datos;
end

