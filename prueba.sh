list="hola"

for x in '2006' '2007'
do
	for y in 'Enero' 'Febrero'
	do 
		curl http://www.minetur.gob.es/energia/balances/Publicaciones/ElectricasMensuales/$x/$y\_$x.zip -o data/$y\_$x
	done 
done

