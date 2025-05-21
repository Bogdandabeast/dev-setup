#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

packages=(
    virt-manager
    libvirt-daemon-driver-network
    libvirt-daemon-driver-nodedev
    libvirt-daemon-driver-qemu
    libvirt-daemon-driver-storage-core
    qemu-audio-spice
    qemu-char-spice
    qemu-device-display-qxl
    qemu-device-display-virtio-gpu
    qemu-device-display-virtio-vga
    qemu-device-usb-redirect
    qemu-system-x86-core
)

rpm-ostree install "${packages[@]}"
