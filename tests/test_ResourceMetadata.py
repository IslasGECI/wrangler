import metadatatools as mdt
import pytest

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


def test_IResourceMetadata():
    with pytest.raises(
        TypeError,
        match=r"abstract methods description, id, name, path, profile, source, title, titulo$",
    ):
        mdt.Metadata.IResourceMetadata()

    assert isinstance(mdt.Metadata.IResourceMetadata.description, property)
    assert isinstance(mdt.Metadata.IResourceMetadata.id, property)
    assert isinstance(mdt.Metadata.IResourceMetadata.name, property)
    assert isinstance(mdt.Metadata.IResourceMetadata.path, property)
    assert isinstance(mdt.Metadata.IResourceMetadata.profile, property)
    assert isinstance(mdt.Metadata.IResourceMetadata.source, property)
    assert isinstance(mdt.Metadata.IResourceMetadata.title, property)
    assert isinstance(mdt.Metadata.IResourceMetadata.titulo, property)
