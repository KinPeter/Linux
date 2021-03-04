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
