from ._IResourceMetadata import IResourceMetadata


class ResourceMetadata(IResourceMetadata):
    """
    Esta clase se encarga de representar los metadatos asociados a una variable
    """

    def __init__(self):
        self._id = None
        self._description = None
        self._name = None
        self._path = None
        self._profile = None
        self._source = None
        self._title = None
        self._titulo = None

    def __str__(self):
        return f"""
id = {self._id}
description = {self._description}
name = {self._name}
path = {self._path}
profile = {self._profile}
source = {self._source}
title = {self._title}
titulo = {self._titulo}
        """

    def __repr__(self):
        return self.__str__()

    @property
    def id(self):
        return self._id

    def get_description(self):
        return self._description

    def set_description(self, description):
        self._description = description

    description = property(get_description, set_description)

    def get_name(self):
        return self._name

    def set_name(self, name):
        self._id = self._create_id(name)
        self._name = name

    name = property(get_name, set_name)

    def get_path(self):
        return self._path

    def set_path(self, path):
        self._path = path

    path = property(get_path, set_path)

    @property
    def profile(self):
        return self._profile

    @profile.setter
    def profile(self, profile):
        self._profile = profile

    @property
    def source(self):
        return self._source

    @source.setter
    def source(self, source):
        self._source = source

    @property
    def title(self):
        return self._title

    @title.setter
    def title(self, title):
        self._title = title

    @property
    def titulo(self):
        return self._titulo

    @titulo.setter
    def titulo(self, titulo):
        self._titulo = titulo

    def _create_id(self, name: str):
        """
        Función encargada de crear el id a partir de un nombre
        """
        id = name
        for caracter in ["-", "_", "."]:
            if caracter in id:
                id = id.replace(caracter, "")
        return id
