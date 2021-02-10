import copy

from . import Resource


class DatpackageModifier:
    """
    Clase que representa el objeto encargado de contener los metadatos a
    modificar el datapackage generado por goodtables

    Ejemplo de uso:

    `datapackage = goodtables.init_datapackage([ruta_archivo])`
    `dp = DatpackageModifier(diccionario_datapackage)`
    `recurso = dp.resources[0]`
    `recurso.get_field_by_name("latitude").add_property('axis', 'Y')`
    """

    def __init__(self, diccionario_datapackage):
        self._diccionario = copy.deepcopy(diccionario_datapackage)
        self._resources = [Resource(recurso) for recurso in self._diccionario["resources"]]

    @property
    def resources(self):
        """
        Regresa una lista con las referencias a los recursos del datapackage.
        Ya que se regresa una referencia, cualquier modificación que se haga al
        recurso se ve reflejado en el datapackage
        """
        return self._resources

    def get_dict(self):
        """
        Regresa un diccionario que representa al objeto. Esto podría servir para
        generar un json
        """
        return self._diccionario

    def add_minumum_metadata(self):
        """
        Agrega los campos __longname__, __nombrelargo__, __standardname__ y __axis__
        vacíos al datapackage. Estos metadatos son necesarios para poder leerlos
        con datatools.
        """
        propiedades = ["long_name", "nombre_largo", "standard_name", "axis"]
        for recurso in self.resources:
            for campo in recurso.fields:
                for propiedad in propiedades:
                    campo.add_property(propiedad, "")
