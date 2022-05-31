#!/bin/bash

# Enable dark mode
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark

# Get back the maximize button in title bar
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

# Set workspace switch keys to the same as in Windows (Win+Ctrl+Arrows)
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>Page_Up', '<Control><Super>Left', '<Super><Alt>Left', '<Control><Alt>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>Page_Down', '<Control><Super>Right', '<Super><Alt>Right', '<Control><Alt>Right']"

# Center new windows
gsettings set org.gnome.mutter center-new-windows true

# Touchpad tap-to-click
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

# Set custom keybinding for Suspend (Win+X)
# If you're not sure this is the first set binding, make sure by checking the list:
# gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings
# This should result in an empty array. If not, simply change the next script by adding '.../customX' (X = n+1) to the list and change all following lines to X
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Suspend'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'systemctl suspend'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>x'

# Nautilus default settings
gsettings set org.gnome.nautilus.preferences default-folder-viewer "list-view"
gsettings set org.gnome.nautilus.preferences default-sort-order "name"
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
gsettings set org.gnome.nautilus.list-view use-tree-view true
gsettings set org.gnome.nautilus.list-view default-visible-columns "['name', 'size', 'permissions', 'date_modified']"
gsettings set org.gnome.nautilus.list-view default-zoom-level "standard"

# Screen lock & suspend
# Screen off in 10 minutes, lock and suspend after 20
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 600
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 1200
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'suspend'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 1200
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'suspend'

# Disable extension version validation
gsettings set org.gnome.shell disable-extension-version-validation true

# Set Papirus icon theme and color
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

# Show battery percentage in top bar
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Gedit - removed in Gnome 42
# gsettings set org.gnome.gedit.preferences.editor highlight-current-line false

