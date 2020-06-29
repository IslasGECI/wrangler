classdef (Abstract) DataResourceBaseClass < datatools.DataResourceInterface & datatools.ResourceBaseClass
    properties (Abstract, Access = protected)
        Datos
    end
    properties (Access = protected)
        MetadatosVariable = datatools.VariableMetadata()
        MetadatosRecurso = datatools.ResourceMetadata()
    end
    methods % *DataVariable (DataResourceInterface)
        function Obj = addDataVariable(Obj, VariableDatos)
            esVariableDatos = isa(VariableDatos, 'datatools.DataVariable');
            assert(esVariableDatos,'El argumento de `addDataVariable` debe ser clase `datatools.DataVariable`');
            MetadatosVariable = [Obj.MetadatosVariable; VariableDatos.getVariableMetadata()];
            Obj.MetadatosVariable = MetadatosVariable;
            Datos = Obj.Datos;
            nombreVariable = char(VariableDatos.getName());
            valorVariable = VariableDatos.getValue();
            Datos.(nombreVariable) = valorVariable;
            Obj = Obj.setData(Datos);
        end
        function Obj = delDataVariable(Obj, nombreVariable)
            error('Falta implementar este método');
        end
        function VariableDatos = getDataVariable(Obj, nombreVariable)
            VariableDatos = datatools.DataVariable();
            isVariable = @(x) string(x.Properties.RowNames) == string(nombreVariable);
            MetadatosVariable = Obj.MetadatosVariable.where(isVariable);
            VariableDatos = VariableDatos.setVariableMetadata(MetadatosVariable);
            valor = Obj.Datos.(nombreVariable);
            VariableDatos = VariableDatos.setValue(valor);
        end
        function Obj = setDataVariable(Obj, VariableDatos)
            esVariableDatos = isa(VariableDatos, 'datatools.DataVariable');
            assert(esVariableDatos,'El argumento de `addDataVariable` debe ser clase `datatools.DataVariable`');

            Obj.MetadatosVariable = Obj.MetadatosVariable.patchVariableMetadata(VariableDatos.getVariableMetadata());
            
            Datos = Obj.Datos;
            nombreVariable = char(VariableDatos.getName());
            valorVariable = VariableDatos.getValue();
            Datos.(nombreVariable) = valorVariable;
            Obj = Obj.setData(Datos);
        end
    end
    methods % ?etResource* (ResourceMetadataInterface)
        function Obj = setResourceMetadata(Obj, MetadatosRecurso)
            esResourceMetadata = isa(MetadatosRecurso,'datatools.ResourceMetadata');
            assert(esResourceMetadata, 'Los metadatos deben ser un objeto de clase *ResourceMetadata* (datatools)')
            Obj.MetadatosRecurso = MetadatosRecurso;
        end
        function atributosRecurso = getResourceAttributeNames(Obj)
            atributosRecurso = Obj.MetadatosRecurso.getResourceAttributeNames();
        end
    end
    methods % *Value (DataInterface)
        function variable = getValue(Obj, nombreVariable)
            variable = Obj.Datos.(nombreVariable);
        end
        function Obj = setValue(Obj, nombreVariable, valorVariable)
            Datos = Obj.Datos;
            Datos.(nombreVariable) = valorVariable;
            Obj = setData(Obj, Datos);
        end
    end
    methods % get* (ResourceMetadataInterface)
        function atributo = getAttribute(Obj, nombreAtributo)
            atributo = Obj.MetadatosRecurso.getAttribute(nombreAtributo);
        end
        function name = getName(Obj)
            name = Obj.MetadatosRecurso.getName();
        end
    end
    methods % getResourceMetadata (DataResourceInterface)
        function MetadatosRecurso = getResourceMetadata(Obj)
            MetadatosRecurso = Obj.MetadatosRecurso;
        end
    end
    methods % getVariable* (DataResourceInterface)
        function valorAtributo = getVariableAttribute(Obj, nombreVariable, atributoVariable)
            esAtributoVariable = isa(atributoVariable,'VariableAttribute');
            if esAtributoVariable
                nombreAtributo = atributoVariable.char();
            else
                nombreAtributo = atributoVariable;
            end
            esNombreVariable = Obj.MetadatosVariable.name == string(nombreVariable);
            atributo = Obj.MetadatosVariable.(nombreAtributo);
            valorAtributo = atributo{esNombreVariable};
        end
        function nombreVariable = getVariableNameFromAttribute(Obj, propiedad, valor)
            nombreVariable = Obj.MetadatosVariable.getVariableNameFromAttribute(propiedad, valor);
        end
        function nombreVariable = getVariableNameFromAxis(Obj, eje)
            nombreVariable = Obj.getVariableNameFromAttribute(VariableAttribute.axis, eje);
        end
        function nombreVariable = getVariableNameFromStandardName(Obj, nombreEstandar)
            nombreVariable = Obj.getVariableNameFromAttribute(VariableAttribute.standard_name, nombreEstandar);
        end
        function eje = getVariableAxis(Obj, nombreVariable)
            eje = Obj.getVariableAttribute(nombreVariable, VariableAttribute.axis);
        end
        function descripcion = getVariableDescription(Obj, nombreVariable)
            descripcion = Obj.getVariableAttribute(nombreVariable, VariableAttribute.description);
        end
        function longName = getVariableLongName(Obj, nombreVariable)
            longName = Obj.getVariableAttribute(nombreVariable, VariableAttribute.long_name);
        end
        function nombreLargo = getVariableNombreLargo(Obj, nombreVariable)
            nombreLargo = Obj.getVariableAttribute(nombreVariable, VariableAttribute.nombre_largo);
        end
        function nombreEstandar = getVariableStandardName(Obj, nombreVariable)
            nombreEstandar = Obj.getVariableAttribute(nombreVariable, VariableAttribute.standard_name);
        end
        function unidades = getVariableUnits(Obj, nombreVariable)
            unidades = Obj.getVariableAttribute(nombreVariable, VariableAttribute.units);
        end
    end
    methods % get*List (DataResourceInterface)
        function atributos = getAttributeList(Obj)
            atributos = Obj.MetadatosVariable.getVariableAttributeNames();
        end
        function nombreVariables = getNameList(Obj)
            nombreVariables = Obj.MetadatosVariable.name;
        end
        function ejes = getAxisList(Obj)
            ejes = Obj.MetadatosVariable.axis;
        end
        function descripciones = getDescriptionList(Obj)
            descripciones = Obj.MetadatosVariable.description;
        end
        function longNames = getLongNameList(Obj)
            longNames = Obj.MetadatosVariable.long_name;
        end
        function nombresLargos = getNombreLargoList(Obj)
            nombresLargos = Obj.MetadatosVariable.nombre_largo;
        end
        function nombresEstandares = getStandardNameList(Obj)
            nombresEstandares = Obj.MetadatosVariable.standard_name;
        end
        function unidades = getUnitsList(Obj)
            unidades = Obj.MetadatosVariable.units;
        end
    end
    methods % Miscelaneo (DataInterface)
        function Obj = applyFunction(Obj, funcion, nombreVariable)
            valorVariable = Obj.getValue(nombreVariable);
            valorFuncion = funcion(valorVariable);
            Obj = Obj.setValue(nombreVariable, valorFuncion);
        end
    end
    methods % Overload (MetadataInterface)
        function ObjC = vertcat(ObjA, ObjB)
            DatosA = ObjA.Datos;
            DatosB = ObjB.Datos;
            DatosC = [DatosA; DatosB];
            ObjC = ObjA.setData(DatosC);
        end
    end
    methods % set* (ResourceMetadataInterface)
        function Obj = setName(Obj, name)
            Obj.MetadatosRecurso = Obj.MetadatosRecurso.setName(name);
        end
    end
    methods % Setter de propiedades privadas (DataResourceInterface)
        function Obj = setVariableMetadata(Obj, MetadatosVariable)
            esVariableMetadata = isa(MetadatosVariable,'datatools.VariableMetadata');
            assert(esVariableMetadata, 'Los metadatos deben ser un objeto de clase *VariableMetadata* (datatools)')
            esRecursoNuevo = isempty(Obj.Datos) | (isstruct(Obj.Datos) & isempty(fields(Obj.Datos)));
            if esRecursoNuevo
                esPermitido = true;
            else
                esPermitido = datatools.isDataCongruentWithMetadata(Obj.Datos, MetadatosVariable);
            end
            if esPermitido
                Obj.MetadatosVariable = MetadatosVariable;
            else
                error('Los metadatos no coinciden con los datos.')
            end
        end
        function Obj = setResource(Obj, Recurso)
            datatools.assertValidResource(Recurso)
            Metatabla = Recurso.Properties.UserData;
            [MetadatosVariable, MetadatosRecurso] = splitMetatable(Metatabla);
            Obj = Obj.setVariableMetadata(MetadatosVariable);
            Obj = Obj.setResourceMetadata(MetadatosRecurso);
            esEstructura = isstruct(Recurso);
            if esEstructura
                Recurso = rmfield(Recurso,'Properties');
            end
            Obj = Obj.setData(Recurso);
        end
    end
    
end
