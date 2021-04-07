import metadatatools as mdt

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
