from abc import ABC, abstractmethod


class IDataVariable(ABC):
    @abstractmethod
    def get_variable_metadata(self):
        pass
