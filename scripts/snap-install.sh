#!/bin/bash

# Install SNAPS
sudo snap install \
  dbeaver-ce \
  krita \
  inkscape \
  insomnia

sudo snap install code --classic
sudo snap install slack --classic
sudo snap install dotnet-sdk --channel=lts/stable --classic

echo -e "\n[+] Snaps installed\n"