#!/bin/bash
sudo apt update

# Install APT packages
sudo apt install \
  flameshot \
  peek \
  docker.io \
  docker-compose \
  network-manager-l2tp \
  network-manager-l2tp-gnome \
  openssh-server \
  dconf-editor \
  gnome-tweaks \
  gnome-shell-extensions \
  net-tools \
  vlc \
  build-essential \
  openjdk-11-jdk \
  piper \
  bat
  # indicator-multiload \
  # terminator \
  # git \
  # curl \

echo -e "\n[+] APT packages installed\n"

# Add config for Terminator
# mkdir $HOME/.config/terminator
# touch $HOME/.config/terminator/config
# cat ./config/terminator.config > $HOME/.config/terminator/config

# Add config for Gnome Terminal
# dconf load /org/gnome/terminal/legacy/profiles:/ < ./config/gnome-terminal-profiles.dconf

# Add config for Indicator Multiload
# dconf load /de/mh21/indicator-multiload/ < ./config/indicator-multiload.config

# echo -e "\n[+] Config files added\n"

# Install NVM
# https://github.com/nvm-sh/nvm#installing-and-updating
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
# echo -e "\n[+] NVM installed\n"

# Configure docker user group
sudo groupadd docker
sudo gpasswd -a $USER docker
echo -e "\n[+] Docker user group configured\n"

# Add PoP!_OS Wallpapers
sudo apt-add-repository -ys ppa:system76-dev/stable
sudo apt update
sudo apt install -y system76-wallpapers