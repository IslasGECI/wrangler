import pandas as pd

from ._VariableMetadata import VariableMetadata
from .. import Axis, StandardName
import copy


class DataTable:
    def __init__(self):
        self._data = None
        self._metadata = None
        self._variable_metadata = []

    def where(self, filter_fuction):
        filtered_data = copy.deepcopy(self)
        filtered_data._data = filtered_data._data[filter_fuction]
        return filtered_data

    def __str__(self):
        return self._data.head().to_string() + f"\n ...\n {len(self._data)} renglones"

    def __repr__(self):
        return self.__str__()

    @property
    def data(self):
        return self._data

    @data.setter
    def data(self, data: pd.DataFrame):
        self._data = data

    @property
    def metadata(self):
        return self._metadata

    @metadata.setter
    def metadata(self, metadata: pd.DataFrame):
        self._metadata = metadata

    @property
    def variable_metadata(self):
        return self._variable_metadata

    def add_variable_metadata(self, variable_metadata):
        if not isinstance(variable_metadata, VariableMetadata):
            raise TypeError("Se espera un objeto de la clase datatools.metadata.VariableMetadata")
        self._variable_metadata.append(variable_metadata)

    def get_variable_name_from_attribute(self):
        pass

    def get_variable_name_from_axis(self, axis: Axis):
        if not isinstance(axis, Axis):
            raise TypeError("Se espera un objeto de la clase datatools.Axis")
        for variable in self._variable_metadata:
            if axis.name == variable.axis:
                return variable.name
        return None

    def get_variable_name_from_standard_name(self, standard_name: StandardName):
        if not isinstance(standard_name, StandardName):
            raise TypeError("Se espera un objeto de la clase datatools.StandardName")
        for variable in self._variable_metadata:
            if standard_name.name == variable.standard_name:
                return variable.name
        return None

    def apply(self, function, column_name):
        self._data[column_name] = self._data[column_name].apply(function)

    def get_value(self, column_name):
        return self._data[column_name].values
