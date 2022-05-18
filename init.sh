#!/bin/bash

# Install DNF apps
source ./dnf-install.sh

# Add custom settings
source ./gsettings.sh
echo -e "\n[+] Settings added\n"

# Add config for Gnome Terminal
dconf load /org/gnome/terminal/legacy/profiles:/ < ./config/gnome-terminal-profiles.dconf

# Add prompt for Bash
cat ./config/bash-prompt >> $HOME/.bashrc

# Copy git and pit config
# cp ./config/.gitconfig $HOME
# cp ./config/.pitconfig.json $HOME
# echo -e "\n[+] Git and Pit config added\n"

# Source custom bash scripts
echo "source $(pwd)/bash-aliases.sh" >> $HOME/.bashrc
echo "source $(pwd)/bash-git.sh" >> $HOME/.bashrc
echo "source $(pwd)/bash-others.sh" >> $HOME/.bashrc
echo -e "\n[+] Custom scripts sourced\n"

# Generate new SSH key
# ssh-keygen -q -f $HOME/.ssh/id_rsa -N ""
# echo -e "\n[+] New SSH key generated:\n"
# cat $HOME/.ssh/id_rsa.pub
# echo -e "\n--------\n"

# Add bookmarks to Nautilus
echo "file:///home/peter/code" >> $HOME/.config/gtk-3.0/bookmarks
echo "file:///home/peter/moon" >> $HOME/.config/gtk-3.0/bookmarks
# echo "sftp://peter@192.168.0.100/home/peter KP-NUC" >> $HOME/.config/gtk-3.0/bookmarks
# echo "sftp://peter@192.168.0.109/home/peter KP-ZENBOOK" >> $HOME/.config/gtk-3.0/bookmarks
# echo "sftp://peter@192.168.0.112/home/peter KP-BRIX" >> $HOME/.config/gtk-3.0/bookmarks
echo "ftp://pkincom@p-kin.com P-Kin.com" >> $HOME/.config/gtk-3.0/bookmarks

# Install SNAP apps
# source ./snap-install.sh

# Install Flatpak apps
source ./flatpak-install.sh

# Make sure suspend also locks the screen
sudo cp ./config/lock.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable lock.service