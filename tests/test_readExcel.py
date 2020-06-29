import unittest
from DataTable import DataTable

class TestReadExcelFuncionality(unittest.TestCase):
    
    def test_readExcelExiste(self):
        '''Prueba que la función existe'''
        Tabla = DataTable.DataTable()
        esMetodoExistente = "readExcel" in dir(Tabla)
        self.assertTrue(esMetodoExistente)

    