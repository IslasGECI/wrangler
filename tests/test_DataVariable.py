import metadatatools as mdt

Variable = mdt.Metadata.DataVariable()


def test_init():
    assert Variable._datos == None
    variable_metadata = Variable.get_variable_metadata()
    class_variable_metadata = mdt.Metadata._VariableMetadata.VariableMetadata
    assert isinstance(variable_metadata, class_variable_metadata)
