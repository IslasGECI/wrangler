classdef (Abstract) PackageMetadataBaseClass < datatools.PackageMetadataInterface & datatools.PackageBaseClass
    properties (Access = protected)
        MetadatosPaquete = table()
    end
    methods
        setPackageMetadata(Obj, MetadatosPaquete);
        getPackageAttributeNames(Obj);
    end
    methods
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
    methods % Overload (MetadataInterface)
        function ObjC = vertcat(ObjA, ObjB)
            MetadatosPaqueteA = ObjA.MetadatosPaquete;
            MetadatosPaqueteB = ObjB.MetadatosPaquete;
            MetadatosPaqueteC = [MetadatosPaqueteA; MetadatosPaqueteB];
            ObjC = datatools.PackageMetadata(MetadatosPaqueteC);
        end
    end
end

