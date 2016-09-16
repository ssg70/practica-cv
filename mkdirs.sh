#!/bin/bash

####
## Metodos de Gestion de la Informacion
## Master de Matematicas y Computacion
## Sergio Salomon Garcia   <sergio.salomon@alumnos.unican.es>
##
## Generacion de la jerarquia de directorios segun 
## Comunidad > Provincia.
####

datadir="data/"
hierachyfile="provincias.csv"

## Crea la carpeta raiz del directorio de datos
mkdir $datadir >& /dev/null

printf "\n"

## Itera a traves de las provicias y comunidades autonomas
while read i
do
	## Muestra el progreso del bucle
	printf "."

	## Extra cada valor eliminando espacios, puntos y convirtiendo a minusculas
	comaut=$(printf "$i" | cut -d "," -f 2 | tr ' ' '-' | tr -d '.' | tr [A-Z] [a-z])
	prov=$(printf "$i" | cut -d "," -f 1 | tr ' ' '-' | tr -d '.' | tr [A-Z] [a-z])

	## Genera los directorios necesarios
	mkdir "$datadir$comaut/" 		>& /dev/null
	mkdir "$datadir$comaut/$prov/"	>& /dev/null
done < $hierachyfile

printf "\n"

