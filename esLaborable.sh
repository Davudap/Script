#!bin/bash

esLaborable(){

DATE=`date -d $1 +%D`

if [ ! "$DATE" ]
then
	echo "Formato incorrecto"
	exit
fi
	

#Obtengo en numero de dia de la semana. Empieza por lunes (1)

DIA=$(date -d $1 +%u)

#Obtendo la palabra del dia de la semana

DSEMANA=`date -d $1 +%A`


# Si $DIA es 6 (Sabado), no es laborable

if [ $DIA = 6 ]
then
	echo "$DSEMANA $DATE no es laborable"
	exit
fi

# Si $DIA es 7 (Domingo), no es laborable 

if [ $DIA = 7 ]
then
	echo "$DSEMANA $DATE no es laborable"
	exit
fi

#Obtengo la fecha en formato dia/mes

FECHA=`date -d "$1" +%d/%m`

#Obtengo feriado

FERIADO=`cat feriados.txt | grep -w $FECHA`

#Si $FERIADO existe, no es laborable e imprime el porque

#Si $FERIADO es vacio, es laborable

if [ "$FERIADO" ]
then
	echo "$DSEMANA $DATE no es laborable\n\nFERIADO: $FERIADO"
	exit
else
	echo "$DSEMANA $DATE Es laborable"
fi
}

esLaborable $1
