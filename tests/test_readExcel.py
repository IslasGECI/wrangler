import pytest
from Tablanal import DataTable


def test_readExcelExiste():
    """Prueba que la función existe"""
    Tabla = DataTable()
    esMetodoExistente = "readExcel" in dir(Tabla)
    assert esMetodoExistente
