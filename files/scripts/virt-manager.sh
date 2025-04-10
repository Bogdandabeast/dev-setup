#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

rpm-ostree install \
libvirt-daemon-driver-network \
libvirt-daemon-driver-nodedev \
libvirt-daemon-driver-qemu \
libvirt-daemon-driver-storage-core \
qemu-audio-spice \
qemu-char-spice \
qemu-device-display-qxl \
qemu-device-display-virtio-gpu \
qemu-device-display-virtio-vga \
qemu-device-usb-redirect \
qemu-system-x86-core
