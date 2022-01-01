#!/bin/bash

# In case of "No such shema" errors, uncomment these lines below
# sudo cp ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml /usr/share/glib-2.0/schemas/ && sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Customize the Dock panel
# Has been removed from the initial script in case the proper extension is not installed yet
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide-mode "ALL_WINDOWS"
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock autohide-in-fullscreen true
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.5
gsettings set org.gnome.shell.extensions.dash-to-dock custom-background-color true
gsettings set org.gnome.shell.extensions.dash-to-dock background-color "rgb(0,0,0)"
gsettings set org.gnome.shell.extensions.dash-to-dock show-show-apps-button false
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
gsettings set org.gnome.shell.extensions.dash-to-dock hide-delay 0.5