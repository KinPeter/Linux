#!/bin/bash

# Install apps
source ./install.sh
echo -e "\n[+] Installs done\n"

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