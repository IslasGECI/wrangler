classdef (Abstract) ResourceBaseClass
    properties (Abstract, Access = protected)
        MetadatosRecurso
    end
    properties (Dependent)
        name % The name is a simple name or identifier to be used for this resource
        id % Igual que name pero sin ".", "-" ni "_"
        path % Property describing the location of the data associated to the resource
        profile % A string identifying the profile of this descriptor as per the profiles specification
        description % A description of the resource
        source % The method of production of the original data
        title % A succinct description of what is in the dataset (written in English)
        titulo % Traducción al español de title
    end
    methods % Getters de variable dependientes
        function name = get.name(Obj)
            name = Obj.getName();
        end
        function id = get.id(Obj)
            id = Obj.getID();
        end
        function path = get.path(Obj)
            path = Obj.getPath();
        end
        function profile = get.profile(Obj)
            profile = Obj.getProfile();
        end
        function description = get.description(Obj)
            description = Obj.getDescription();
        end
        function source = get.source(Obj)
            source = Obj.getSource();
        end
        function title = get.title(Obj)
            title = Obj.getTitle();
        end
        function titulo = get.titulo(Obj)
            titulo = Obj.getTitulo();
        end
    end
    methods % Setters de variable dependientes
        function Obj = set.name(Obj, name)
            Obj = Obj.getName(name);
        end
        function Obj = set.id(Obj, id)
            Obj = Obj.getID(id);
        end
        function Obj = set.path(Obj, path)
            Obj = Obj.getPath(path);
        end
        function Obj = set.profile(Obj, profile)
            Obj = Obj.getProfile(profile);
        end
        function Obj = set.description(Obj, description)
            Obj = Obj.getDescription(description);
        end
        function Obj = set.source(Obj, source)
            Obj = Obj.getSource(source);
        end
        function Obj = set.title(Obj, title)
            Obj = Obj.getTitle(title);
        end
        function Obj = set.titulo(Obj, titulo)
            Obj = Obj.getTitulo(titulo);
        end
    end
    methods % get* (ResourceMetadataInterface)
        function id = getID(Obj)
            id = Obj.MetadatosRecurso.id;
        end
        function path = getPath(Obj)
            path = Obj.MetadatosRecurso.path;
        end
        function profile = getProfile(Obj)
            profile = Obj.MetadatosRecurso.profile;
        end
        function description = getDescription(Obj)
            description = Obj.MetadatosRecurso.description;
        end
        function source = getSource(Obj)
            source = Obj.MetadatosRecurso.source;
        end
        function title = getTitle(Obj)
            title = Obj.MetadatosRecurso.title;
        end
        function titulo = getTitulo(Obj)
            titulo = Obj.MetadatosRecurso.titulo;
        end
    end
    methods % set* (ResourceMetadataInterface)
        function Obj = setID(Obj, id)
            Obj.MetadatosRecurso.id = id;
        end
        function Obj = setPath(Obj, path)
            Obj.MetadatosRecurso.path = path;
        end
        function Obj = setProfile(Obj, profile)
            Obj.MetadatosRecurso.profile = profile;
        end
        function Obj = setDescription(Obj, description)
            Obj.MetadatosRecurso.description = description;
        end
        function Obj = setSource(Obj, source)
            Obj.MetadatosRecurso.source = source;
        end
        function Obj = setTitle(Obj, title)
            Obj.MetadatosRecurso.title = title;
        end
        function Obj = setTitulo(Obj, titulo)
            Obj.MetadatosRecurso.titulo = titulo;
        end
    end
end