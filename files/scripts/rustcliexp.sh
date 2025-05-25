#!/bin/bash

# Actualizar Homebrew
echo "Updating Homebrew..."
brew update

# Lista de paquetes a instalar
packages=(
    nushell ripgrep fd bat eza zoxide xh zellij gitui du-dust dua starship yazi
    hyperfine fselect ncspot rusty-man delta ripgrep-all
    tokei wiki-tui just mask mprocs presenterm kondo rtx espanso
)

# Instalar cada paquete
echo "Installing rust boggie experience..."
for package in "${packages[@]}"; do
    echo "Installing: $package"
    brew install "$package"
done

echo "All utillities have been installed 🚀"

yes | curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate


