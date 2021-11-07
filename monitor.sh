#!/bin/bash

# pidof obtiene los PIDs de un programa en ejecucion

PID=`pidof $1`


# SI $PID esta vacio, el proceso que se ingreso no se esta ejecutando
# SI $PID no esta vacio, el proceso se esta ejecutando

if [  "$PID" ]
then
	echo "$1 se esta ejecutando"
else
	echo "$1 no se esta ejecutando"
fi

