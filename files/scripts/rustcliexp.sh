#!/bin/bash

# Actualizar Homebrew
echo "Updating Homebrew..."
brew update

# Lista de paquetes a instalar
packages=(
    nushell ripgrep fd bat eza zoxide xh zellij gitui du-dust dua starship yazi
    hyperfine evil-helix bacon cargo-info fselect ncspot rusty-man delta ripgrep-all
    tokei wiki-tui just mask mprocs presenterm kondo bob-nvim rtx espanso
)

# Instalar cada paquete
echo "Installing rust boggie experience..."
for package in "${packages[@]}"; do
    echo "Installing: $package"
    brew install "$package"
done

echo "All utillities have been installed 🚀"

# Lista de alias
declare -A aliases=(
    [fish]="fish"
    [nushell]="nu"
    [ripgrep]="rg"
    [fd]="fd"
    [bat]="bat"
    [eza]="eza"
    [zoxide]="z"
    [xh]="xh"
    [zellij]="zellij"
    [gitui]="gitui"
    [du-dust]="dust"
    [dua]="dua"
    [starship]="starship"
    [yazi]="yazi"
    [hyperfine]="hyperfine"
    [evil-helix]="hx"
    [bacon]="bacon"
    [cargo-info]="cargo-info"
    [fselect]="fselect"
    [ncspot]="ncspot"
    [rusty-man]="rusty-man"
    [delta]="delta"
    [ripgrep-all]="rga"
    [tokei]="tokei"
    [wiki-tui]="wiki"
    [just]="just"
    [mask]="mask"
    [mprocs]="mprocs"
    [presenterm]="presenterm"
    [kondo]="kondo"
    [bob-nvim]="bob"
    [rtx]="rtx"
    [espanso]="espanso"
)

# Agregar alias al archivo de configuración de Fish
echo "Configurando alias en Fish..."
for cmd in "${!aliases[@]}"; do
    echo "alias ${aliases[$cmd]}='$cmd'" >> "$FISH_CONFIG"
done

