function nombresEstandar = getStandardNameFromVariables(Metadatos)
    nombresEstandar = datatools.getAttributeFromVariables(Metadatos, 'standard_name');
    nVariables = length(Metadatos.Variables);
    nombresVariables = {Metadatos.Variables.Name};
    if any(strcmp('void', nombresEstandar))
        nombreVariableDependiente = datatools.getDependentVariableName(Metadatos);
        esVariableDependiente = strcmp(nombresVariables, nombreVariableDependiente);
        nombreDimensiones = {Metadatos.Variables(esVariableDependiente).Dimensions.Name};
        if length(nombreDimensiones) == 3
            for iVariable = 1:nVariables
                Variable = Metadatos.Variables(iVariable);
                if Variable.Name ~= string(nombreVariableDependiente)
                    banderaVariable = strcmp(nombreDimensiones, Variable.Name);
                    if any(banderaVariable & [1 0 0])
                        nombresEstandar(iVariable) = {StandardName.longitude};
                    elseif any(banderaVariable & [0 1 0])
                        nombresEstandar(iVariable) = {StandardName.latitude};                    
                    elseif any(banderaVariable & [0 0 1])
                        nombresEstandar(iVariable) = {StandardName.time};
                    end
                end
            end
        else
            error('No se entienden las dimensiones');
        end
    end
end