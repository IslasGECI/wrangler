classdef (Abstract) VariableBaseClass
    properties (Abstract, Access = protected)
        MetadatosVariable
    end
    properties (Dependent)
        name % This property should correspond to the name of field/column in the data file
        axis % Identifies latitude, longitude, vertical, or time axes
        description % A description for this field
        long_name % A descriptive name that indicates a variable's content (written in English). This name is not standardized
        nombre_largo % Traducción al español de long_name
        standard_name % A standard name that references a description of a variable's content in the standard name table
        units % Units of a variable's content
    end
    methods % Getters de variable dependientes
        function name = get.name(Obj)
            name = Obj.getName();
        end
        function axis = get.axis(Obj)
            axis = Obj.getAxis();
        end
        function description = get.description(Obj)
            description = Obj.getDescription();
        end
        function long_name = get.long_name(Obj)
            long_name = Obj.getLongName();
        end
        function nombre_largo = get.nombre_largo(Obj)
            nombre_largo = Obj.getNombreLargo();
        end
        function standard_name = get.standard_name(Obj)
            standard_name = Obj.getStandardName();
        end
        function units = get.units(Obj)
            units = Obj.getUnits();
        end
    end
    methods % Setters de variable dependientes
        function Obj = set.name(Obj, name)
            Obj = Obj.setName(name);
        end
        function Obj = set.axis(Obj, axis)
            Obj = Obj.setAxis(axis);
        end
        function Obj = set.description(Obj, description)
            Obj = Obj.setDescription(description);
        end
        function Obj = set.long_name(Obj, long_name)
            Obj = Obj.setLongName(long_name);
        end
        function Obj = set.nombre_largo(Obj, nombre_largo)
            Obj = Obj.setNombreLargo(nombre_largo);
        end
        function Obj = set.standard_name(Obj, standard_name)
            Obj = Obj.setStandardName(standard_name);
        end
        function Obj = set.units(Obj, units)
            Obj = Obj.setUnits(units);
        end
    end
    methods % get* (VariableMetadataInterface)
        function axis = getAxis(Obj)
            axis = Obj.MetadatosVariable.axis;
        end
        function description = getDescription(Obj)
            description = Obj.MetadatosVariable.description;
        end
        function long_name = getLongName(Obj)
            long_name = Obj.MetadatosVariable.long_name;
        end
        function nombre_largo = getNombreLargo(Obj)
            nombre_largo = Obj.MetadatosVariable.nombre_largo;
        end
        function standard_name = getStandardName(Obj)
            standard_name = Obj.MetadatosVariable.standard_name;
        end
        function units = getUnits(Obj)
            units = Obj.MetadatosVariable.units;
        end
    end
    methods % getVariableNameFrom* (VariableMetadataInterface)
        function nombreColumna = getVariableNameFromAxis(Obj, eje)
            nombreColumna = Obj.getVariableNameFromAttribute(VariableAttribute.axis, eje);
        end
        function nombreColumna = getVariableNameFromStandardName(Obj, nombreEstandar)
            nombreColumna = Obj.getVariableNameFromAttribute(VariableAttribute.standard_name, nombreEstandar);
        end
    end
    methods % set*(VariableMetadataInterface)
        function Obj = setAxis(Obj, axis)
            Obj.MetadatosVariable.axis = axis;
        end
        function Obj = setDescription(Obj, description)
            Obj.MetadatosVariable.description = description;
        end
        function Obj = setLongName(Obj, long_name)
            Obj.MetadatosVariable.long_name = long_name;
        end
        function Obj = setNombreLargo(Obj, nombre_largo)
            Obj.MetadatosVariable.nombre_largo = nombre_largo;
        end
        function Obj = setStandardName(Obj, standard_name)
            Obj.MetadatosVariable.standard_name = standard_name;
        end
        function Obj = setUnits(Obj, units)
            Obj.MetadatosVariable.units = units;
        end
    end
end
