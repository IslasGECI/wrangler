import pandas as pd

from ._IDataVariable import IDataVariable
from ._IVariableMetadata import IVariableMetadata
from ._VariableMetadata import VariableMetadata
from .. import Axis, StandardName
import copy


class DataTable:
    def __init__(self):
        self._datos = None
        self._metadatos = None
        self._metadatos_variables = []

    def where(self, funcion_filtrado):
        datos_filtrados = DataTable()
        datos_filtrados._datos = self._datos.copy(deep=True)
        datos_filtrados._datos = datos_filtrados._datos[funcion_filtrado]
        datos_filtrados._metadatos = copy.deepcopy(self._metadatos)
        datos_filtrados._metadatos_variables = copy.deepcopy(self._metadatos_variables)
        return datos_filtrados

    def __str__(self):
        return self._datos.head().to_string() + f"\n ...\n {len(self._datos)} renglones"

    def __repr__(self):
        return self.__str__()

    @property
    def datos(self):
        return self._datos

    @datos.setter
    def datos(self, datos: pd.DataFrame):
        self._datos = datos

    @property
    def metadatos(self):
        return self._metadatos

    @metadatos.setter
    def metadatos(self, metadatos: pd.DataFrame):
        self._metadatos = metadatos

    @property
    def metadatos_variables(self):
        return self._metadatos_variables

    def add_variable_metadata(self, variable_metadata):
        if not isinstance(variable_metadata, VariableMetadata):
            raise TypeError("Se espera un objeto de la clase datatoos.Metadatos.VariableMetadata")
        self._metadatos_variables.append(variable_metadata)

    def get_variable_name_from_attribute(self):
        pass

    def get_variable_name_from_axis(self, axis: Axis):
        if not isinstance(axis, Axis):
            raise TypeError("Se espera un objeto de la clase datatoos.Axis")
        for variable in self._metadatos_variables:
            if axis == variable.axis:
                return variable.name
        return None

    def get_variable_name_from_standard_name(self, standard_name: Axis):
        if not isinstance(standard_name, StandardName):
            raise TypeError("Se espera un objeto de la clase datatoos.StandardName")
        for variable in self._metadatos_variables:
            if standard_name == variable.standard_name:
                return variable.name
        return None

    def apply(self, funcion, nombre_columna):
        self._datos[nombre_columna] = self._datos[nombre_columna].apply(funcion)

    def get_value(self, nombre_columna):
        return self._datos[nombre_columna].values
