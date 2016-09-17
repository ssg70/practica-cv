#!/bin/bash

####
## Metodos de Gestion de la Informacion
## Master de Matematicas y Computacion
## Sergio Salomon Garcia   <sergio.salomon@alumnos.unican.es>
##
## Procesado de los datos crudos descargados y generacion
## de las nuevas series temporales.
####

datadir="data/"
dataname="T_127P_"
hierachyfile="provincias.csv"
tempdir="tmp/"

serie1="nuclear"
serie2="carbones"
serie3="lignitos"
serie4="fuel"
serie5="gas"
serie6="otros"
serie7="total"

printf "\n"

## Recorre los datos por anho y mes
for y in '2006' '2007' '2008' '2009' '2010' '2011' '2012' '2013' '2014'
do
	for m in 'Enero,01' 'Febrero,02' 'Marzo,03' 'Abril,04' 'Mayo,05' 'Junio,06' 'Julio,07' 'Agosto,08' 'Septiembre,09' 'Octubre,10' 'Noviembre,11' 'Diciembre,12' 
	do 
		## Muestra el progreso del procesado de datos
		printf "."
		echo $m$y

		mes=$(printf "$m" | cut -d "," -f 1)
		mesnum=$(printf "$m" | cut -d "," -f 2)
		acorto=$(printf "$y" | tail -c 2)

		## Compone el nombre del fichero de datos
		datfile="$tempdir$mes-$y/$dataname$mesnum$acorto.txt"

		## Extrae las filas de datos de provincias
		lines=$(cat $datfile| tail -n +10 | head -n 52)

		## Recorre las filas de datos
		while read -r i
		do
			## TODO
		done <<< "$lines"
	done
done

printf "\n"

## Elimina el directorio de datos temporal
# rm -rf $tempdir
