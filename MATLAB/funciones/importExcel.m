%IMPORTEXCEL Importa archivos `.xlsx` con datos y metadatos y los convierte
%en una tabla
%
% Descripción:
%
%       Importa libros de Excel (.xlsx) con hojas con datos y metadatos y
%       los convierte en una tabla. Dentro del libro de Excel los datos
%       deben estar guardados en la primer hoja del libro y los metadatos
%       en la segunda hoja.
%
% Autores:
%
%       Evaristo Rojas <evaristo.rojas@islas.org.mx>
%       Daniela Munguía-Cajigas <daniela.munguia@uabc.edu.mx>
%       J. David Martínez-Cervantes <david.martinez@uabc.edu.mx>
%
% Referencias:
%
%     - <a href="http://www.mathworks.com/help/matlab/tables.html">MATLAB Tables</a>
%
% Sintaxis:
%
%         T = importExcel(nombreArchivo) importa los datos y metadatos
%         dentro del archivo con nombre `nombreArchivo` y da como salida
%         una tabla T.
%
%
% Entrada:
%
%     nombreArchivo   (char)   Nombre del archivo de Excel
%
% Salida:
%
%     S               (table)  Tabla con la informaciï¿½n del archivo importado
%
% Ejemplos:
%
%    T = importExcel('datos_importExcel.xlsx');
%
% See also: readtable, table
%

function TablaDatos = importExcel(nombreArchivo)
    Datos = readtable(nombreArchivo,'TreatAsEmpty','NA','Basic',true);
    Metatabla  = readtable(nombreArchivo,'Sheet',2,'ReadRowNames',true,'Basic',true);
    [MetadatosVariable,MetadatosRecurso] = datatools.splitMetatable(Metatabla);
    nombreRecurso = MetadatosRecurso.name;
    esRecursoSinNombre = startsWith(lower(nombreRecurso),'global');
    if esRecursoSinNombre
        % Quédate con la parte posterior a la última diagonal
        nombre = strsplit(nombreArchivo,'/');
        nombre = strsplit(nombre{end},'\');
        nombre = strsplit(nombre{end},'.');
        esNombreConExtencion = length(nombre)>=2 & length(nombre{end})<=4;
        if esNombreConExtencion
            nombre = strjoin(nombre(1:end-1),'_');
            nombre = strrep(nombre,' ','_');
        else
            nombre = 'datos';
        end
        MetadatosRecurso = MetadatosRecurso.setName({nombre});
    end
    TablaDatos = datatools.DataTable();
    TablaDatos = TablaDatos.setVariableMetadata(MetadatosVariable);
    TablaDatos = TablaDatos.setResourceMetadata(MetadatosRecurso);
    TablaDatos = TablaDatos.setData(Datos);
end