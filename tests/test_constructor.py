import unittest
from DataTable import DataTable

class TestConstructor(unittest.TestCase):

    def test_ConstructorVacio(self):        
        Tabla = DataTable.DataTable()
        self.assertEqual(type(Tabla).__name__, 'DataTable')


# Los comentarios pragma no se cuentan en el resumen de coverage
if __name__ == '__main__': # pragma: no cover
    unittest.main() # pragma: no cover
