#!/bin/bash

# Verifica que el script se esté ejecutando como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecuta este script como root o usando sudo."
  exit
fi

# Cambiar al directorio de repositorios
cd /etc/yum.repos.d/ || { echo "Error al cambiar al directorio /etc/yum.repos.d/"; exit 1; }

# Descargar el archivo del repositorio
echo "Descargando el repositorio de kernel CachyOS..."
wget https://copr.fedorainfracloud.org/coprs/bieszczaders/kernel-cachyos/repo/fedora-$(rpm -E %fedora)/bieszczaders-kernel-cachyos-fedora-$(rpm -E %fedora).repo

if [ $? -ne 0 ]; then
  echo "Error al descargar el repositorio. Verifica la conexión o la URL."
  exit 1
fi

# Realizar cambios en los paquetes del sistema con rpm-ostree
echo "Modificando paquetes del sistema..."
rpm-ostree override remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra --install kernel-cachyos

if [ $? -ne 0 ]; then
  echo "Error al modificar los paquetes del sistema con rpm-ostree."
  exit 1
fi

