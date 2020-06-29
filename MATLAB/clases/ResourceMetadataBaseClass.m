classdef (Abstract) ResourceMetadataBaseClass < datatools.ResourceMetadataInterface & datatools.ResourceBaseClass
    properties (Access = protected)
        MetadatosRecurso = table()
    end
    methods % ?etResource* (ResourceMetadataInterface)
        function Obj = setResourceMetadata(Obj, MetadatosRecurso)
            esMetatabla = istable(MetadatosRecurso);
            assert(esMetatabla, 'Los metadatos deben ser una tabla')
            Obj.MetadatosRecurso = MetadatosRecurso;
        end
        function atributosRecurso = getResourceAttributeNames(Obj)
            atributosRecurso = Obj.MetadatosRecurso.Properties.RowNames;
        end
    end 
    methods % get* (ResourceMetadataInterface)
        function atributo = getAttribute(Obj, nombreAtributo)
            atributo = Obj.MetadatosRecurso.(nombreAtributo);
        end
        function name = getName(Obj)
            RowNames = Obj.MetadatosRecurso.Property.RowNames;
            name = matlab.lang.makeValidName(RowNames);
        end
        function Metatabla = getMetatable(Obj)
            Metatabla = Obj.MetadatosRecurso;
        end
    end
    methods % Overload (MetadataInterface)
        function ObjC = vertcat(ObjA, ObjB)
            MetadatosRecursoA = ObjA.MetadatosRecurso;
            MetadatosRecursoB = ObjB.MetadatosRecurso;
            MetadatosRecursoC = [MetadatosRecursoA; MetadatosRecursoB];
            ObjC = datatools.ResourceMetadata(MetadatosRecursoC);
        end
    end
    methods % set* (ResourceMetadataInterface)
        function Obj = setName(Obj, name)
            RowNames = matlab.lang.makeValidName(name);
            Obj.MetadatosRecurso.Properties.RowNames = RowNames;
        end
    end
    methods % *TabularDataResource
        function TabularDataResource = toTabularDataResource(Obj)
            MetadatosRecurso = Obj.MetadatosRecurso;
            assert(height(MetadatosRecurso) == 1,'Esperaba un único renglón en `MetadatosRecurso`')
            nombre = lower(matlab.lang.makeValidName(MetadatosRecurso.Properties.RowNames{:}));
            TabularDataResource.name = nombre;
            TabularDataResource.profile = 'tabular-data-resource';
            TabularDataResource.path = [nombre '.csv'];
            MetadatosRecursoEstructura = table2struct(MetadatosRecurso);
            campos = fieldnames(MetadatosRecursoEstructura);
            for iCampo = 1:length(campos)
                TabularDataResource.(campos{iCampo}) = MetadatosRecursoEstructura.(campos{iCampo});
            end
            % Aquí falta el _table schema_ pero esta clase no sabe que
            % existe la clase VariableMetadata. Se deberá agregar en la
            % clase DataTable
        end
    end
end