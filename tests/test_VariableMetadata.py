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


def test_IVariableMetadata():
    with pytest.raises(
        TypeError,
        match=r"abstract methods axis, description, long_name, name, nombre_largo, standard_name, units$",
    ):
        mdt.Metadata.IVariableMetadata()

    assert isinstance(mdt.Metadata.IVariableMetadata.axis, property)
    assert isinstance(mdt.Metadata.IVariableMetadata.name, property)
    assert isinstance(mdt.Metadata.IVariableMetadata.long_name, property)
    assert isinstance(mdt.Metadata.IVariableMetadata.nombre_largo, property)
    assert isinstance(mdt.Metadata.IVariableMetadata.standard_name, property)
    assert isinstance(mdt.Metadata.IVariableMetadata.units, property)
