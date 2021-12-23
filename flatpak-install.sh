#!/bin/bash

# Install Flatpaks
flatpak install flathub \
  rest.insomnia.Insomnia \
  io.dbeaver.DBeaverCommunity \
  com.visualstudio.code \
  org.inkscape.Inkscape \
  org.kde.krita \
  com.slack.Slack

echo -e "\n[+] Flatpaks installed\n"