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
for y in '2006' '2007' '2008' '2009' '2010' '2011' '2012' '2013' '2014' '2015'
do
	## Muestra el progreso de anhos
	printf "\n$y"

	for m in 'Enero,01' 'Febrero,02' 'Marzo,03' 'Abril,04' 'Mayo,05' 'Junio,06' 'Julio,07' 'Agosto,08' 'Septiembre,09' 'Octubre,10' 'Noviembre,11' 'Diciembre,12' 
	do 
		## Muestra el progreso del procesado de datos
		printf "."

		mes=$(printf "$m" | cut -d "," -f 1)
		mesnum=$(printf "$m" | cut -d "," -f 2)
		acorto=$(printf "$y" | tail -c 2)

		## Compone el nombre del fichero de datos
		datfile="$tempdir$mes-$y/$dataname$mesnum$acorto.txt"

		## Extrae las filas de datos de provincias
		lines=$(cat $datfile| tail -n +10 | head -n 52)

		## Recorre las filas de datos
		while read row
		do
			## Conversion de caracteres para procesar ñ (problema en Mac solo?)
			row=$(iconv -f ISO-8859-1 <<< "$row")
			row=$(sed 's/Ñ/NH/g' <<< "$row")

			## Extrae de cada columna el valor de esa serie y elimina puntos
			col0=$(printf "$row" | colrm 22)
			col1=$(printf "$row" | colrm 1 22 | colrm 11 | tr -d '.')
			col2=$(printf "$row" | colrm 1 35 | colrm 11 | tr -d '.')
			col3=$(printf "$row" | colrm 1 48 | colrm 11 | tr -d '.')
			col4=$(printf "$row" | colrm 1 61 | colrm 11 | tr -d '.')
			col5=$(printf "$row" | colrm 1 74 | colrm 11 | tr -d '.')
			col6=$(printf "$row" | colrm 1 87 | colrm 11 | tr -d '.')
			col7=$(printf "$row" | colrm 1 100 | colrm 13 | tr -d '.')

			## Elimina espacios anteriores y posteriores a los valores
			col0=$(echo $col0)
			col1=$(echo $col1)
			col2=$(echo $col2)
			col3=$(echo $col3)
			col4=$(echo $col4)
			col5=$(echo $col5)
			col6=$(echo $col6)
			col7=$(echo $col7)

			## Busca la comunidad autonoma correspondiente
			search=$(grep "$col0," $hierachyfile)
			comaut=$(printf "$search" | cut -d "," -f 2 | tr ' ' '-' | tr -d '.' | tr [A-Z] [a-z])

			## Obtiene la provincia de la primera columna, cambiando espacios, puntos y mayusculas
			prov=$(printf "$col0" | tr ' ' '-' | tr -d '.' | tr [A-Z] [a-z])

			## Guarda los valores de cada columna en las series temporales
			printf "$y$mesnum $col1\n" >> "$datadir$comaut/$prov/$serie1"
			printf "$y$mesnum $col2\n" >> "$datadir$comaut/$prov/$serie2"
			printf "$y$mesnum $col3\n" >> "$datadir$comaut/$prov/$serie3"
			printf "$y$mesnum $col4\n" >> "$datadir$comaut/$prov/$serie4"
			printf "$y$mesnum $col5\n" >> "$datadir$comaut/$prov/$serie5"
			printf "$y$mesnum $col6\n" >> "$datadir$comaut/$prov/$serie6"
			printf "$y$mesnum $col7\n" >> "$datadir$comaut/$prov/$serie7"
		done <<< "$lines"
	done
done

printf "\n"

## Elimina el directorio de datos temporal
rm -rf $tempdir
