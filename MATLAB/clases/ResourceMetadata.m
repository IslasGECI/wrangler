classdef ResourceMetadata < datatools.ResourceMetadataBaseClass
    methods % Constructor
        function Obj = ResourceMetadata(MetadatosRecurso)
            if nargin == 1
                Obj = Obj.setResourceMetadata(MetadatosRecurso);
            end
        end
    end
    methods % ?etResource* (ResourceMetadataInterface)
        function Obj = setResourceMetadata(Obj, MetadatosRecurso)
            MetadatosRecurso.Properties.RowNames = lower(matlab.lang.makeValidName(MetadatosRecurso.Properties.RowNames));
            Obj.MetadatosRecurso = MetadatosRecurso;
        end
        function atributosRecurso = getResourceAttributeNames(Obj)
            atributosRecurso = Obj.MetadatosRecurso.Properties.VariableNames;
            atributosRecurso = matlab.lang.makeValidName(atributosRecurso);
        end
    end
    methods % get* (ResourceMetadataInterface)
        function name = getName(Obj)
            name = Obj.MetadatosRecurso.Properties.RowNames;
        end
    end
end
