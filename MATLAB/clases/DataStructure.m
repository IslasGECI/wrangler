classdef DataStructure < datatools.DataResourceBaseClass
    properties (Access = protected)
        Datos = struct()
    end
    methods % Setters de propiedades privadas (DataInterface)
        function Obj = setData(Obj, Datos)
            esEstructura = isstruct(Datos);
            assert(esEstructura, 'Los datos deben ser una estructura.')
            esCongruente = datatools.isDataCongruentWithMetadata(Datos, Obj.MetadatosVariable);
            if esCongruente
                Obj.Datos = Datos;
            else
                error('Los metadatos no coinciden con los datos.')
            end 
        end
    end
    methods % Miscelaneo (DataInterface)
        function Obj = where(Obj, funcionLogica)
            error('Este método todavía no está implementado para `DataStructure`')
        end
    end
    methods % Miscelaneo (DataResourceInterface)
        function Seleccion = select(Obj, nombreVariable)
            isVariable = @(x) x.Properties.RowNames == string(nombreVariable);
            Metadatos = Obj.Metadatos.where(isVariable);
            Seleccion = datatools.DataStructure();
            Seleccion = Seleccion.setMetadata(Metadatos);
            variablesNoSeleccionadas = setdiff(Obj.getNames,nombreVariable);
            Datos = rmfield(Obj.Datos,variablesNoSeleccionadas);
            Seleccion = Seleccion.setData(Datos);
        end
    end
end