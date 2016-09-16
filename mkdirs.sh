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

## Itera a traves de las provicias y comunidades autonomas
while read i
do
	comaut=$(printf "$i" | cut -d "," -f 2 | tr ' ' '-' | tr -d '.')
	prov=$(printf "$i" | cut -d "," -f 1 | tr ' ' '-' | tr -d '.')

	printf "$i\n"
	printf "\t$prov\n"
	printf "\t$comaut\n"
done < $hierachyfile

