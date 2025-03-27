#!/bin/bash

set -euo pipefail


if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecuta este script como root o usando sudo."
  exit
fi


cd /etc/yum.repos.d/ || { echo "Error al cambiar al directorio /etc/yum.repos.d/"; exit 1; }


echo "Descargando el repositorio de kernel CachyOS..."
wget https://copr.fedorainfracloud.org/coprs/bieszczaders/kernel-cachyos/repo/fedora-$(rpm -E %fedora)/bieszczaders-kernel-cachyos-fedora-$(rpm -E %fedora).repo

if [ $? -ne 0 ]; then
  echo "Error al descargar el repositorio. Verifica la conexión o la URL."
  exit 1
fi

echo "Modificando paquetes del sistema..."
rpm-ostree override remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra --install kernel-cachyos

if [ $? -ne 0 ]; then
  echo "Error al modificar los paquetes del sistema con rpm-ostree."
  exit 1
fi

