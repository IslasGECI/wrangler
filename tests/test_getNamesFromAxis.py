from Tablanal import Tablanal


import toolboxes

archivoPrueba = toolboxes.findInDataPath("ARCHIVO_PARA_EVALUAR_PRUEBAS.xlsx")


def test_getNameFromAxis():
    """Prueba que la función extrae el nombre de la columna con axis T"""
    Tabla = Tablanal.readExcel(archivoPrueba)
    nombreEjeTiempo = Tabla.getNameFromAxis(IndependentVariable.T)
    assert nombreEjeTiempo == "Fecha"
