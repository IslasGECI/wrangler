import metadatatools as mdt


def test_import_tabludar_data_resource():
    file_dtp_path: str = "tests/data/erradicaciones-mamiferos/captura_gatos_socorro.csv"
    DatosSocorro = mdt.import_tabular_data_resource(file_dtp_path)
