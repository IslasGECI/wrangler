import wrangler as wrg


def test_StandardName():
    obtained = list(wrg.StandardName)
    for member in obtained:
        assert member.value is not None


def test_Axis():
    obtained = list(wrg.Axis)
    for member in obtained:
        assert member.value is not None
