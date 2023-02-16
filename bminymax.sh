#!/bin/bash

# Pedimos la ciudad al usuario
read -p "Introduce la ciudad: " ciudad

# Buscamos los datos de consumo de la ciudad
datos=$(grep $ciudad consumos.txt)

# Si la ciudad no está en el archivo, mostramos un mensaje de error
if [ -z "$datos" ]; then
    echo "La ciudad ingresada no existe en el archivo."
    exit 1
fi

# Encontramos el consumo máximo y mínimo
maximo=$(echo "$datos" | sort -k4 -n -r | head -n1)
minimo=$(echo "$datos" | sort -k4 -n | head -n1)

# Extraemos los campos necesarios
maximo_ciudad=$(echo "$maximo" | cut -f1)
maximo_mes=$(echo "$maximo" | cut -f2)
maximo_anio=$(echo "$maximo" | cut -f3)
maximo_consumo=$(echo "$maximo" | cut -f4)

minimo_ciudad=$(echo "$minimo" | cut -f1)
minimo_mes=$(echo "$minimo" | cut -f2)
minimo_anio=$(echo "$minimo" | cut -f3)
minimo_consumo=$(echo "$minimo" | cut -f4)

# Mostramos los resultados
echo "El máximo consumo fue de $maximo_consumo"
echo "El mínimo consumo fue de $minimo_consumo"
