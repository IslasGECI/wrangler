import metadatatools as mdt


file_dtp_path: str = "tests/data/erradicaciones-mamiferos/captura_gatos_socorro.csv"
SocorroData = mdt.import_tabular_data_resource(file_dtp_path)


def test_datapackages():
    assert SocorroData.metadata.profile == "tabular-data-resource"
    assert SocorroData.metadatos_variables[2].long_name == ""
    assert SocorroData.metadatos_variables[2].description == ""
    assert SocorroData.metadatos_variables[2].nombre_largo == ""
    assert SocorroData.metadatos_variables[2].standard_name == ""
    assert SocorroData.metadatos_variables[1].axis == ""
    assert SocorroData.metadatos_variables[2].units == ""
    assert SocorroData.metadatos_variables[2].type == ""


file_dtp_path: str = "tests/data/empty_metadata/captura_gatos_socorro.csv"
SocorroData2 = mdt.import_tabular_data_resource(file_dtp_path)


def test_datapackages_empty_metadata():
    assert SocorroData2.metadata.description == ""
    assert SocorroData2.metadata.source == "fuente"
    assert SocorroData2.metadata.profile == ""
    assert SocorroData2.metadata.name == ""
    assert SocorroData2.metadata.title == ""
    assert SocorroData2.metadata.titulo == ""
    assert SocorroData2.metadatos_variables[0].name == ""
    assert SocorroData2.metadatos_variables[1].units == "cats"
