
# Práctica de Shell y Control de Versiones
Métodos de Gestión de la Información (Máster en Matemáticas y Computación) <br/>
*Sergio Salomón García* <br/>

-------

## Descripcion
El objetivo de la tarea es crear un script en Bash shell para acceder a las series temporales mensuales de producción eléctrica publicadas por el Ministerio de Industria:

> http://www.minetur.gob.es/energia/balances/Publicaciones/ElectricasMensuales/Paginas/ElectricasMensuales.aspx

En concreto hay que obtener los datos de la tabla:

> 1.2.7 PRODUCCION BRUTA DE ENERGIA TERMOELECTRICA POR PROVINCIAS SEGUN EL COMBUSTIBLE

y generar un directorio por Comunidad autonoma (ID\_Nombre Comunidad Autónoma).

> http://www.ine.es/daco/daco42/codmun/cod\_ccaa.htm

Dentro de cada comunidad autonoma, habrá otro directorio con la provincia (ID\_Nombre Provincia):

> http://www.ine.es/daco/daco42/codmun/cod\_provincia.htm

Y dentro de este directorio, habrá un fichero por cada tipo de energía termoeléctrica, incluyendo el Total.


Cada fichero consistirá en la serie temporal completa del tipo de combustible con el formato:

	200601 60221
	200602 62933
	........

en la que la primera columna será el año y el mes (AAAAMM) y la segunda columna la producción expresada en MWh, eliminando el '.' para separar los miles.

Es conveniente separar el script en varios ficheros, y para todo el desarrollo usad GitHub.


## Organizacion del código
Se estructura el programa en varios ficheros sh según las funciones principales a resolver.
- `getdata.sh`: descarga los datos del repositorio web y los descomprime.
- `mkdirs.sh`: genera la jerarquía de directorios por comunidades autónomas y provincias, e inicializa las series temporales vacías.
- `parser.sh`: procesa los datos brutos para generar las series temporales correspondientes.
- `script.sh`: programa principal, encargado de invocar al resto de funciones.

Todos los scripts de prueba utilizarán el nombre `testN.sh`.

Además, se emplea un fichero `provincias.csv` en el programa el cual establece la relación 'provincia > comunidad autónoma'.


## Trabajo futuro
La eficiencia de la función `parser.sh` deja mucho que desear. Por ello, una posible mejora sería la optimización de esta función, o el empleo de un esquema algorítmico más sofisticado para el procesado de los datos.

