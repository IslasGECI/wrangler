import metadatatools as mdt


diccionario = {"name": "Nombre"}
Field = mdt.Field(diccionario)


def test_Field():
    name_expected = diccionario["name"]
    name_obtained = Field.name
    assert name_expected == name_obtained


def test_Field_add_property():
    expected_value = 0
    name_property = "new_property"
    Field.add_property(name_property, expected_value)
    dictionary_field = Field.get_dict()
    obtained_value = dictionary_field[name_property]
    assert expected_value == obtained_value


def test_Field_modify_property():
    expected_value = 2
    name_property = "new_property"
    Field.modify_property(name_property, expected_value)
    dictionary_field = Field.get_dict()
    obtained_value = dictionary_field[name_property]
    assert expected_value == obtained_value
