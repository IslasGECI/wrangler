import metadatatools as mdt


file_dtp_path: str = "tests/data/erradicaciones-mamiferos/captura_gatos_socorro.csv"
SocorroData = mdt.import_tabular_data_resource(file_dtp_path)


def test_datapackages():
    assert SocorroData.metadatos.profile == "tabular-data-resource"
    assert SocorroData.metadatos_variables[2].long_name == ""
    assert SocorroData.metadatos_variables[2].description == ""
    assert SocorroData.metadatos_variables[2].nombre_largo == ""
    assert SocorroData.metadatos_variables[2].standard_name == ""
    assert SocorroData.metadatos_variables[1].axis == ""
    assert SocorroData.metadatos_variables[2].units == ""
    assert SocorroData.metadatos_variables[2].type == ""
