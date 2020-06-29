import pandas as pd

from ._IDataVariable import IDataVariable
from ._IVariableMetadata import IVariableMetadata
from ._VariableMetadata import VariableMetadata


class DataVariable(IDataVariable):

    def __init__(self):
        self._datos = None
        self._metadatos: IVariableMetadata = VariableMetadata()

    def get_variable_metadata(self):
        return self._metadatos
