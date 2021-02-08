from abc import ABC, abstractmethod


class IResourceMetadata(ABC):
    @property
    @abstractmethod
    def id(self):
        """
        Igual que name pero sin “.”, “-“ ni “_”
        """
        pass

    @property
    @abstractmethod
    def description(self):
        pass

    @description.setter
    @abstractmethod
    def description(self, descripcion: str):
        """
        Descripción de la variable
        """
        pass

    @property
    @abstractmethod
    def name(self):
        pass

    @name.setter
    @abstractmethod
    def name(self, name: str):
        """
        Nombre del paquete, este debe ser corto y que se pueda usar para construir un url
        """
        pass

    @property
    @abstractmethod
    def path(self):
        pass

    @path.setter
    @abstractmethod
    def path(self, path: str):
        """
        Dirección del archivo en el disco duro
        """
        pass

    @property
    @abstractmethod
    def profile(self):
        pass

    @profile.setter
    @abstractmethod
    def profile(self, profile: str):
        """
        Tipo de datapackage
        """
        pass

    @property
    @abstractmethod
    def source(self):
        pass

    @source.setter
    @abstractmethod
    def source(self, source: str):
        """
        Descripción sobre el origen de los datos
        """
        pass

    @property
    @abstractmethod
    def title(self):
        pass

    @title.setter
    @abstractmethod
    def title(self, title: str):
        """
        Título en inglés de la tabla de datos
        """
        pass

    @property
    @abstractmethod
    def titulo(self):
        pass

    @titulo.setter
    @abstractmethod
    def titulo(self, titulo: str):
        """
        Título en español de la tabla de datos
        """
        pass
