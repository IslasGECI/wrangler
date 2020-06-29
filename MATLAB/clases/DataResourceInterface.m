classdef (Abstract) DataResourceInterface < datatools.ResourceMetadataInterface & datatools.DataInterface
    properties (Abstract, Access = protected)
        Datos
        MetadatosVariable
    end
    methods (Abstract) % Setters de propiedades privadas
        setData(Obj, Datos)
        setVariableMetadata(Obj, MetadatosVariable)
        setResource(Obj, Recurso)
    end
    methods (Abstract) % DataVariable
        addDataVariable(Obj, VariableDatos)
        delDataVariable(Obj, nombreVariable)
        getDataVariable(Obj, nombreVariable)
        setDataVariable(Obj, VariableDatos)
    end
    methods (Abstract) % getResourceMetadata
        getResourceMetadata(Obj)
    end
    methods (Abstract) % getVariable*
        getVariableAttribute(Obj, nombreVariable, atributoVariable)
        getVariableNameFromAttribute(Obj, propiedad, valor)
        getVariableNameFromAxis(Obj, eje)
        getVariableNameFromStandardName(Obj, nombreEstandar)
        getVariableAxis(Obj, nombreVariable)
        getVariableDescription(Obj, nombreVariable)
        getVariableLongName(Obj, nombreVariable)
        getVariableNombreLargo(Obj, nombreVariable)
        getVariableStandardName(Obj, nombreVariable)
        getVariableUnits(Obj, nombreVariable)
    end
    methods (Abstract) % get*List
        getAttributeList(Obj)
        getNameList(Obj)
        getAxisList(Obj)
        getDescriptionList(Obj)
        getLongNameList(Obj)
        getNombreLargoList(Obj)
        getStandardNameList(Obj)
        getUnitsList(Obj)
    end
    methods (Abstract) % Miscelaneo
        select(Obj, nombreVariable)
    end
end
