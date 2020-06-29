classdef VariableAttribute
    enumeration
        name % This property should correspond to the name of field/column in the data file
        axis % Identifies latitude, longitude, vertical, or time axes
        description % A description for this field
        long_name % A descriptive name that indicates a variable's content (written in English). This name is not standardized
        nombre_largo % Traducción al espanol de long_name
        standard_name % A standard name that references a description of a variable's content in the standard name table
        units % Units of a variable's content
    end
end