function MetaDatos = extractAttributesFromVariables(nombreArchivo, nombreVariable)
    % Extrae los metadatos de una variable que se le pase
    informacionArchivo = ncinfo(nombreArchivo);
    
    nombreVariables = {informacionArchivo.Variables.Name};
    esVariable = strcmp(nombreVariable, nombreVariables);    
    
    assert(sum(esVariable) == 1, "No existe la variable en el archivo")
    
    atributosVariables = informacionArchivo.Variables(esVariable).Attributes;
    nombreAtributos = {atributosVariables.Name};
    valorAtributos = {atributosVariables.Value};
    nAttributes = length(atributosVariables);
    
    for iAtributo = 1:nAttributes    
        if isequal(nombreAtributos{iAtributo}, '_FillValue') || isequal(nombreAtributos{iAtributo}, 'add_offset') || isequal(nombreAtributos{iAtributo}, 'scale_factor')
                continue
        else
            nombreAtributo = nombreAtributos{iAtributo};
            valorAtributo = valorAtributos{iAtributo};
            MetaDatos.(nombreAtributo) = valorAtributo;
        end
    end
end