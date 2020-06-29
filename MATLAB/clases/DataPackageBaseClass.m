classdef (Abstract) DataPackageBaseClass < datatools.DataPackageInterface & datatools.PackageBaseClass
    properties (Access = protected)
        Paquete
        MetadatosRecuso = datatools.ResourceMetadata()
        MetadatosPaquete = datatools.PackageMetadata()
    end
    methods % ?etPackage* (PackageMetadataInterface)
        getPackageAttributeNames
        setPackageMetadata
    end
    methods % ?etValue (DataInterface)
        getValue
        setValue
    end
    methods % get* (PackageMetadataInterface)
        getAttribute
        getComment
        getContributors
        getDescription
        getHistory
        getHomepage
        getInstitution
        getName
        getProfile
        getReferences
        getSources
        getTitle
        getTitulo
    end
    methods % get*List (DataPackageInterface)
        getAttributeList
        getDescriptionList
        getIdList
        getNameList
        getPathList
        getProfileList
        getSourceList
        getTitleList
        getTituloList
    end
    methods % getPackageMetadata (DataPackageInterface)
        getPackageMetadata
    end
    methods % getResource* (DataPackageInterface)
        getResourceAttribute
        getResourceDescription
        getResourceID
        getResourceNameFromAttribute
        getResourceNameFromID
        getResourcePath
        getResourceProfile
        getResourceSource
        getResourceTitle
        getResourceTitulo
    end
    methods % Miscelaneo (DataInterface)
        applyFunction
        where
    end
    methods % Overload (MetadataInterface)
        vertcat
    end
    methods % Setter de propiedades privadas (DataPackageInterface)
        setPackage
        setResourceMetadata
    end
end