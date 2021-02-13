import metadatatools as mdt


def test_Field():
    diccionario = {"name": "Nombre"}
    Campo = mdt.Field(diccionario)
    name_expected = diccionario["name"]
    name_obtained = Campo.name
    assert name_expected == name_obtained
