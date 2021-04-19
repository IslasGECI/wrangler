import pandas as pd

from ._VariableMetadata import VariableMetadata
from .. import Axis, StandardName
import copy


class DataTable:
    def __init__(self):
        self._data = None
        self._metadata = None
        self._metadatos_variables = []

    def where(self, funcion_filtrado):
        datos_filtrados = copy.deepcopy(self)
        datos_filtrados._data = datos_filtrados._data[funcion_filtrado]
        return datos_filtrados

    def __str__(self):
        return self._data.head().to_string() + f"\n ...\n {len(self._data)} renglones"

    def __repr__(self):
        return self.__str__()

    @property
    def datos(self):
        return self._data

    @datos.setter
    def datos(self, datos: pd.DataFrame):
        self._data = datos

    @property
    def metadatos(self):
        return self._metadata

    @metadatos.setter
    def metadatos(self, metadatos: pd.DataFrame):
        self._metadata = metadatos

    @property
    def metadatos_variables(self):
        return self._metadatos_variables

    def add_variable_metadata(self, variable_metadata):
        if not isinstance(variable_metadata, VariableMetadata):
            raise TypeError("Se espera un objeto de la clase datatools.Metadatos.VariableMetadata")
        self._metadatos_variables.append(variable_metadata)

    def get_variable_name_from_attribute(self):
        pass

    def get_variable_name_from_axis(self, axis: Axis):
        if not isinstance(axis, Axis):
            raise TypeError("Se espera un objeto de la clase datatools.Axis")
        for variable in self._metadatos_variables:
            if axis.name == variable.axis:
                return variable.name
        return None

    def get_variable_name_from_standard_name(self, standard_name: StandardName):
        if not isinstance(standard_name, StandardName):
            raise TypeError("Se espera un objeto de la clase datatools.StandardName")
        for variable in self._metadatos_variables:
            if standard_name.name == variable.standard_name:
                return variable.name
        return None

    def apply(self, funcion, nombre_columna):
        self._data[nombre_columna] = self._data[nombre_columna].apply(funcion)

    def get_value(self, nombre_columna):
        return self._data[nombre_columna].values
