import metadatatools as mdt

ResourceMetadata = mdt.Metadata._ResourceMetadata.ResourceMetadata()


def test_init_():
    assert ResourceMetadata.id == None
    assert ResourceMetadata.description == None
    assert ResourceMetadata.name == None
    assert ResourceMetadata.path == None
    assert ResourceMetadata.profile == None
    assert ResourceMetadata.source == None
    assert ResourceMetadata.title == None
    assert ResourceMetadata.titulo == None

def test_properties():
    ResourceMetadata.profile = "Nombre"
    assert ResourceMetadata.profile == "Nombre"
    ResourceMetadata.name = "Nombre-12.56"
    assert ResourceMetadata.id == "Nombre1256"
