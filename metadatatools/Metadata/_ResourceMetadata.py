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

    @property
    def description(self):
        return self._description

    @description.setter
    def description(self, description):
        self._description = description

    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, name):
        self._id = self._create_id(name)
        self._name = name

    @property
    def path(self):
        return self._path

    @path.setter
    def path(self, path):
        self._path = path

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
