#!/bin/bash

# Customize the Dock panel
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 36
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true
gsettings set org.gnome.shell.extensions.dash-to-dock manualhide false

# Hide workspaces button
gsettings set org.gnome.shell.extensions.pop-cosmic show-workspaces-button false

# Show the workspace picker on the right side
gsettings set org.gnome.shell.extensions.pop-cosmic workspace-picker-left false

# Enable activities hot corner overview
gsettings set org.gnome.desktop.interface enable-hot-corners true

# Get back the maximize button in title bar
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

# Set workspace switch keys to the same as in Windows (Win+Ctrl+Arrows)
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Page_Up', '<Control><Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Page_Down', '<Control><Super>Right']"
# + remove the above bindings from where they were
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Primary><Super>KP_Left', '<Primary><Super>h']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Primary><Super>KP_Right', '<Primary><Super>l']"

# Originals for workspace switch:
# $ gsettings get org.gnome.desktop.wm.keybindings switch-to-workspace-up
# ['<Primary><Super>Up', '<Primary><Super>KP_Up', '<Primary><Super>k']
# $ gsettings get org.gnome.desktop.wm.keybindings switch-to-workspace-down
# ['<Primary><Super>Down', '<Primary><Super>KP_Down', '<Primary><Super>j']

# Center new windows
gsettings set org.gnome.mutter center-new-windows true

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
