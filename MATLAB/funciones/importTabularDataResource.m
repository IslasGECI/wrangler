function TablaDatos = importTabularDataResource(nombreArchivo)
    Datos = readtable(nombreArchivo,'TreatAsEmpty','NA');
    [direccionMetadatos, nombreSinExtencion, extencion] = fileparts(nombreArchivo);
    nombreArchivoSinRuta = [nombreSinExtencion, extencion];
    textojson = fileread([direccionMetadatos '\datapackage.json']);
    MetatablaPaquete = jsondecode(textojson);
    
    recursos = MetatablaPaquete.resources;
    esCelda = iscell(recursos);
    esEstructura = isstruct(recursos);
    
    if esEstructura
        MetaestructuraRecurso = MetatablaPaquete.resources;
        esMetadatosRecurso = lower({MetaestructuraRecurso.path}) == string(lower(nombreArchivoSinRuta));
        MetaestructuraRecurso = MetaestructuraRecurso(esMetadatosRecurso);
    elseif esCelda
        esMetadatosRecurso = cellfun(@(x) lower(x.path), recursos, 'UniformOutput',false) == string(lower(nombreArchivoSinRuta));
        MetaestructuraRecurso = MetatablaPaquete.resources{esMetadatosRecurso};
    end
    MetatablaRecurso = struct2table(rmfield(MetaestructuraRecurso,'schema'));
    
    MetatablaRecurso.Properties.RowNames = {MetatablaRecurso.name};
    MetadatosRecurso = datatools.ResourceMetadata(MetatablaRecurso);
    TablaDatos = datatools.DataTable();
    TablaDatos = TablaDatos.setResourceMetadata(MetadatosRecurso);
    campos = MetaestructuraRecurso.schema.fields;
    esCelda = iscell(campos);
    esEstructura = isstruct(campos);
    if esCelda
        nCampos = length(campos);
        for iCampo = nCampos:-1:1
            descriptores = fieldnames(campos{iCampo});
            nDescriptores = length(descriptores);
            for iDescriptor = 1:nDescriptores
                estructuraCampos(iCampo).(descriptores{iDescriptor}) = campos{iCampo}.(descriptores{iDescriptor});
            end
        end
    elseif esEstructura
        estructuraCampos = campos;
    end
    MetatablaVariable = struct2table(estructuraCampos);
    columnas = MetatablaVariable.Properties.VariableNames;
    for columna = columnas
        esNull = cellfun(@isempty, MetatablaVariable.(cell2mat(columna)));
        nNull = sum(esNull);
        MetatablaVariable(esNull,:).(cell2mat(columna)) = repmat({''},nNull,1); 
    end    
    MetatablaVariable.Properties.RowNames = MetatablaVariable.name;
    MetadatosVariable = datatools.VariableMetadata(MetatablaVariable);
    TablaDatos = TablaDatos.setVariableMetadata(MetadatosVariable);
    TablaDatos = TablaDatos.setData(Datos);
end