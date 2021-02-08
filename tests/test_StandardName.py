import metadatatools as mdt


def test_date():
    obtained = list(mdt.StandardName)
    for member in obtained:
        assert member.value != None
