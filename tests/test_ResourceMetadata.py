import wrangler as wrg
import pytest

ResourceMetadata = wrg.Metadata._ResourceMetadata.ResourceMetadata()


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
    ResourceMetadata.profile = "Profile"
    assert ResourceMetadata._profile == "Profile"
    ResourceMetadata.name = "Nombre-12.56"
    assert ResourceMetadata.id == "Nombre1256"
    ResourceMetadata.path = "Path"
    assert ResourceMetadata._path == "Path"
    ResourceMetadata.description = "Descripcion"
    assert ResourceMetadata._description == "Descripcion"
    ResourceMetadata.source = "Source"
    assert ResourceMetadata._source == "Source"
    ResourceMetadata.title = "Title"
    assert ResourceMetadata._title == "Title"
    ResourceMetadata.titulo = "Titulo"
    assert ResourceMetadata._titulo == "Titulo"


def test_IResourceMetadata():
    with pytest.raises(
        TypeError,
        match=r"abstract methods description, get_description, get_name, get_path, get_profile, get_source, get_title, get_titulo, id, name, path, profile, set_description, set_name, set_path, set_profile, set_source, set_title, set_titulo, source, title, titulo$",
    ):
        wrg.Metadata.IResourceMetadata()

    assert isinstance(wrg.Metadata.IResourceMetadata.description, property)
    assert isinstance(wrg.Metadata.IResourceMetadata.id, property)
    assert isinstance(wrg.Metadata.IResourceMetadata.path, property)
    assert isinstance(wrg.Metadata.IResourceMetadata.profile, property)
    assert isinstance(wrg.Metadata.IResourceMetadata.source, property)
    assert isinstance(wrg.Metadata.IResourceMetadata.title, property)
    assert isinstance(wrg.Metadata.IResourceMetadata.titulo, property)
