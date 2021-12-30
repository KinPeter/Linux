#!/bin/bash

# Set Papirus icon theme and color
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
papirus-folders -C breeze --theme Papirus-Dark
# use this command to list available colors
# papirus-folders -l --theme Papirus-Dark

# Copy Adwaita theme
# Get more color variants from github: https://github.com/Gnostiphage/adwaita-color-gen/tree/master/generated
mkdir ~/.themes
tar -xzvf ./themes/adwaita-blue-dark.tar.gz -C ~/.themes/

# Change applications theme
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-blue-dark"
# Change shell theme
gsettings set org.gnome.desktop.wm.preferences theme "Adwaita-blue-dark"