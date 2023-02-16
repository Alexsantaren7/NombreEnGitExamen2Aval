#!/bin/bash

# Comprobar que se ha pasado una ciudad como argumento
if [ -z "$1" ]; then
    echo "Debe introducir una ciudad como argumento"
    exit 1
fi

ciudad=$1

# Obtener la media de consumo de la ciudad utilizando el script cmedia.sh
media=$(./cmedia.sh "$ciudad" | cut -d '.' -f 1)

# Comprobar si la media es menor que 400
if [ "$media" -lt 400 ]; then
    echo "ECO"
else
    echo "NO ECO"
fi
