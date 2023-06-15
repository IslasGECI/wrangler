import wrangler as wrg


file_dtp_path: str = "tests/data/erradicaciones-mamiferos/captura_gatos_socorro.csv"
SocorroData = wrg.import_tabular_data_resource(file_dtp_path)


def test_datapackages():
    assert SocorroData.metadata.profile == "tabular-data-resource"
    assert SocorroData.variable_metadata[2].long_name == ""
    assert SocorroData.variable_metadata[2].description == ""
    assert SocorroData.variable_metadata[2].nombre_largo == ""
    assert SocorroData.variable_metadata[2].standard_name == ""
    assert SocorroData.variable_metadata[1].axis == ""
    assert SocorroData.variable_metadata[2].units == ""
    assert SocorroData.variable_metadata[2].type == ""


file_dtp_path: str = "tests/data/empty_metadata/captura_gatos_socorro.csv"
SocorroData2 = wrg.import_tabular_data_resource(file_dtp_path)


def test_datapackages_empty_metadata():
    assert SocorroData2.metadata.description == ""
    assert SocorroData2.metadata.source == "fuente"
    assert SocorroData2.metadata.profile == ""
    assert SocorroData2.metadata.name == ""
    assert SocorroData2.metadata.title == ""
    assert SocorroData2.metadata.titulo == ""
    assert SocorroData2.variable_metadata[0].name == ""
    assert SocorroData2.variable_metadata[1].units == "cats"
