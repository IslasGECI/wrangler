import metadatatools as mdt


dictionary = {"name": "Nombre"}
Field = mdt.Field(dictionary)
name_property = "new_property"


def test_Field():
    name_expected = dictionary["name"]
    name_obtained = Field.name
    assert name_expected == name_obtained


def test_Field_add_property():
    expected_value = 0
    Field.add_property(name_property, expected_value)
    assert_expected_value(expected_value)


def test_Field_modify_property():
    expected_value = 2
    Field.modify_property(name_property, expected_value)
    assert_expected_value(expected_value)


def assert_expected_value(expected_value):
    dictionary_field = Field.get_dict()
    obtained_value = dictionary_field[name_property]
    assert expected_value == obtained_value