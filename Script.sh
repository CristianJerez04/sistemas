#!/bin/bash 

# 1. Definición de variables 
USUARIO="nuevo_usuario"
SERVIDOR="192.168.4.2"
ARCHIVO_LOCAL="/home/crisitian-jerez/archivo_local.txt"
ARCHIVO_REMOTO="/home/nuevo_usuario/archivo_local.txt"
RUTA_REMOTA="/home/nuevo_usuario/"

# 2. Verificar la conectividad con el servidor 
echo "Verificando conectividad con el servidor..."
ping -c 3 $SERVIDOR
if [ $? -ne 0 ]; then
    echo "Error: No se puede conectar al servidor $SERVIDOR."
    exit 1
fi
echo "Conectividad verificada."

# 3. Transferir un archivo al servidor 
echo "Transfiriendo archivo al servidor..."
scp -i ~/.ssh/id_rsa $ARCHIVO_LOCAL $USUARIO@$SERVIDOR:$RUTA_REMOTA
if [ $? -ne 0 ]; then
    echo "Error: No se pudo transferir el archivo al servidor."
    exit 1
fi
echo "Archivo transferido exitosamente."

# 4. Recuperar un archivo del servidor 
echo "Recuperando archivo del servidor..."
scp -i ~/.ssh/id_rsa $USUARIO@$SERVIDOR:$ARCHIVO_REMOTO ./$ARCHIVO_REMOTO
if [ $? -ne 0 ]; then
    echo "Error: No se pudo recuperar el archivo del servidor."
    exit 1
fi
echo "Archivo recuperado exitosamente."

# 5. Mensaje de estado 
echo "Operaciones completadas exitosamente."
