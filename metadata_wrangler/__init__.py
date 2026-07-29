"""
Este es el módulo principal de datatools
"""

__version__ = "0.2.2"

from ._Axis import Axis  # noqa
from ._StandardName import StandardName  # noqa
from .Metadata import ResourceMetadata  # noqa
from .Metadata import IResourceMetadata  # noqa
from .io import import_tabular_data_resource  # noqa
