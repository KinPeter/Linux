#!/bin/bash

# Customize the Dock panel
# https://linuxconfig.org/how-to-customize-dock-panel-on-ubuntu-20-04-focal-fossa-linux
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0

# Set workspace switch keys to the same as in Windows (Win+Ctrl+Arrows)
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Page_Up', '<Control><Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Page_Up', '<Control><Super>Right']"

# Set Win+Tab to open applications view
gsettings set org.gnome.shell.keybindings toggle-application-view "['<Super>Tab']"

# Hide home and trash shortcut from desktop
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false

# Change to global dark mode (20.04)
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
# default light is 'Yaru'

# Enable activities hot corner overview
gsettings set org.gnome.desktop.interface enable-hot-corners true

# Center new windows
gsettings set org.gnome.mutter center-new-windows true

# Set custom keybinding for Suspend (Win+Numpad-)
# If you're not sure this is the first set binding, make sure by checking the list:
# gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings
# This should result in an empty array. If not, simply change the next script by adding '.../customX' (X = n+1) to the list and change all following lines to X
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Suspend'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'systemctl suspend'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>KP_Subtract'

# Nautilus default settings
gsettings set org.gnome.nautilus.preferences default-folder-viewer "list-view"
gsettings set org.gnome.nautilus.preferences default-sort-order "name"
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
gsettings set org.gnome.nautilus.list-view use-tree-view true
gsettings set org.gnome.nautilus.list-view default-visible-columns "['name', 'size', 'permissions', 'date_modified']"
gsettings set org.gnome.nautilus.list-view default-zoom-level "standard"