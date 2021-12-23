#!/bin/bash

# Install SNAPS
sudo snap install \
  dbeaver-ce \
  krita \
  inkscape \
  insomnia

sudo snap install code --classic
# sudo snap install dotnet-sdk --channel=lts/stable --classic
# sudo snap install slack --classic // download slack from slack.com for Hangul support

echo -e "\n[+] Snaps installed\n"