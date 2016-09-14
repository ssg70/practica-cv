#!/bin/bash

####
## Metodos de Gestion de la Informacion
## Master de Matematicas y Computacion
## Sergio Salomon Garcia   <sergio.salomon@alumnos.unican.es>
##
## Obtencion de los datos desde el repositorio web dado 
## y descompresion de estos.
####

dataurl="http://www.minetur.gob.es/energia/balances/Publicaciones/ElectricasMensuales/"
tempdir="tmp/"

## Crea el directorio temporal para almacenar los datos
mkdir $tempdir

## Itera por los anhos y meses a descargar
for y in '2006' '2007' '2008' '2009' '2010' '2011' '2012' '2013' '2014'
do
	for m in 'Enero' 'Febrero' 'Marzo' 'Abril' 'Mayo' 'Junio' 'Julio' 'Agosto' 'Septiembre' 'Octubre' 'Noviembre' 'Diciembre'
	do 
		## Guarda el mes en minuscula
		mesMin="$(tr [A-Z] [a-z] <<< "$m")"

		## Descarga de datos de prueba
		curl $dataurl$y/$m\_$y.zip -o $tempdir$m-$y.zip >& /dev/null

		## Descompresion de los datos
		unzip $tempdir$m-$y.zip -d $tempdir 	>& /dev/null

		## Borra el fichero descargado tras extraer los datos
		rm $tempdir$m-$y.zip 					>& /dev/null

		## Renombra los ficheros extraidos segun dos posibles patrones
		mv $tempdir$m $tempdir$m-$y				>& /dev/null
		mv $tempdir$m\_$y $tempdir$m-$y			>& /dev/null
		mv "$tempdir$mesMin $y" $tempdir$m-$y	>& /dev/null
	done 
done

