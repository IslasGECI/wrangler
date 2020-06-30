# Clase encargada de representar un recurso dentro de un datapackage

from . import Field


class Resource:
    def __init__(self, diccionario_resource):
        self._diccionario = diccionario_resource
        self._name = self._diccionario["name"]
        self._fields = [Field(campo) for campo in self._diccionario["schema"]["fields"]]

    @property
    def name(self):
        """
        Regresa el nombre del recurso
        """
        return self._name

    @property
    def fields(self):
        """
        Regresa una lista de los campos que contiene el recurso
        """
        return self._fields

    def __repr__(self):
        return f"Recurso: {self.name}"

    def get_field_by_name(self, name):
        """
        Regresa el campo con un nombre especificado, si no existe regresa `None`
        """
        for campo in self.fields:
            if campo.name == name:
                return campo
        return None
