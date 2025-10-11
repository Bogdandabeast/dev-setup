#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

# Opcional: ajustes de colores en el tema "maldives" (puedes quitar esta parte si no lo usas)
sed -i 's/color: "black"/color: "white"/' /usr/share/sddm/themes/maldives/Main.qml
sed -i 's/id: lblPassword/id: lblPassword\ncolor: "white"/' /usr/share/sddm/themes/maldives/Main.qml
sed -i 's/id: lblName/id: lblName\ncolor: "white"/' /usr/share/sddm/themes/maldives/Main.qml
sed -i 's/id: lblSession/id: lblSession\ncolor: "white"/' /usr/share/sddm/themes/maldives/Main.qml
sed -i 's/id: lblLayout/id: lblLayout\ncolor: "white"/' /usr/share/sddm/themes/maldives/Main.qml
sed -i 's/id: errorMessage/id: errorMessage\ncolor: "white"/' /usr/share/sddm/themes/maldives/Main.qml

# ==============================
# Script para instalar el tema Cyberpunk
# ==============================

# Variables básicas
DATE=$(date +%s)
CLONE_PATH="$HOME/sddm-cyberpunk-theme"
SDDM_PATH="/usr/share/sddm/themes/sddm-cyberpunk-theme"

# Clonar el repositorio del theme y hacer copia de seguridad si existe
if [ -d "$CLONE_PATH" ]; then
    sudo mv "$CLONE_PATH" "${CLONE_PATH}_$DATE"
fi
git clone -b master --depth 1 https://github.com/paulocfrossard/sddm-cyberpunk-theme.git "$CLONE_PATH"

# Copiar archivos del theme a su destino y respaldar si existen configuraciones previas
if [ -d "$SDDM_PATH" ]; then
    sudo mv "$SDDM_PATH" "${SDDM_PATH}_$DATE"
fi
sudo mkdir -p "$SDDM_PATH"
sudo cp -r "$CLONE_PATH/"* "$SDDM_PATH"

# Instalar fuentes si el tema trae alguna
if [ -d "$SDDM_PATH/Fonts" ]; then
    sudo cp -r "$SDDM_PATH/Fonts/"* /usr/share/fonts/
    sudo fc-cache -fv
fi

# Configurar SDDM para usar el nuevo theme
echo "[Theme]
Current=sddm-cyberpunk-theme" | sudo tee /etc/sddm.conf > /dev/null

# Configuración opcional de teclado virtual
echo "[General]
InputMethod=qtvirtualkeyboard" | sudo tee /etc/sddm.conf.d/virtualkbd.conf > /dev/null

exit 0
