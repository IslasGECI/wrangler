import metadatatools as mdt


def test_StandardName():
    obtained = list(mdt.StandardName)
    for member in obtained:
        assert member.value != None

def test_Axis():
    obtained = list(mdt.Axis)
    for member in obtained:
        assert member.value != None