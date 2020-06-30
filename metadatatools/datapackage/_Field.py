class Field:
    """
    Clase encargada de representar un campo dentro del datapackage
    """

    def __init__(self, diccionario_field):
        self._diccionario = diccionario_field
        self._name = diccionario_field["name"]

    @property
    def name(self):
        """
        Regresa el nombre del campo
        """
        return self._name

    def __repr__(self):
        return str(self.get_dict())

    def get_dict(self):
        """
        Regresa un diccionario que contiene la información del campo. Esto
        podría servir para generar un `json` con la información de campo
        """
        return self._diccionario

    def add_property(self, name, value):
        """
        Permite agregar una propiedad al campo
        """
        self._diccionario[name] = value

    def modify_property(self, name, value):
        """
        Actualiza una propiedad que se encuentra en el campo
        """
        # TODO Hacer que este método verifique el valor antes de hacer la
        # modificación
        if name in self._diccionario:
            self._diccionario[name] = value
        else:
            self._diccionario[name] = value
