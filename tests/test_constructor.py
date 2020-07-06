from Tablanal import DataTable
import pytest


def test_ConstructorVacio():
    Tabla = DataTable()
    assert type(Tabla).__name__ == "DataTable"

