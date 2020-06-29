import unittest
from Tablanal import Tablanal

class TestGetNamesFromAxis(unittest.TestCase):
    '''Esta clase prueba que se extraigan los nombres de las columnas de la 
    propiedad axis de los metadatos'''
    def setUp(self):
        import toolboxes
        self.archivoPrueba = toolboxes.findInDataPath("ARCHIVO_PARA_EVALUAR_PRUEBAS.xlsx")

    def test_getNameFromAxis(self):
        '''Prueba que la función extrae el nombre de la columna con axis T'''
        Tabla = Tablanal.readExcel(self.archivoPrueba)
        nombreEjeTiempo = Tabla.getNameFromAxis(IndependentVariable.T)
        self.assertEqual(nombreEjeTiempo,"Fecha")