from abc import ABC, abstractmethod

from .. import Axis, StandardName


class IVariableMetadata(ABC):

    @property
    @abstractmethod
    def axis(self):
        pass

    @axis.setter
    @abstractmethod
    def axis(self, axis: Axis):
        pass

    @property
    @abstractmethod
    def description(self):
        pass

    @description.setter
    @abstractmethod
    def description(self, descripcion: str):
        pass

    @property
    @abstractmethod
    def name(self):
        pass

    @name.setter
    @abstractmethod
    def name(self, name: str):
        pass

    @property
    @abstractmethod
    def long_name(self):
        pass

    @long_name.setter
    @abstractmethod
    def long_name(self, long_name: str):
        pass

    @property
    @abstractmethod
    def nombre_largo(self):
        pass

    @nombre_largo.setter
    @abstractmethod
    def nombre_largo(self, nombre_largo: str):
        pass

    @property
    @abstractmethod
    def standard_name(self):
        pass

    @standard_name.setter
    @abstractmethod
    def standard_name(self, standard_name: StandardName):
        pass

    @property
    @abstractmethod
    def units(self):
        pass

    @units.setter
    @abstractmethod
    def units(self, units: str):
        pass
