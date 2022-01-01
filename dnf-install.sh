#!/bin/bash

# Install DNF packages
sudo dnf install \
  flameshot \
  moby-engine \
  docker-compose \
  xl2tpd \
  NetworkManager-l2tp \
  NetworkManager-l2tp-gnome \
  openssh-server \
  dconf-editor \
  gnome-tweaks \
  gnome-extensions-app \
  net-tools \
  piper \
  bat \
  transmission \
  papirus-icon-theme 
  # papirus-folders

echo -e "\n[+] DNF packages installed\n"

# Install NVM
# https://github.com/nvm-sh/nvm#installing-and-updating
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
echo -e "\n[+] NVM installed\n"

# Configure docker user group
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker $USER
echo -e "\n[+] Docker user group configured\n"
