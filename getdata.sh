
## Obtencion de los datos desde el repositorio web dado


## Crea el repositorio objetivo		# TODO 
mkdir data

for y in '2006' '2007' '2008' '2009' '2010' '2011' '2012' '2013' '2014'
do
	for m in 'Enero' 'Febrero' 'Marzo' 'Abril' 'Mayo' 'Junio' 'Julio' 'Agosto' 'Septiembre' 'Octubre' 'Noviembre' 'Diciembre'
	do 
		## Guarda el mes en minuscula
		# mesMin="$(tr [A-Z] [a-z] <<< "$m")"
		read mesMin <<< $(awk '{print tolower($0)}' <<< $m)

		## Descarga de datos de prueba
		curl http://www.minetur.gob.es/energia/balances/Publicaciones/ElectricasMensuales/$y/$m\_$y.zip -o data/$m-$y.zip >& /dev/null

		## Descompresion de los datos
		unzip data/$m-$y.zip -d data/ 	>& /dev/null

		## Borra el fichero descargado tras extraer los datos
		rm data/$m-$y.zip 				>& /dev/null

		## Renombra los ficheros extraidos segun dos posibles patrones
		mv data/$m data/$m-$y			>& /dev/null
		mv data/$m\_$y data/$m-$y		>& /dev/null
		mv "data/$mesMin $y" data/$m-$y	>& /dev/null
	done 
done

