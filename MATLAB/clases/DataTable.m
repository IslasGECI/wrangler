classdef DataTable < datatools.DataResourceBaseClass
    properties (Access = protected)
        Datos = table()
    end
    methods % Constructor
    end
    methods % Setters de propiedades privadas (DataInterface)
        function Obj = setData(Obj, Datos)
            esTabla = istable(Datos);
            assert(esTabla, 'Los datos deben ser una tabla.')
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
            Datos = Obj.Datos;
            Datos = Datos(funcionLogica(Datos),:);
            Obj = setData(Obj, Datos);
        end
    end
    methods % Miscelaneo (DataResourceInterface)
        function Seleccion = select(Obj, nombreVariable)
            isVariable = @(x) x.Properties.RowNames == string(nombreVariable);
            MetadatosVariable = Obj.MetadatosVariable.where(isVariable);
            Seleccion = datatools.DataTable();
            Seleccion = Seleccion.setVariableMetadata(MetadatosVariable);
            Datos = Obj.Datos(:, nombreVariable);
            Seleccion = Seleccion.setData(Datos);
        end
    end
    methods % toTabularData*
        function tdrJSON = toTabularDataResource(Obj)
            TableSchema = Obj.MetadatosVariable.toTableSchema();
            TabularDataResource = Obj.MetadatosRecurso.toTabularDataResource();
            TabularDataResource.schema = TableSchema;
            tdrJSON = jsonencode(TabularDataResource);
            tdrJSON = strrep(tdrJSON,'NaN','null');
            tdrJSON = strrep(tdrJSON,':"",',':null,');
        end
        function varargout = toTabularDataPackage(Obj,nombre)
            if nargin == 1
                nombre = lower(matlab.lang.makeValidName(Obj.getResourceMetadata.name{:}));
            else % nargin == 2
                nombre = lower(matlab.lang.makeValidName(nombre));
            end
            nombreDirectorio = 'datapackage';
            MetadatosRecurso = Obj.getResourceMetadata;
            MetadatosRecurso = MetadatosRecurso.setName({nombre});
            MetadatosRecurso = MetadatosRecurso.setPath({[nombre '.csv']});
            Obj = Obj.setResourceMetadata(MetadatosRecurso);
            mkdir(nombreDirectorio)
            writetable(Obj.Datos,[nombreDirectorio filesep nombre '.csv'],'Encoding','UTF-8');
            tdpJSON = [...
                '{"profile":"tabular-data-package","resources":['...
                Obj.toTabularDataResource...
                ']}'...
                ];
            archivo = fopen([nombreDirectorio filesep 'datapackage.json'],'w');
            fwrite(archivo,tdpJSON);
            fclose(archivo);
            if nargout == 1
                varargout{1} = tdpJSON;
            end
        end
    end
    methods % toExcel
        function toExcel(Obj)
            nombre = Obj.name{:};
            nombreArchivo = [nombre '.xls'];
            writetable(Obj.Datos,nombreArchivo)
            Metatabla = datatools.mergeMetadata(Obj.MetadatosRecurso,Obj.MetadatosVariable);
            writetable(Metatabla,nombreArchivo,'Sheet',2)
        end
    end
end