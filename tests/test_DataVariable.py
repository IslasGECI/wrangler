import wrangler as wrg
import pytest

Variable = wrg.Metadata.DataVariable()


def test_init():
    assert Variable._data is None
    variable_metadata = Variable.get_variable_metadata()
    class_variable_metadata = wrg.Metadata._VariableMetadata.VariableMetadata
    assert isinstance(variable_metadata, class_variable_metadata)


def test_IDataVariable():
    with pytest.raises(TypeError, match=r"abstract methods get_variable_metadata$"):
        wrg.Metadata.IDataVariable()
