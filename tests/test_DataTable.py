import numpy as np
import wrangler as wrg
import pytest


file_dtp_path: str = "tests/data/erradicaciones-mamiferos/captura_gatos_socorro.csv"
SocorroData = wrg.import_tabular_data_resource(file_dtp_path)


def test_repr():
    assert "renglones" in repr(SocorroData)


def test_get_variable_name_from_standard_name():
    expected_name: str = "Esfuerzo"
    obtained_name: str = SocorroData.get_variable_name_from_standard_name(wrg.StandardName.effort)
    assert expected_name == obtained_name
    with pytest.raises(TypeError, match=r"^Se espera un objeto de la clase"):
        obtained_name: str = SocorroData.get_variable_name_from_standard_name("Hola")


def test_get_variable_name_from_axis():
    expected_name: str = "Fecha"
    obtained_name: str = SocorroData.get_variable_name_from_axis(wrg.Axis.T)
    assert expected_name == obtained_name
    with pytest.raises(TypeError, match=r"^Se espera un objeto"):
        obtained_name: str = SocorroData.get_variable_name_from_axis("Hola")


def test_add_variable_metadata():
    with pytest.raises(TypeError, match=r"^Se espera un objeto de la clase"):
        SocorroData.add_variable_metadata("Hola")


def test_get_value():
    column_name: str = "Capturas"
    expected_catches: np.array = np.array([51, 31, 33, 21, 10])
    obtained_catches: np.array = np.array(SocorroData.get_value(column_name))
    are_equal = (expected_catches == obtained_catches).all()
    assert are_equal


def test_Resource_Metadata():
    expected_resource_metadata = SocorroData.metadata
    assert "captura_gatos_socorro" == expected_resource_metadata.name
    assert "capturagatossocorro" == expected_resource_metadata.id
    assert expected_resource_metadata.path == "tests/data/erradicaciones-mamiferos"
    assert expected_resource_metadata.title == "Effort and catch of cats on Socorro island"
    assert expected_resource_metadata.titulo == "Esfuerzo y capturas de gatos en isla Socorro"
    assert expected_resource_metadata.description == "descripcion captura_gatos_socorro"
    assert expected_resource_metadata.source == ""


def test_Varible_Metadata():
    expected_variables_metadata = SocorroData.variable_metadata
    assert (
        expected_variables_metadata[0].description
        == "Indica la cantidad de trampas por noche utilizadas para la erradicación"
    )
    assert expected_variables_metadata[0].name == "Esfuerzo"
    assert expected_variables_metadata[0].nombre_largo == "Esfuerzo"
    assert expected_variables_metadata[0].standard_name == "effort"
    assert expected_variables_metadata[0].type == "integer"
    assert expected_variables_metadata[1].long_name == "Cat catchs"
    assert expected_variables_metadata[1].units == ""


def test_where():
    index = [True, False, False, False, False]
    FilteredSocorroData: np.array = SocorroData.where(index)
    column_name: str = "Capturas"
    expected_catches: np.array = np.array([51])
    obtained_catches: np.array = np.array(FilteredSocorroData.get_value(column_name))
    are_equal = (expected_catches == obtained_catches).all()
    assert are_equal


def test_where_2():
    index = [True, False, False, False, False]
    original_expected_path = SocorroData.metadata.get_path()
    FilteredSocorroData = SocorroData.where(index)
    new_path: str = "non_existing_path"
    FilteredSocorroData.metadata.set_path(new_path)
    assert SocorroData.metadata.get_path() == original_expected_path
    assert len(SocorroData.variable_metadata) == len(FilteredSocorroData.variable_metadata)


def test_init():
    data = wrg.Metadata.DataTable()
    assert data.data is None
    assert data.metadata is None


def test_apply():
    SocorroData.apply(lambda x: x + 1, "Capturas")
    column_name: str = "Capturas"
    expected_catches: np.array = np.array([51, 31, 33, 21, 10]) + 1
    obtained_catches: np.array = np.array(SocorroData.get_value(column_name))
    are_equal = (expected_catches == obtained_catches).all()
    assert are_equal
