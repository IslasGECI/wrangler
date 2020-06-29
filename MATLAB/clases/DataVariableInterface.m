classdef (Abstract) DataVariableInterface < datatools.VariableMetadataInterface & datatools.DataInterface
    properties (Abstract, Access = protected)
        valor
    end
    methods (Abstract) % getVariableMetadata
        getVariableMetadata(Obj)
    end
end