classdef (Abstract) VariableMetadataInterface  < datatools.MetadataInterface
    properties (Abstract, Access = protected)
        MetadatosVariable
    end
    properties (Abstract)
        name % This property should correspond to the name of field/column in the data file
        axis % Identifies latitude, longitude, vertical, or time axes
        description % A description for this field
        long_name % A descriptive name that indicates a variable's content (written in English). This name is not standardized
        nombre_largo % Traducción al español de long_name
        standard_name % A standard name that references a description of a variable's content in the standard name table
        units % Units of a variable's content
    end
    methods (Abstract) % ?etVariable*
        getVariableAttributeNames(Obj)
        patchVariableMetadata(Obj, MetadatosVariable)
        setVariableMetadata(Obj, MetadatosVariable)
    end
    methods (Abstract) % get*
        getAttribute(Obj, nombreAtributo)
        getName(Obj)
        getAxis(Obj)
        getDescription(Obj)
        getLongName(Obj)
        getNombreLargo(Obj)
        getStandardName(Obj)
        getUnits(Obj)
    end
    methods (Abstract) % getVariableNameFrom*
        getVariableNameFromAttribute(Obj, propiedad, valor)
        getVariableNameFromAxis(Obj, eje)
        getVariableNameFromStandardName(Obj, nombreEstandar)
    end
    methods (Abstract) % set*
        setName(Obj, name)
        setAxis(Obj, axis)
        setDescription(Obj, description)
        setLongName(Obj, long_name)
        setNombreLargo(Obj, nombre_largo)
        setStandardName(Obj, standard_name)
        setUnits(Obj, units)
    end
end
