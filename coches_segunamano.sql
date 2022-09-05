# Creamos la database donde vamos alojar el archivo csv que vamos a importar
CREATE DATABASE Coches_segundamano;

# Seleccionamos la tabla ya creada
use Coches_segundamano;

SELECT *FROM coches_segundamano;

# Eliminamos las columnas que no vamos a utilizar
ALTER TABLE Coches_segundamano DROP COLUMN company;
ALTER TABLE Coches_segundamano DROP COLUMN price_financed;
ALTER TABLE Coches_segundamano DROP COLUMN dealer; 

# Número de coches por provincia
SELECT DISTINCT province, COUNT(url) AS coches_provincia 
FROM Coches_segundamano 
GROUP BY province 
ORDER BY coches_provincia DESC;

# Número de coches por año de fabricacion 
SELECT DISTINCT year, COUNT(url) as coches_fabricacion 
FROM Coches_segundamano 
GROUP BY year 
ORDER BY year DESC;

# Precio medio de venta por marca 
SELECT DISTINCT make, AVG(price) AS av_marca 
FROM Coches_segundamano 
GROUP BY make
ORDER BY av_marca DESC;

# TOP 5 Marca de coche usado más vendida en España
SELECT DISTINCT make, country, COUNT(make) AS vendidos_spain 
FROM Coches_segundamano 
GROUP BY make,country 
ORDER BY vendidos_spain DESC LIMIT 5;

#Marca de coches más vendida ordenados por provincia y marca
SELECT DISTINCT province, make, COUNT(url) AS vendidos_provincia 
FROM Coches_segundamano 
GROUP BY province, make 
ORDER BY vendidos_provincia DESC, make DESC;

#Número de coches anunciados por profesional o particular 
SELECT DISTINCT is_professional, COUNT(url) AS particular_profesional 
FROM Coches_segundamano
GROUP BY is_professional
ORDER BY particular_profesional DESC;

#Tipo de cambio con mas anuncios de venta
SELECT DISTINCT shift, COUNT(url) AS tipo_cambio 
FROM Coches_segundamano
GROUP BY shift
ORDER BY tipo_cambio DESC;

#Coches más anunciados por tipo de combustible
SELECT DISTINCT fuel, COUNT(url) AS tipo_fuel
FROM Coches_segundamano
GROUP BY fuel
ORDER BY tipo_fuel DESC;

# Anuncios coches usados por tipo de cambio 
SELECT DISTINCT shift, COUNT(url) AS cambio
FROM Coches_segundamano
GROUP BY shift
ORDER BY cambio DESC;

