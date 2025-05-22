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

#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
no_color='\033[0m'
date=$(date +%s)

path_to_git_clone="$HOME"

install_dependencies(){
    sudo dnf install sddm qt6-qtsvg qt6-qtvirtualkeyboard qt6-qtmultimedia
}

git_clone(){
    umask 022
    echo -e "${green}[*] Clonando el theme en $path_to_git_clone.${no_color}"
    if [ -d "$path_to_git_clone/sddm-astronaut-theme" ]; then
        sudo mv "$path_to_git_clone/sddm-astronaut-theme" "$path_to_git_clone/sddm-astronaut-theme_$date" 
        echo -e "${green}[*] Configuraciones antiguas detectadas en $path_to_git_clone, haciendo copia de seguridad.${no_color}"
    fi
    git clone -b master --depth 1 https://github.com/keyitdev/sddm-astronaut-theme.git "$path_to_git_clone/sddm-astronaut-theme"
}

copy_files(){
    umask 022
    echo -e "${green}[*] Copiando theme desde $path_to_git_clone a /usr/share/sddm/themes/.${no_color}"
    if [ -d /usr/share/sddm/themes/sddm-astronaut-theme ]; then
        sudo mv /usr/share/sddm/themes/sddm-astronaut-theme /usr/share/sddm/themes/sddm-astronaut-theme_$date 
        echo -e "${green}[*] Configuraciones antiguas detectadas en /usr/share/sddm/themes/sddm-astronaut-theme, haciendo copia de seguridad.${no_color}"
    fi
    sudo mkdir -p /usr/share/sddm/themes/sddm-astronaut-theme
    sudo cp -r "$path_to_git_clone/sddm-astronaut-theme/"* /usr/share/sddm/themes/sddm-astronaut-theme
    sudo cp -r /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/
    echo -e "${green}[*] Configurando theme.${no_color}"
    echo "[Theme]
Current=sddm-astronaut-theme" | sudo tee /etc/sddm.conf > /dev/null
    echo "[General]
InputMethod=qtvirtualkeyboard" | sudo tee /etc/sddm.conf.d/virtualkbd.conf > /dev/null
}

select_theme(){
    path_to_metadata="/usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop"
    text="ConfigFile=Themes/"

    line=$(grep "$text" "$path_to_metadata")

    # Fijamos el tema a "pixel_sakura"
    selected_theme="pixel_sakura"
    echo -e "${green}[*] Seleccionando tema fijo: $selected_theme${no_color}"

    modified_line="$text$selected_theme.conf"

    sudo sed -i "s|^$text.*|$modified_line|" "$path_to_metadata"
    echo -e "${green}[*] Modificado: $line -> $modified_line${no_color}"
}

enable_sddm(){
    sudo systemctl disable display-manager.service
    sudo systemctl enable sddm.service 
}

install_dependencies
git_clone
copy_files
select_theme
enable_sddm
exit 0


