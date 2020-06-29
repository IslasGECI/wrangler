function nombre = getDependentVariableName(Metadatos)    
    nDimensionMayor = 0;    
    nombre = {''};
    for Variable = Metadatos.Variables
        nDimensionesVariable = length(Variable.Dimensions);
        if nDimensionesVariable > nDimensionMayor
            nDimensionMayor = nDimensionesVariable;
            nombre = {Variable.Name};
        end
    end
end