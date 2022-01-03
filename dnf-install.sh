#!/bin/bash

# Install docker the official way
# https://docs.docker.com/engine/install/fedora/
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
  --add-repo \
  https://download.docker.com/linux/fedora/docker-ce.repo

# Install DNF packages
sudo dnf install \
  flameshot \
  docker-ce \
  docker-ce-cli \
  containerd.io \
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

# Configure docker
sudo systemctl start docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo groupadd docker
sudo usermod -aG docker $USER
echo -e "\n[+] Docker configured\n"
