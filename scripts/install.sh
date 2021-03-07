#!/bin/bash
sudo apt update

# Install APT packages
sudo apt install \
  curl \
  flameshot \
  peek \
  docker.io \
  docker-compose \
  network-manager-l2tp \
  network-manager-l2tp-gnome \
  openjdk-11-jdk \
  openssh-server \
  dconf-editor \
  gnome-tweak-tool \
  gnome-shell-extensions \
  vlc \
  indicator-multiload \
  terminator 

echo -e "\n[+] APT packages installed\n"

# Add config for Terminator
cat ./config/terminator.config > $HOME/.config/terminator/config

# Add config for Indicator Multiload
dconf load /de/mh21/indicator-multiload/ < ./config/indicator-multiload.config

echo -e "\n[+] Config files added\n"


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

# Install NVM
# https://github.com/nvm-sh/nvm#installing-and-updating
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
echo -e "\n[+] NVM installed\n"

# Configure docker user group
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
echo -e "\n[+] Docker user group configured\n"