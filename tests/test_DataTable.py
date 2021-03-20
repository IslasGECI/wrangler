import numpy as np
import metadatatools as mdt
import pytest

file_dtp_path: str = "tests/data/erradicaciones-mamiferos/captura_gatos_socorro.csv"
SocorroData = mdt.import_tabular_data_resource(file_dtp_path)


def test_get_variable_name_from_standard_name():
    expected_name: str = "Esfuerzo"
    obtained_name: str = SocorroData.get_variable_name_from_standard_name(mdt.StandardName.effort)
    assert expected_name == obtained_name
    with pytest.raises(TypeError, match=r"Se espera un objeto de la clase*"):
        obtained_name: str = SocorroData.get_variable_name_from_standard_name("Hola")


def test_get_variable_name_from_axis():
    expected_name: str = "Fecha"
    obtained_name: str = SocorroData.get_variable_name_from_axis(mdt.Axis.T)
    assert expected_name == obtained_name
    with pytest.raises(TypeError, match=r"Se espera un objeto de la clase*"):
        obtained_name: str = SocorroData.get_variable_name_from_axis("Hola")


def test_add_variable_metadata():
    with pytest.raises(TypeError, match=r"Se espera un objeto de la clase*"):
        obtained_name: str = SocorroData.add_variable_metadata("Hola")


def test_get_value():
    column_name: str = "Capturas"
    obtained_catches: np.array = np.array(SocorroData.get_value(column_name))
    expected_catches: np.array = np.array([51, 31, 33, 21, 10])
    are_equal = (expected_catches == obtained_catches).all()
    assert are_equal


def test_Resource_Metadata():
    expected_resource_metadata = SocorroData.metadatos
    assert "captura_gatos_socorro" == expected_resource_metadata.name
    assert "capturagatossocorro" == expected_resource_metadata.id
    assert expected_resource_metadata.path == "tests/data/erradicaciones-mamiferos"
    assert expected_resource_metadata.title == "Effort and catch of cats on Socorro island"
    assert expected_resource_metadata.titulo == "Esfuerzo y capturas de gatos en isla Socorro"
