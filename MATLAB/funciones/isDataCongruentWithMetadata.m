function esOk = isDataCongruentWithMetadata(Datos, MetadatosVariable)
esMetadatosTabla = istable(MetadatosVariable);
if esMetadatosTabla
    [MetadatosVariable,~] = datatools.splitMetatable(MetadatosVariable);
end
esMetadata = isa(MetadatosVariable, 'datatools.VariableMetadata');
assert(esMetadata, 'Los metadatos deben ser de clase *VariableMetadata* (datatools)');
esMetadatosVacios = isempty(MetadatosVariable);
if esMetadatosVacios
    esOk = false;
else
    esTabla = istable(Datos);
    esEstructura = isstruct(Datos);
    assert(esTabla | esEstructura, 'Los datos deben ser una tabla o una estructura');
    if esTabla
        variablesEnDatos = Datos.Properties.VariableNames;
    elseif esEstructura
        variablesEnDatos = fields(Datos);        
    end
    variablesEnMetadatos = MetadatosVariable.name;
    %%
    esDatosEnMetadatos = ismember(variablesEnDatos, variablesEnMetadatos);
    esDatosSubconjuntoMetadatos = all(esDatosEnMetadatos);
    if ~esDatosSubconjuntoMetadatos
        warning('Las siguientes variables en datos no están en los metadatos:');
        disp(char(variablesEnDatos(~esDatosEnMetadatos)))
    end
    esMetadatosEnDatos = ismember(variablesEnMetadatos, variablesEnDatos);
    esMetadatosSubconjuntoDatos = all(esMetadatosEnDatos);
    if ~esMetadatosSubconjuntoDatos
        warning('Las siguientes variables en metadatos no estan en los datos:');
        disp(char(variablesEnMetadatos(~esMetadatosEnDatos)))
    end
    esOk = esMetadatosSubconjuntoDatos&esDatosSubconjuntoMetadatos;
end
end