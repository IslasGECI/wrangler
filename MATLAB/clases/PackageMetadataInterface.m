classdef (Abstract) PackageMetadataInterface < datatools.MetadataInterface
    properties (Abstract, Access = protected)
        MetadatosPaquete
    end
    properties (Abstract)
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
    methods (Abstract)
        setPackageMetadata(Obj, MetadatosPaquete);
        getPackageAttributeNames(Obj);
    end
    methods (Abstract)
        getAttribute(Obj)
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