import metadatatools as mdt

VariableMetadata = mdt.Metadata._VariableMetadata.VariableMetadata()


def test_init_():
    assert VariableMetadata.axis == None
    assert VariableMetadata.description == None
    assert VariableMetadata.name == None
    assert VariableMetadata.long_name == None
    assert VariableMetadata.nombre_largo == None
    assert VariableMetadata.standard_name == None
    assert VariableMetadata.units == None
    assert VariableMetadata.type == None
