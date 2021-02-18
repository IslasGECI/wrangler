import metadatatools as mdt


def test_Field():
    diccionario = {"name": "Nombre"}
    Campo = mdt.Field(diccionario)
    name_expected = diccionario["name"]
    name_obtained = Campo.name
    assert name_expected == name_obtained

def test_Field_add_property():
    diccionario = {"name": "Nombre"}
    Campo = mdt.Field(diccionario)
    expected_value = 0
    name_property = "new_property"
    Campo.add_property(name_property, expected_value)
    dict_field = Campo.get_dict()
    obtained_value = dict_field[name_property]
    assert expected_value == obtained_value
