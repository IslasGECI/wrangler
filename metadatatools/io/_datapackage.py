import json
import os

import pandas as pd

from ..Metadata import DataTable, ResourceMetadata, VariableMetadata


def import_tabular_data_resource(path: str):
    """
    Esta función te permite importar el resource de un datapackage.

    # Parámetros

    `path str`
    Dirección al resource que quieres importar
    """
    head_path, tail_path = os.path.split(path)
    with open(
        f"{head_path}/datapackage.json", "r", encoding="utf-8"
    ) as metadata_file:
        metadata_dictionary = json.load(metadata_file)
    tabla_datos = pd.read_csv(path)
    data_table = DataTable()
    for resource in metadata_dictionary["resources"]:
        if resource["path"] == tail_path:
            varible_metadata_dictionary = resource
    resource_metadata = _build_metadata(varible_metadata_dictionary, head_path)
    data_table.metadata = resource_metadata
    add_variable_metadata(data_table, varible_metadata_dictionary)
    data_table.data = tabla_datos
    return data_table


def _build_metadata(metadata, head_path):
    resource_metadata = ResourceMetadata()
    resource_metadata.name = metadata.get("name", "")
    resource_metadata.description = metadata.get("description", "")
    resource_metadata.path = head_path
    resource_metadata.profile = metadata.get("profile", "")
    resource_metadata.source = metadata.get("sources", "")
    resource_metadata.title = metadata.get("title", "")
    resource_metadata.titulo = metadata.get("titulo", "")
    return resource_metadata


def add_variable_metadata(data_table, varible_metadata_dictionary):
    for diccionario_metadatos_variable in varible_metadata_dictionary["schema"]["fields"]:
        metadatos_variable = VariableMetadata()
        metadatos_variable.name = diccionario_metadatos_variable.get("name", "")
        metadatos_variable.long_name = diccionario_metadatos_variable.get("long_name", "")
        metadatos_variable.description = diccionario_metadatos_variable.get("description", "")
        metadatos_variable.nombre_largo = diccionario_metadatos_variable.get("nombre_largo", "")
        metadatos_variable.standard_name = diccionario_metadatos_variable.get("standard_name", "")
        metadatos_variable.axis = diccionario_metadatos_variable.get("axis", "")
        metadatos_variable.units = diccionario_metadatos_variable.get("units", "")
        metadatos_variable.type = diccionario_metadatos_variable.get("type", "")
        data_table.add_variable_metadata(metadatos_variable)
