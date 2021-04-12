import metadatatools as mdt
import pytest

VariableMetadata = mdt.Metadata._VariableMetadata.VariableMetadata()


def test_init_():
    assert VariableMetadata.axis is None
    assert VariableMetadata.description is None
    assert VariableMetadata.name is None
    assert VariableMetadata.long_name is None
    assert VariableMetadata.nombre_largo is None
    assert VariableMetadata.standard_name is None
    assert VariableMetadata.units is None
    assert VariableMetadata.type is None


def test_property():
    VariableMetadata.axis = "Eje"
    assert VariableMetadata._axis == "Eje"
    VariableMetadata.description = "Descripción"
    assert VariableMetadata._description == "Descripción"
    VariableMetadata.long_name = "Nombre largo"
    assert VariableMetadata._long_name == "Nombre largo"
    VariableMetadata.name = "Nombre"
    assert VariableMetadata._name == "Nombre"
    VariableMetadata.nombre_largo = "Nombre largo"
    assert VariableMetadata._nombre_largo == "Nombre largo"
    VariableMetadata.standard_name = "Nombre estandar"
    assert VariableMetadata._standard_name == "Nombre estandar"
    VariableMetadata.units = "Unidades"
    assert VariableMetadata._units == "Unidades"


def test_IVariableMetadata():
    with pytest.raises(
        TypeError,
        match=r"abstract methods axis, description, get_axis, get_description, get_long_name, get_name, get_nombre_largo, get_standard_name, get_units, long_name, name, nombre_largo, set_axis, set_description, set_long_name, set_name, set_nombre_largo, set_standard_name, set_units, standard_name, units$",
    ):
        mdt.Metadata.IVariableMetadata()

    assert isinstance(mdt.Metadata.IVariableMetadata.axis, property)
    assert isinstance(mdt.Metadata.IVariableMetadata.description, property)
    assert isinstance(mdt.Metadata.IVariableMetadata.name, property)
    assert isinstance(mdt.Metadata.IVariableMetadata.long_name, property)
    assert isinstance(mdt.Metadata.IVariableMetadata.nombre_largo, property)
    assert isinstance(mdt.Metadata.IVariableMetadata.standard_name, property)
    assert isinstance(mdt.Metadata.IVariableMetadata.units, property)
