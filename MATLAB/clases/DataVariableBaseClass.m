classdef (Abstract) DataVariableBaseClass < datatools.DataVariableInterface & datatools.VariableBaseClass
    properties (Access = protected)
        valor
        MetadatosVariable = datatools.VariableMetadata()
    end
    methods % ?etVariable* (VariableMetadataInterface)
        function atributosVariable = getVariableAttributeNames(Obj)
            atributosVariable = Obj.MetadatosVariable.getVariableAttributeNames();
        end
        function Obj = patchVariableMetadata(Obj, MetadatosVariable)	% defined in datatools.VariableMetadataInterface
            esMetadatosVariable = isa(MetadatosVariable,'datatools.VariableMetadata');
            assert(esMetadatosVariable, '`MetadatosVariable` debe ser de clase <strong>datatools.VariableMetadata</strong>')
            Obj.MetadatosVariable = Obj.MetadatosVariable.patchVariableMetadata(MetadatosVariable);
        end
        function Obj = setVariableMetadata(Obj, MetadatosVariable)
            esMetadatosVariable = isa(MetadatosVariable,'datatools.VariableMetadata');
            assert(esMetadatosVariable, '`MetadatosVariable` debe ser de clase <strong>datatools.VariableMetadata</strong>')
            Obj.MetadatosVariable = MetadatosVariable;
        end
    end
    methods % *Value (DataInterface)
        function valor = getValue(Obj)
            valor = Obj.valor;
        end
        function Obj = setValue(Obj, valor)
            Obj.valor = valor;
        end
    end
    methods % get* (VariableMetadataInterface)
        function atributo = getAttribute(Obj, nombreAtributo)
            atributo = Obj.MetadatosVariable.getAttribute(nombreAtributo);
        end
        function name = getName(Obj)
            name = Obj.MetadatosVariable.getName();
        end
        function nombreVariable = getVariableNameFromAttribute(Obj, atributo, valor)
            nombreVariable = Obj.MetadatosVariable.getVariableNameFromAttribute(atributo, valor);
        end
    end
    methods % getVariableMetadata (DataVariableInterface)
        function MetadatosVariable = getVariableMetadata(Obj)
            MetadatosVariable = Obj.MetadatosVariable;
        end
    end
    methods % Miscelaneo (DataInterface)
        function Obj = applyFunction(Obj, funcion, nombreVariable)
            valorVariable = Obj.getValue();
            valorFuncion = funcion(valorVariable);
            Obj = Obj.setValue(valorFuncion);
        end
        function Obj = where(Obj, funcionLogica)
            valorVariable = Obj.getValue();
            esValor = funcionLogica(valorVariable);
            valorSeleccionado = valorVariable(esValor);
            Obj = Obj.setValue(valorSeleccionado);
        end
    end
    methods % Overload (MetadataInterface)
        function ObjC = vertcat(ObjA, ObjB)
            ValorA = ObjA.getValue();
            ValorB = ObjB.getValue();
            ValorC = [ValorA; ValorB];
            ObjC = ObjA.setValue(ValorC);
        end
    end
    methods % set*(VariableMetadataInterface)
        function Obj = setName(Obj, name)
            Obj.MetadatosVariable = Obj.MetadatosVariable.setName(name);
        end
    end
end