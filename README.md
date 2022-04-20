# Rendimiento de bases de datos en modelos orientados a dominios funcionales 
# TFM 2020-2022

Codigo y scripts generados en el desarrollo del TFM de Daniel Herranz Segundo.
## Instalacion
Carpeta con Instrucciones de instalación de los clusteres Docker

## DDL
Carpeta con los ficheros necesarios para crear las bases de datos MySQL y Cassandra

## Scripts
Carpeta con cuadernos Jupyter con codigo fuente.

* Data_Generator_MongoDB - Cuaderno ETL para generar datos sinteticos en formato JSON para MongoDB
* Select_Cassandra - Cuadernos pruebas select multidominio Cassandra
* Select_MySQL, MongoDB] - Cuaderno pruebas select multidominio MySQL
* Select_MongoDB] - Cuaderno pruebas select multidominio MongoDB
* Load_Cassandra - Cuaderno pruebas insert ETL multidominio Cassandra
* Load_MongoDB - Cuaderno pruebas  insert ETL multidominio MongoDB
* Load_MySQL - Cuaderno pruebas  insert ETL multidominio MySQL
* Update _Cassandra - Cuaderno pruebas update multidominio Cassandra
* Update _MongoDB - Cuaderno pruebas update multidominio MongoDB
* Update _MySQL - Cuaderno pruebas update multidominio MySQL
* Funciones_Agregadas_Cassandra - Cuaderno pruebas max, min, avg multidominio Cassandra
* Funciones_Agregadas_MongoDB - Cuaderno pruebas max, min, avg multidominio MongoDB
* Funciones_Agregadas_MySQL - Cuaderno pruebas max, min, avg multidominio MySQL
* Delete_Cassandra - Cuaderno pruebas Delete multidominio Cassandra
* Delete_MongoDB - Cuaderno pruebas Delete multidominio MongoDB
* Delete_MySQL - Cuaderno pruebas Delete multidominio MySQL

## MockData
Carpeta con ficheros generados desde scripts ETL con datos sinteticos (1M de registros) (por espacio no se adjunta a este repositorio, generables desde Jupyter)

## Results
Carpeta con ficheros csv con las metricas obtenidas desde scripts (load, update, delete, select...). Contiene el cuaderno Jupyter con las graficas comparativas.
