classdef (Abstract) ResourceMetadataInterface < datatools.MetadataInterface
    properties (Abstract, Access = protected)
        MetadatosRecurso
    end
    properties (Abstract)
        name % The name is a simple name or identifier to be used for this resource
        id % Igual que name pero sin ".", "-" ni "_"
        path % Property describing the location of the data associated to the resource
        profile % A string identifying the profile of this descriptor as per the profiles specification
        description % A description of the resource
        source % The method of production of the original data
        title % A succinct description of what is in the dataset (written in English)
        titulo % Traducción al español de title
    end
    methods (Abstract) % ?etResource*
        setResourceMetadata(Obj, MetadatosRecurso);
        getResourceAttributeNames(Obj);
    end
    methods (Abstract) % get*
        getAttribute(Obj, nombreAtributo)
        getName(Obj)
        getID(Obj)
        getPath(Obj)
        getProfile(Obj)
        getDescription(Obj)
        getSource(Obj)
        getTitle(Obj)
        getTitulo(Obj)
    end
    methods (Abstract) % set*
        setName(Obj, name)
        setID(Obj, id)
        setPath(Obj, path)
        setProfile(Obj, profile)
        setDescription(Obj, description)
        setSource(Obj, source)
        setTitle(Obj, title)
        setTitulo(Obj, titulo)
    end
end
