#!/bin/bash

CONFIG_PATH="/etc/scx_loader.toml"

# Verificar si el archivo ya existe
if [ -f "$CONFIG_PATH" ]; then
    echo "its already exists: $CONFIG_PATH"
else
    echo "Creando archivo de configuración en: $CONFIG_PATH"
    sudo mkdir -p $(dirname "$CONFIG_PATH")
    sudo tee "$CONFIG_PATH" > /dev/null <<EOF
default_sched = "scx_lavd"
default_mode = "PowerSave"
#yesss
[scheds.scx_bpfland]
auto_mode = []
gaming_mode = ["-m", "performance"]
lowlatency_mode = ["-s", "5000", "-S", "500", "-l", "5000", "-m", "performance"]
powersave_mode = ["-m", "powersave"]

[scheds.scx_rusty]
auto_mode = []
gaming_mode = []
lowlatency_mode = []
powersave_mode = []

[scheds.scx_lavd]
auto_mode = []
gaming_mode = ["--performance"]
lowlatency_mode = ["--performance"]
powersave_mode = ["--powersave"]

[scheds.scx_flash]
auto_mode = []
gaming_mode = []
lowlatency_mode = []
powersave_mode = []

[scheds.scx_p2dq]
auto_mode = []
gaming_mode = []
lowlatency_mode = ["-y"]
powersave_mode = []

[scheds.scx_tickless]
auto_mode = []
gaming_mode = ["-f 5000 -s 5000"]
lowlatency_mode = ["-f 5000 -s 1000"]
powersave_mode = ["-f 50 -p"]

[scheds.scx_rustland]
auto_mode = []
gaming_mode = []
lowlatency_mode = []
powersave_mode = []
EOF
    echo "scx_loader.toml has been created"
fi
