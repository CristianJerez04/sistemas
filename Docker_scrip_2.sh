#!/bin/bash

# Definir un diccionario con nombres personalizados
declare -A contenedores
contenedores=(["nginx"]="nginx_container" ["mysql"]="mysql_container" ["ubuntu"]="ubuntu_container")

# Iniciar cada contenedor con su nombre asignado
for imagen in "${!contenedores[@]}"; do
  docker run -d --name "${contenedores[$imagen]}" $imagen
done

# Listar los contenedores en ejecución
docker ps

# Detener y eliminar los contenedores tras la ejecución
for nombre in "${contenedores[@]}"; do
  docker stop $nombre
  docker rm $nombre
done
