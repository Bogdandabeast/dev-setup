#!/bin/bash
set -e

# Descarga el repositorio de COPR para el kernel CachyOS
cd /etc/yum.repos.d/
wget https://copr.fedorainfracloud.org/coprs/bieszczaders/kernel-cachyos/repo/fedora-$(rpm -E %fedora)/bieszczaders-kernel-cachyos-fedora-$(rpm -E %fedora).repo

# Elimina el kernel predeterminado e instala el kernel CachyOS
rpm-ostree override remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra --install kernel-cachyos


