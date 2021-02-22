import numpy as np
import pytest
from Tablanal import DataTable
import metadatatools as mdt

file_dtp_path: str = "tests/data/erradicaciones-mamiferos/captura_gatos_socorro.csv"
DatosSocorro = mdt.import_tabular_data_resource(file_dtp_path)


@pytest.mark.skip(reason="no way of currently testing this")
def test_get_variable_name_from_standard_name():
    expected_name: str = "esfuerzo"
    obtained_name: str = DatosSocorro.get_variable_name_from_standard_name(mdt.StandardName.effort)
    assert expected_name == obtained_name


def test_get_value():
    nombre_capturas: str = "Capturas"
    obtained_catches: np.array = np.array(DatosSocorro.get_value(nombre_capturas))
    expected_catches: np.array = np.array([51, 31, 33, 21, 10])
    are_equal = (expected_catches == obtained_catches).all()
    assert are_equal
