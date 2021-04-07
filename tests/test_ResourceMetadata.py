import metadatatools as mdt

ResourceMetadata = mdt.Metadata._ResourceMetadata.ResourceMetadata()


def test_init_():
    assert ResourceMetadata.id is None
    assert ResourceMetadata.description is None
    assert ResourceMetadata.name is None
    assert ResourceMetadata.path is None
    assert ResourceMetadata.profile is None
    assert ResourceMetadata.source is None
    assert ResourceMetadata.title is None
    assert ResourceMetadata.titulo is None


def test_properties():
    ResourceMetadata.profile = "Nombre"
    assert ResourceMetadata.profile == "Nombre"
    ResourceMetadata.name = "Nombre-12.56"
    assert ResourceMetadata.id == "Nombre1256"
