#!/bin/bash

while true; do
    read -p "Ciudad: " ciudad
    if grep -q "^${ciudad} " consumos.txt; then
        break
    else
        echo "La ciudad ingresada no existe en el archivo."
    fi
done

total=0
while read linea; do
    if [[ "${linea}" == "${ciudad} "* ]]; then
        consumo=$(echo "${linea}" | awk '{print $4}')
        total=$((total + consumo))
    fi
done < consumos.txt

echo "Total de consumo para ${ciudad}: ${total}"



