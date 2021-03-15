#!/bin/bash

# Install APT apps
source ./apt-install.sh

# Add custom settings
source ./gsettings.sh
echo -e "\n[+] Settings added\n"

# Copy git and pit config
cp ./config/.gitconfig $HOME
cp ./config/.pitconfig $HOME
echo -e "\n[+] Git and Pit config added\n"

# Source custom bash scripts
echo "source $(pwd)/bash-aliases.sh" >> $HOME/.bashrc
echo "source $(pwd)/bash-git.sh" >> $HOME/.bashrc
echo "source $(pwd)/bash-others.sh" >> $HOME/.bashrc
echo -e "\n[+] Custom scripts sourced\n"

# Install SNAP apps
source ./snap-install.sh