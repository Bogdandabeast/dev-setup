#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

sed -i 's/color: "black"/color: "white"/' /usr/share/sddm/themes/maldives/Main.qml
sed -i 's/id: lblPassword/id: lblPassword\ncolor: "white"/' /usr/share/sddm/themes/maldives/Main.qml
sed -i 's/id: lblName/id: lblName\ncolor: "white"/' /usr/share/sddm/themes/maldives/Main.qml
sed -i 's/id: lblSession/id: lblSession\ncolor: "white"/' /usr/share/sddm/themes/maldives/Main.qml
sed -i 's/id: lblLayout/id: lblLayout\ncolor: "white"/' /usr/share/sddm/themes/maldives/Main.qml
sed -i 's/id: errorMessage/id: errorMessage\ncolor: "white"/' /usr/share/sddm/themes/maldives/Main.qml

#script to install cool themes from github


# Variables básicas
DATE=$(date +%s)
CLONE_PATH="$HOME/sddm-astronaut-theme"
SDDM_PATH="/usr/share/sddm/themes/sddm-astronaut-theme"

# Clonar el repositorio del theme y hacer copia de seguridad si existe
if [ -d "$CLONE_PATH" ]; then
    sudo mv "$CLONE_PATH" "${CLONE_PATH}_$DATE"
fi
git clone -b master --depth 1 https://github.com/keyitdev/sddm-astronaut-theme.git "$CLONE_PATH"

# Copiar archivos del theme a su destino y respaldar si existen configuraciones previas
if [ -d "$SDDM_PATH" ]; then
    sudo mv "$SDDM_PATH" "${SDDM_PATH}_$DATE"
fi
sudo mkdir -p "$SDDM_PATH"
sudo cp -r "$CLONE_PATH/"* "$SDDM_PATH"
sudo cp -r "$SDDM_PATH/Fonts/"* /usr/share/fonts/

# Configurar SDDM para usar el nuevo theme
echo "[Theme]
Current=sddm-astronaut-theme" | sudo tee /etc/sddm.conf > /dev/null
echo "[General]
InputMethod=qtvirtualkeyboard" | sudo tee /etc/sddm.conf.d/virtualkbd.conf > /dev/null

# Fijar el tema a pixel_sakura en el archivo de metadatos
METADATA="$SDDM_PATH/metadata.desktop"
sudo sed -i 's|^ConfigFile=Themes/.*|ConfigFile=Themes/pixel_sakura.conf|' "$METADATA"

exit 0
