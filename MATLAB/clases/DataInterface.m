classdef (Abstract) DataInterface
    properties (Abstract)
    end
    methods (Abstract) % *Value
        getValue(Obj, nombreVariable)
        setValue(Obj, nombreVariable, valorVariable)
    end
    methods (Abstract) % Miscelaneo
        applyFunction(Obj, funcion, nombreVariable, nombreRecurso)
        where(Obj, funcionLogica)
    end
end

