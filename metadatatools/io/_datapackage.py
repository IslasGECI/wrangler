import json
import os

import pandas as pd

from ..Metadata import DataTable, ResourceMetadata, VariableMetadata
from .. import Axis, StandardName


def import_tabular_data_resource(path: str):
    """
    Esta función te permite importar el recurso de un datapackage.

    # Parámetros

    `path str`
    Dirección al recurso que quieres importar
    """
    direccion_datapackage, direccion_recurso = os.path.split(path)
    with open(
        f"{direccion_datapackage}/datapackage.json", "r", encoding="utf-8"
    ) as archivo_metadatos:
        diccionario_metadatos = json.load(archivo_metadatos)
    tabla_datos = pd.read_csv(path)
    data_table = DataTable()
    for recurso in diccionario_metadatos["resources"]:
        if recurso["path"] == direccion_recurso:
            diccionario_metadatos_variables = recurso
    metadatos_recurso = _build_metadata(diccionario_metadatos_variables, direccion_datapackage)
    data_table.metadatos = metadatos_recurso
    add_variable_metadata(data_table, diccionario_metadatos_variables)
    data_table.datos = tabla_datos
    return data_table


def _build_metadata(metadatos, direccion_datapackage):
    metadatos_recurso = ResourceMetadata()
    metadatos_recurso.name = metadatos.get("name", "")
    metadatos_recurso.description = metadatos.get("description", "")
    metadatos_recurso.path = direccion_datapackage
    metadatos_recurso.profile = metadatos.get("profile", "")
    metadatos_recurso.source = metadatos.get("sources", "")
    metadatos_recurso.title = metadatos.get("title", "")
    metadatos_recurso.titulo = metadatos.get("titulo", "")
    return metadatos_recurso


def add_variable_metadata(data_table, diccionario_metadatos_variables):
    for diccionario_metadatos_variable in diccionario_metadatos_variables["schema"]["fields"]:
        metadatos_variable = VariableMetadata()
        metadatos_variable.name = diccionario_metadatos_variable.get("name", "")
        metadatos_variable.long_name = diccionario_metadatos_variable.get("long_name", "")
        metadatos_variable.description = diccionario_metadatos_variable.get("description", "")
        metadatos_variable.nombre_largo = diccionario_metadatos_variable.get("nombre_largo", "")
        metadatos_variable.standard_name = diccionario_metadatos_variable.get("standard_name", "")
        metadatos_variable.units = diccionario_metadatos_variable.get("units", "")
        metadatos_variable.type = diccionario_metadatos_variable.get("type", "")
        data_table.add_variable_metadata(metadatos_variable)
