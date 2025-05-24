#!/bin/bash


# Configuration file path
CONFIG_PATH="/etc/NetworkManager/conf.d/wifi-powersave.conf"

# Create the directory if it doesn't exist
sudo mkdir -p $(dirname "$CONFIG_PATH")

# Write configuration to the file
echo -e "[connection]\nwifi.powersave=0" | sudo tee "$CONFIG_PATH"

echo "Global configuration applied successfully. Wi-Fi power saving is now disabled!"
