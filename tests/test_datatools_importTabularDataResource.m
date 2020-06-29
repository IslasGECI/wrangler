rutas = dir([toolboxes.getTextDataPath() filesep 'datapackage']);
for ruta = rutas(:)'
    esCarpeta = ruta.isdir == 1 && string(ruta.name(1)) ~= ".";
    if esCarpeta
        listaCSV = dir([ruta.folder filesep ruta.name filesep '*.csv']);
        for csv = listaCSV(:)'
            %% Tabla de datos es clase *DataTable*
            nombreArchivo = [csv.folder filesep csv.name];
            disp(['Leyendo ' nombreArchivo])
            TablaDatos = datatools.importTabularDataResource(nombreArchivo);
            esDataTable = isa(TablaDatos,'datatools.DataTable');
            assert(esDataTable);
            disp('ÉXITO')            
        end            
    end
end