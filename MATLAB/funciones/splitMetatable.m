function [MetadatosVariable,MetadatosRecurso] = splitMetatable(Metatabla)
    esTituloEtTitle = ~(cellfun(@isempty, Metatabla.titulo) | cellfun(@isempty, Metatabla.title));
    esTituloEtTitleUnico = sum(esTituloEtTitle) <= 1;
    if esTituloEtTitleUnico
        esGlobal = esTituloEtTitle;
        esVariable = ~esGlobal;
        MetatablaVariable = Metatabla(esVariable,:);
        MetatablaRecurso = Metatabla(esGlobal,:);
        MetadatosVariable = datatools.VariableMetadata(MetatablaVariable);
        MetadatosRecurso = datatools.ResourceMetadata(MetatablaRecurso);
    else
        error('No pude separar los metadatos de variable de los globales.');
    end
end