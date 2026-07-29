from abc import ABC, abstractmethod

from .. import Axis, StandardName


class IVariableMetadata(ABC):
    @abstractmethod
    def get_axis(self):
        pass

    @abstractmethod
    def set_axis(self, axis: Axis):
        pass

    axis = property(get_axis, set_axis)

    @abstractmethod
    def get_description(self):
        pass

    @abstractmethod
    def set_description(self, descripcion: str):
        pass

    description = property(get_description, set_description)

    @abstractmethod
    def get_name(self):
        pass

    @abstractmethod
    def set_name(self, name: str):
        pass

    name = property(get_name, set_name)

    @abstractmethod
    def get_long_name(self):
        pass

    @abstractmethod
    def set_long_name(self, long_name: str):
        pass

    long_name = property(get_long_name, set_long_name)

    @abstractmethod
    def get_nombre_largo(self):
        pass

    @abstractmethod
    def set_nombre_largo(self, nombre_largo: str):
        pass

    nombre_largo = property(get_nombre_largo, set_nombre_largo)

    @abstractmethod
    def get_standard_name(self):
        pass

    @abstractmethod
    def set_standard_name(self, standard_name: StandardName):
        pass

    standard_name = property(get_standard_name, set_standard_name)

    @abstractmethod
    def get_units(self):
        pass

    @abstractmethod
    def set_units(self, units: str):
        pass

    units = property(get_units, set_units)
