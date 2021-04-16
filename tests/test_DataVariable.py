import metadatatools as mdt
import pytest

Variable = mdt.Metadata.DataVariable()


def test_init():
    assert Variable._datos is None
    variable_metadata = Variable.get_variable_metadata()
    class_variable_metadata = mdt.Metadata._VariableMetadata.VariableMetadata
    assert isinstance(variable_metadata, class_variable_metadata)


def test_IDataVariable():
    with pytest.raises(TypeError, match=r"abstract methods get_variable_metadata$"):
        mdt.Metadata.IDataVariable()
