"""
Este es el módulo principal de datatools
"""

from ._Axis import Axis
from ._StandardName import StandardName
from .Metadata import ResourceMetadata
from .Metadata import IResourceMetadata
from .io import import_tabular_data_resource
from .datapackage import DatpackageModifier
