#!/bin/bash

# Definir un array con las imágenes
imagenes=("nginx" "mysql" "ubuntu")

# Iniciar un contenedor por cada imagen
for imagen in "${imagenes[@]}"; do
  docker run -d --name "container_$imagen" $imagen
done

# Listar los contenedores en ejecución
docker ps
