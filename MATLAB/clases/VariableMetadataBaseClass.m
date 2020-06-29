classdef (Abstract) VariableMetadataBaseClass < datatools.VariableMetadataInterface & datatools.VariableBaseClass
    properties (Access = protected)
        MetadatosVariable = table()
    end
    methods % ?etVariable* (VariableMetadataInterface)
        function atributosVariable = getVariableAttributeNames(Obj)
            atributosVariable = Obj.MetadatosVariable.Properties.VariableNames;
            atributosVariable = matlab.lang.makeValidName(atributosVariable);
        end
        function Obj = patchVariableMetadata(Obj, MetadatosVariable)
            MetadatosVariable.MetadatosVariable.Properties.RowNames = matlab.lang.makeValidName(MetadatosVariable.MetadatosVariable.Properties.RowNames);
            Obj.MetadatosVariable(char(MetadatosVariable.MetadatosVariable.Properties.RowNames),:) = MetadatosVariable.MetadatosVariable;
        end
        function Obj = setVariableMetadata(Obj, MetadatosVariable)
            MetadatosVariable.Properties.RowNames = matlab.lang.makeValidName(MetadatosVariable.Properties.RowNames);
            Obj.MetadatosVariable = MetadatosVariable;
        end
        
    end
    methods % get* (VariableMetadataInterface)
        function atributo = getAttribute(Obj, nombreAtributo)
            atributo = Obj.MetadatosVariable.(nombreAtributo);
        end
        function name = getName(Obj)
            name = Obj.MetadatosVariable.Properties.RowNames;
        end
        function nombreVariable = getVariableNameFromAttribute(Obj, atributo, valor)
            esAtributoChar = ischar(atributo);
            if ~esAtributoChar
                atributo = atributo.char();
            end
            esVariable = string(Obj.MetadatosVariable.(atributo)) == valor;
            assert(any(esVariable),['No existe variable con ' atributo ' deseado']);
            nombreTodasVariables = Obj.getName();
            nombreVariable = nombreTodasVariables{esVariable};
        end
        function Metatabla = getMetatable(Obj)
            Metatabla = Obj.MetadatosVariable;
        end
    end
    methods % Overload (MetadataInterface)
        function ObjC = vertcat(ObjA, ObjB)
            MetadatosVariableA = ObjA.MetadatosVariable;
            MetadatosVariableB = ObjB.MetadatosVariable;
            MetadatosVariableC = [MetadatosVariableA; MetadatosVariableB];
            ObjC = datatools.VariableMetadata(MetadatosVariableC);
        end
    end
    methods % set*(VariableMetadataInterface)
        function Obj = setName(Obj, name)
            esCellChar = iscellstr(name);
            if ~esCellChar
                esChar = ischar(name);
                [nRenglones, ~] = size(name);
                esUnicaVarible = nRenglones == 1;
                esNombreUnicaVariable = esChar & esUnicaVarible;
                if esNombreUnicaVariable
                    name = {name};
                end
            end
            MetatablaVariable = Obj.MetadatosVariable;
            esMetatablaVacia = isempty(MetatablaVariable);
            if esMetatablaVacia
                description = name(:);
                MetatablaVariable = table(description);
            end
            nombreValido = matlab.lang.makeValidName(name);
            MetatablaVariable.Properties.RowNames = nombreValido;
            Obj.MetadatosVariable = MetatablaVariable;
        end
    end
    methods
        function Obj = where(Obj, funcionLogica)
            MetatablaVariable = Obj.MetadatosVariable;
            MetatablaVariable = MetatablaVariable(funcionLogica(MetatablaVariable),:);
            Obj.MetadatosVariable = MetatablaVariable;
        end
    end
    methods % *TableSchema
        function TableSchema = toTableSchema(Obj)
            MetadatosVariable = Obj.MetadatosVariable;
            MetadatosVariable.name = MetadatosVariable.Properties.RowNames;
            TableSchema.fields = table2struct(MetadatosVariable);
        end
    end
end
