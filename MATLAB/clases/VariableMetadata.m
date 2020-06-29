classdef VariableMetadata < datatools.VariableMetadataBaseClass
    methods % Constructor
        function Obj = VariableMetadata(MetadatosVariable)
            if nargin == 1
                Obj = Obj.setVariableMetadata(MetadatosVariable);
            end
        end
    end
end
