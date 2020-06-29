classdef (Abstract) PackageBaseClass
    properties (Abstract, Access = protected)
        MetadatosPaquete
    end
    properties (Dependent)
        name % A short url-usable (and preferably human-readable) name of the package
        homepage % A URL for the home on the web that is related to this data package
        profile % A string identifying the profile of this descriptor as per the profiles specification
        comment % Miscellaneous information about the data or methods used to produce it
        contributors % The people or organizations who contributed to this Data Package
        description % A markdown formatted description of the package
        history % List of the applications that have modified the original data
        institution % Specifies where the original data was produced
        references % Published or web-based references that describe the data or methods used to produce it
        sources % The raw sources for this data package
        title % A succinct description of what is in the dataset (written in English)
        titulo % Traducción al español de title
    end
    methods % Getters de variable dependientes
        function name = get.name(Obj)
            name = Obj.getName();
        end
        function homepage = get.homepage(Obj)
            homepage = Obj.getHomepage();
        end
        function profile = get.profile(Obj)
            profile = Obj.getProfile();
        end
        function comment = get.comment(Obj)
            comment = Obj.getComment();
        end
        function contributors = get.contributors(Obj)
            contributors = Obj.getContributors();
        end
        function description = get.description(Obj)
            description = Obj.getDescription();
        end
        function history = get.history(Obj)
            history = Obj.getHistory();
        end
        function institution = get.institution(Obj)
            institution = Obj.getInstitution();
        end
        function references = get.references(Obj)
            references = Obj.getReferences();
        end
        function sources = get.sources(Obj)
            sources = Obj.getSources();
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
            Obj = Obj.setName(name);
        end
        function Obj = set.homepage(Obj, homepage)
            Obj = Obj.setHomepage(homepage);
        end
        function Obj = set.profile(Obj, profile)
            Obj = Obj.setProfile(profile);
        end
        function Obj = set.comment(Obj, comment)
            Obj = Obj.setComment(comment);
        end
        function Obj = set.contributors(Obj, contributors)
            Obj = Obj.setContributors(contributors);
        end
        function Obj = set.description(Obj, description)
            Obj = Obj.setDescription(description);
        end
        function Obj = set.history(Obj, history)
            Obj = Obj.setHistory(history);
        end
        function Obj = set.institution(Obj, institution)
            Obj = Obj.setInstitution(institution);
        end
        function Obj = set.references(Obj, references)
            Obj = Obj.setReferences(references);
        end
        function Obj = set.sources(Obj, sources)
            Obj = Obj.setSources(sources);
        end
        function Obj = set.title(Obj, title)
            Obj = Obj.setTitle(title);
        end
        function Obj = set.titulo(Obj, titulo)
            Obj = Obj.setTitulo(titulo);
        end
    end
    methods (Abstract)
        setPackageMetadata(Obj, MetadatosPaquete);
        getPackageAttributeNames(Obj);
    end
    methods (Abstract)
        getAttribute(Obj, nombreAtributo)
        getName(Obj)
        getHomepage(Obj)
        getProfile(Obj)
        getComment(Obj)
        getContributors(Obj)
        getDescription(Obj)
        getHistory(Obj)
        getInstitution(Obj)
        getReferences(Obj)
        getSources(Obj)
        getTitle(Obj)
        getTitulo(Obj)
    end
end

