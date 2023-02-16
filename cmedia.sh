#!/bin/bash

# Comprobamos si se proporcionó una ciudad como argumento
if [ -z "$1" ]; then
  echo "Debes proporcionar el nombre de una ciudad como argumento"
  exit 1
fi

# Almacenamos la ciudad en una variable
ciudad="$1"

# Comprobamos si la ciudad existe en el archivo de consumos
if ! grep -q "^$ciudad " consumos.txt; then
  echo "La ciudad ingresada no existe en el archivo."
  exit 1
fi

# Calculamos la media de los consumos para la ciudad especificada
media=$(awk -v c="$ciudad" '$1 == c { sum += $4; count++ } END { print sum/count }' consumos.txt)

# Mostramos la media de los consumos para la ciudad especificada
echo "La media de consumo para la ciudad de $ciudad es: $media"
