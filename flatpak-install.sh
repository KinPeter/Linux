#!/bin/bash

# Fedora installs incorrect Flathub repository, need to change it
# https://flatpak.org/setup/Fedora/
flatpak remote-delete flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Flatpaks
flatpak install flathub \
  io.dbeaver.DBeaverCommunity \
  org.inkscape.Inkscape \
  org.gimp.GIMP \
  com.slack.Slack \
  org.videolan.VLC 
  # com.visualstudio.code \
  # io.github.seadve.Kooha
  
echo -e "\n[+] Flatpaks installed\n"