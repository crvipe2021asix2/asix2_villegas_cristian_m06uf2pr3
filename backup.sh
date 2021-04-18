#!/bin/bash
#Cristian Villegas

echo -n "Indica la ruta del archivo: "
read ruta
echo -n "Indica la ruta del archivo para copiar: "
read archivo
echo -n "Ruta indicada: $ruta/$archivo"
echo ""
DIR="/home/crvipe/FitxConfBackup"
if [ -d "$DIR" ]; then
  echo "EL directorio FitxConfBackup ya esta"
else
  echo "El directorio ${DIR} no existe, se va a crear"
  mkdir /home/crvipe/FitxConfBackup
fi
FILE=/home/crvipe/$archivo
if [ -f $FILE ]; then
    echo "$FILE ya existe, sobreescribiendo"
    cp "$ruta/$archivo" /home/crvipe/FitxConfBackup
    else
  echo "No existe el archivo, creando"
  cp "$ruta/$archivo" /home/crvipe/FitxConfBackup
fi
exit 0


