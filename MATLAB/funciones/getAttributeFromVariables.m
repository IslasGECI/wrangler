function atributos = getAttributeFromVariables(metadatos, nombreAtributo)
    atributos = cell(size(metadatos.Variables));
    nVariables = length(metadatos.Variables);
    for iVariable = 1:nVariables
        atributos(iVariable) = {'void'};
        nAtributos = length(metadatos.Variables(iVariable).Attributes);
        for iAtributo = 1:nAtributos
            if metadatos.Variables(iVariable).Attributes(iAtributo).Name == string(nombreAtributo)
                atributos(iVariable) = {metadatos.Variables(iVariable).Attributes(iAtributo).Value};
                break;
            end
        end
    end
end