classdef (Abstract) DataPackageInterface < datatools.PackageMetadataInterface & datatools.DataInterface
    properties (Abstract, Access = protected)
        Paquete
        MetadatosRecuso
    end
    methods (Abstract) % Setters de propiedades privadas
        setPackage(Obj, Paquete)
        setResourceMetadata(Obj, MetadatosRecurso);
    end
    methods (Abstract) % getResource*
        getResourceAttribute(Obj, nombreRecurso, atributoRecurso)
        getResourceNameFromAttribute(Obj, atributo, valor)
        getResourceNameFromID(Obj, id)
        getResourceID(Obj, nombreRecurso)
        getResourcePath(Obj, nombreRecurso)
        getResourceProfile(Obj, nombreRecurso)
        getResourceDescription(Obj, nombreRecurso)
        getResourceSource(Obj, nombreRecurso)
        getResourceTitle(Obj, nombreRecurso)
        getResourceTitulo(Obj, nombreRecurso)
    end
    methods (Abstract) % get*List
        getAttributeList(Obj)
        getNameList(Obj)
        getIdList(Obj)
        getPathList(Obj)
        getProfileList(Obj)
        getDescriptionList(Obj)
        getSourceList(Obj)
        getTitleList(Obj)
        getTituloList(Obj)
    end
    methods (Abstract) % getPackageMetadata
        getPackageMetadata(Obj)
    end
end

