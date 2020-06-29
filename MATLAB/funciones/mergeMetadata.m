function Metatabla = mergeMetadata(MetadatosRecurso,MetadatosVariable)
    MetatablaRecurso = MetadatosRecurso.getMetatable();
    MetatablaVariable = MetadatosVariable.getMetatable();
    columnasRecurso = MetatablaRecurso.Properties.VariableNames;
    for columna = columnasRecurso
        if ischar(class(MetatablaRecurso.(columna{:})))
            MetatablaRecurso.(columna{:}) = {MetatablaRecurso.(columna{:})};
        end
    end
    Metatabla = outerjoin(MetatablaVariable,MetatablaRecurso,'MergeKeys', true);
end