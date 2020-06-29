classdef TableAttribute
    enumeration
        name % The name is a simple name or identifier to be used for this resource
        id % Igual que name pero sin ".", "-" ni "_"
        path % Property describing the location of the data associated to the resource
        profile % A string identifying the profile of this descriptor as per the profiles specification
        description % A description of the resource
        source % The method of production of the original data
        title % A succinct description of what is in the dataset (written in English)
        titulo % Traducción al español de title
    end
end