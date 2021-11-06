#!/bin/bash

# Install APT apps
source ./apt-install.sh

# Add custom settings
source ./gsettings.sh
echo -e "\n[+] Settings added\n"

# Copy git and pit config
cp ./config/.gitconfig $HOME
cp ./config/.pitconfig.json $HOME
echo -e "\n[+] Git and Pit config added\n"

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
echo "sftp://peter@192.168.0.100/home/peter KP-NUC" >> $HOME/.config/gtk-3.0/bookmarks
echo "sftp://peter@192.168.0.109/home/peter KP-ZENBOOK" >> $HOME/.config/gtk-3.0/bookmarks
echo "sftp://peter@192.168.0.112/home/peter KP-BRIX" >> $HOME/.config/gtk-3.0/bookmarks
echo "sftp://pkincom@p-kin.com/home/pkincom P-Kin.com" >> $HOME/.config/gtk-3.0/bookmarks

# Install SNAP apps
# source ./snap-install.sh

# Install Flatpak apps
source ./flatpak-install.sh