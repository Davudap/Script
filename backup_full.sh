#!/bin/bash 

# primer argumento = destino
# segundo argumento = origen
# Verificando que los argumentos no esten vacios 

if [ -z "$1" ] 
then
	echo "No se ingreso parametros"
	exit
fi

if [ -z "$2" ] 
then
	echo "No se ingreso el segundo parametro origen"
	exit
fi

# Verificando que sean directorios o archivos

if [ -d "$1" ] || [-f "$1" ]
then
	echo "$1 es correcto"
else
	echo "$1 no es archivo ni directorio"
	exit
fi

if [ -d "$2" ] || [ -f "$2" ] 
then
	echo "$2 es correcto"
else
	echo "$2 no es archivo ni directorio"
	exit
fi


u=`echo "${2}" | rev | cut -d/ -f1 | rev`


cd

FECHA=$(date +%Y%m%d) #fecha formato YYYYMMDD
DESTINO="$1/${u}_bkp_$FECHA.tar.gz" #le agrego la ubicacion origen y el nombre 

tar -cpzf $DESTINO $2 #create the backup

STATUS=`echo "$?"`

if [ $STATUS -eq 0 ];then
	logger "Backup de ${u} se ejecuto correctamente" -t LoggerScript -f /var/log/messages
else
	logger "No se pudo realizar backup de ${u}" -t LoggerScript -f /var/log/messages
fi
