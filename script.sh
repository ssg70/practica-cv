#!/bin/bash

####
## Metodos de Gestion de la Informacion
## Master de Matematicas y Computacion
## Sergio Salomon Garcia   <sergio.salomon@alumnos.unican.es>
##
## Programa principal.
####

datadir="data/"
tempdir="tmp/"


## Borrado del directorio de datos con confirmacion
read -p "Se procede a borrar el directorio './$datadir'. Desea continuar? (s/n) " -n 1 -r
printf "\n"
if [[ ! $REPLY =~ ^[Ss]$ ]]
then
	## No ha contestado 's' o 'S', el programa termina
    exit
fi
rm -rf ./$datadir


## Borrado del directorio temporal con confirmacion
read -p "Se procede a borrar el directorio './$tempdir'. Desea continuar? (s/n) " -n 1 -r
printf "\n"
if [[ ! $REPLY =~ ^[Ss]$ ]]
then
	## No ha contestado 's' o 'S', el programa termina
    exit
fi
rm -rf ./$tempdir

printf "\n"


## Crea el directorio temporal para almacenar los datos
mkdir ./$tempdir
## Crea la carpeta raiz del directorio de datos
mkdir ./$datadir


## Se ejecutan las funciones del programa

printf "Iniciando la descarga y descompresion de datos...\n"
sh "getdata.sh"
printf "\n"

printf "Generando la jerarquia de directorios para almacenar las series temporales...\n"
sh "mkdirs.sh"
printf "\n"

printf "Procesando los datos brutos y generando las series...\n"
printf "(desde 2006 hasta 2015)\n"
printf "(esta operacion puede tardar)\n"
sh "parser.sh"
printf "\n"


## Elimina el directorio de datos temporal
rm -rf ./$tempdir

printf "El programa finalizo correctamente.\n"

