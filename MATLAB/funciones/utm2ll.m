function TablaDatos = utm2ll(TablaDatos)
    nombreX = TablaDatos.getVariableNameFromStandardName(StandardName.projection_x_coordinate);
    nombreY = TablaDatos.getVariableNameFromStandardName(StandardName.projection_y_coordinate);
    x = TablaDatos.getValue(nombreX);
    y = TablaDatos.getValue(nombreY);
    zonaUTM = 11; warning('Estoy suponiendo zona UTM 11 porque esta parte no está implementada'); % TODO: Tomar la zona de los datos
    [lat, lon] = utm2ll(x,y,zonaUTM);
    

    latVariableDatos = TablaDatos.getDataVariable(nombreY);
    lonVariableDatos = TablaDatos.getDataVariable(nombreX);
    latVariableDatos = latVariableDatos.setValue(lat);
    lonVariableDatos = lonVariableDatos.setValue(lon);
    if any(TablaDatos.getAttributeList == "description")
        latVariableDatos = latVariableDatos.setDescription({'Coordenada meridional'});
        lonVariableDatos = lonVariableDatos.setDescription({'Coordenada zonal'});
    end        
    latVariableDatos = latVariableDatos.setLongName({'Latitude'});
    lonVariableDatos = lonVariableDatos.setLongName({'Longitude'});
    latVariableDatos = latVariableDatos.setNombreLargo({'Latitud'});
    lonVariableDatos = lonVariableDatos.setNombreLargo({'Longitud'});
    latVariableDatos = latVariableDatos.setStandardName({StandardName.latitude.char()});
    lonVariableDatos = lonVariableDatos.setStandardName({StandardName.longitude.char()});
    latVariableDatos = latVariableDatos.setUnits({'degrees'});
    lonVariableDatos = lonVariableDatos.setUnits({'degrees'});
    TablaDatos = TablaDatos.setDataVariable(latVariableDatos);
    TablaDatos = TablaDatos.setDataVariable(lonVariableDatos);
 end