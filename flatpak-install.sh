#!/bin/bash

# Fedora installs incorrect Flathub repository, need to change it
# https://flatpak.org/setup/Fedora/
flatpak remote-delete flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Flatpaks
flatpak install flathub \
  rest.insomnia.Insomnia \
  io.dbeaver.DBeaverCommunity \
  com.visualstudio.code \
  org.inkscape.Inkscape \
  org.kde.krita \
  com.slack.Slack \
  org.videolan.VLC 
  
echo -e "\n[+] Flatpaks installed\n"