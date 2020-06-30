from .. import Axis, StandardName
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

    @property
    def axis(self):
        return self._axis

    @axis.setter
    def axis(self, axis):
        if not (isinstance(axis, Axis) or axis is None):
            raise TypeError(
                "Se espera que se le asigné un eje de la clase datatoos.Axis"
            )
        self._axis = axis

    @property
    def description(self):
        return self._description

    @description.setter
    def description(self, descripcion):
        self._description = descripcion

    @property
    def type(self):
        return self._type

    @type.setter
    def type(self, tipo):
        self._type = tipo

    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, name):
        self._name = name

    @property
    def long_name(self):
        return self._long_name

    @long_name.setter
    def long_name(self, long_name):
        self._long_name = long_name

    @property
    def nombre_largo(self):
        return self._nombre_largo

    @nombre_largo.setter
    def nombre_largo(self, nombre_largo):
        self._nombre_largo = nombre_largo

    @property
    def standard_name(self):
        return self._standard_name

    @standard_name.setter
    def standard_name(self, standard_name):
        if not (isinstance(standard_name, StandardName) or standard_name is None):
            raise TypeError(
                "Se espera que se le asigné un eje de la clase datatoos.StandardName"
            )
        self._standard_name = standard_name

    @property
    def units(self):
        return self._units

    @units.setter
    def units(self, units):
        self._units = units
