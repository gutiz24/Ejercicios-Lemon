#!/bin/bash

# Controlar erorr de argumento
if [[ $# -lt 1 ]]; then
	echo "Error: se necesitan 1 argumento de la palabra a buscar"
	exit 1
fi


URL='https://poetrydb.org/author/Shakespeare/title'

REQUEST=$(curl -s $URL)

OCURRENCE_COUNT=$(echo "$REQUEST"  | grep -c $1)

# Controlar error de que no se ha enctroado la palabra
if [ "$OCURRENCE_COUNT" == 0 ]; then
	echo no se ha encontrado la palabra $1
	exit 1
fi

FIRST_LINE_OCURRENCE=$(echo "$REQUEST" | grep -n $1 | tail -1 | cut -f1 -d: )

echo la palabra $1 aparece $OCURRENCE_COUNT veces
echo Aparece por primera vez en la línea $FIRST_LINE_OCURRENCE
