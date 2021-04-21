from ._IVariableMetadata import IVariableMetadata


class VariableMetadata(IVariableMetadata):
    def __init__(self):
        self._axis = None
        self._description = None
        self._name = None
        self._long_name = None
        self._nombre_largo = None
        self._standard_name = None
        self._units = None
        self._type = None

    def __str__(self):
        return f"""
axis = {self._axis}
description = {self._description}
name = {self._name}
long_name = {self._long_name}
nombre_largo = {self._nombre_largo}
standard_name = {self._standard_name}
units = {self._units}
type = {self._type}
        """

    def __repr__(self):
        return self.__str__()

    def get_axis(self):
        return self._axis

    def set_axis(self, axis):
        self._axis = axis

    axis = property(get_axis, set_axis)

    def get_description(self):
        return self._description

    def set_description(self, descripcion):
        self._description = descripcion

    description = property(get_description, set_description)

    @property
    def type(self):
        return self._type

    @type.setter
    def type(self, tipo):
        self._type = tipo

    def get_name(self):
        return self._name

    def set_name(self, name):
        self._name = name

    name = property(get_name, set_name)

    def get_long_name(self):
        return self._long_name

    def set_long_name(self, long_name):
        self._long_name = long_name

    long_name = property(get_long_name, set_long_name)

    def get_nombre_largo(self):
        return self._nombre_largo

    def set_nombre_largo(self, nombre_largo):
        self._nombre_largo = nombre_largo

    nombre_largo = property(get_nombre_largo, set_nombre_largo)

    def get_standard_name(self):
        return self._standard_name

    def set_standard_name(self, standard_name):
        self._standard_name = standard_name

    standard_name = property(get_standard_name, set_standard_name)

    def get_units(self):
        return self._units

    def set_units(self, units):
        self._units = units

    units = property(get_units, set_units)
