#!/bin/bash

URL='https://poetrydb.org/author/Shakespeare/title'

REQUEST=$(curl -s $URL)

OCURRENCE_COUNT=$(echo "$REQUEST"  | grep -c $1 2> /dev/null)

if [ "$OCURRENCE_COUNT" == 0 ]; then
	echo no se ha encontrado la palabra $1
	exit 1
fi

FIRST_LINE_OCURRENCE=$(echo "$REQUEST" | grep -n $1 | tail -1 | cut -f1 -d: )

echo la palabra $1 aparece $OCURRENCE_COUNT veces
echo Aparece por primera vez en la línea $FIRST_LINE_OCURRENCE
