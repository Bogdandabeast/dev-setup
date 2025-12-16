#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

# Descargar el archivo .rpm del último release de winboat
RPM_URL=$(curl -s https://api.github.com/repos/TibixDev/winboat/releases/latest \
  | grep "browser_download_url" \
  | grep ".rpm" \
  | cut -d '"' -f 4)

echo "Descargando RPM desde: $RPM_URL"
curl -L -o /tmp/winboat.rpm "$RPM_URL"

# Añadir import al justfile
echo '

import "/usr/share/ublue-os/just/50-brew.just"

' >> /usr/share/ublue-os/justfile
