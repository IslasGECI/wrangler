from abc import ABC, abstractmethod


class IResourceMetadata(ABC):
    @property
    @abstractmethod
    def id(self):
        """
        Igual que name pero sin “.”, “-“ ni “_”
        """
        pass

    @abstractmethod
    def get_description(self):
        pass

    @abstractmethod
    def set_description(self, descripcion: str):
        """
        Descripción de la variable
        """
        pass

    description = property(get_description, set_description)

    @abstractmethod
    def get_name(self):
        pass

    @abstractmethod
    def set_name(self, name: str):
        """
        Nombre del paquete, este debe ser corto y que se pueda usar para construir un url
        """
        pass

    name = property(get_name, set_name)

    @abstractmethod
    def get_path(self):
        pass

    @abstractmethod
    def set_path(self, path: str):
        """
        Dirección del archivo en el disco duro
        """
        pass

    path = property(get_path, set_path)

    @abstractmethod
    def get_profile(self):
        pass

    @abstractmethod
    def set_profile(self, profile: str):
        """
        Tipo de datapackage
        """
        pass

    profile = property(get_profile, set_profile)

    @abstractmethod
    def get_source(self):
        pass

    @abstractmethod
    def set_source(self, source: str):
        """
        Descripción sobre el origen de los datos
        """
        pass

    source = property(get_source, set_source)

    @abstractmethod
    def get_title(self):
        pass

    @abstractmethod
    def set_title(self, title: str):
        """
        Título en inglés de la tabla de datos
        """
        pass

    title = property(get_title, set_title)

    @abstractmethod
    def get_titulo(self):
        pass

    @abstractmethod
    def set_titulo(self, titulo: str):
        """
        Título en español de la tabla de datos
        """
        pass

    titulo = property(get_titulo, set_titulo)
