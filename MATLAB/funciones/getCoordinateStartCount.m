%GETCOORDINATESTARTCOUNT Encuentra los índices y la cantidad de datos de
%los vectores de coordenadas que vienen desde un archivo NetCDF.
%
% Descripción:
%
%   Los índices y cantidad de datos obtenidos se utilizarán cuando se
%   importen los datos del archivo NetCDF para sólo cargar los datos dentro
%   del dominio de la región.
%
% Autores:
%
%   Efren Cabrera Ortega <efren.cabrera@islas.org.mx>
%   Yutzil Lora Cabrera <yutzil.lora@islas.org.mx>
%
% Referencias:
%
%   -
%
% Sintaxis:
%
%   Estructura = getCoordinateStartCount(nombreArchivo,idRegion)
%
% Entrada:
%
%   nombreArchivo (char)  Nombre del archivo NetCDF
%
%   idRegion (RegionID) ID de la región
%
% Salida:
%
%   Estructura (struct) estructura con los índices y la cantidad de datos
%   de los vectores de coordenadas
%
% Ejemplos:
%
%   Estructura = getCoordinateStartCount('mur-sst-concatenado-mensual-2003-2017.nc',RegionID.guadalupe);
%
% See also: ncread
%
function Estructura = getCoordinateStartCount(nombreArchivo, GeoPoligono, lonAxis, latAxis)
% Se buscan los indices que corresponden a los limites de la región
lon = ncread(nombreArchivo, lonAxis);
lat = ncread(nombreArchivo, latAxis);
% Se buscan los limites de la regi'on
lonMin = nanmin(GeoPoligono.lon);
lonMax = nanmax(GeoPoligono.lon);
latMin = nanmin(GeoPoligono.lat);
latMax = nanmax(GeoPoligono.lat);
% Acomoda las longitudes
lon(lon > 180) = lon(lon > 180) - 360;
% Se buscan los indices de longitud y latitud que caen dentro de la región
esLon = lon > lonMin & lon < lonMax;
esLat = lat > latMin & lat < latMax;

Estructura.inicioLon = find(esLon, 1);
Estructura.inicioLat = find(esLat, 1);
Estructura.nLon = sum(esLon);
Estructura.nLat = sum(esLat);
end