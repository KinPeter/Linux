# Tips & Tricks

## Start Chrome / Chromium with specific profile

* Look for the profile folders, they will be called "Default", "Profile 1", "Profile 2" etc.
  * Chromium (SNAP): `~/snap/chromium/common/chromium`
  * Google Chrome: `~/.config/google-chrome/`
* In each folder there is a `Preferences` file where in the first few lines you can see the username and email associated with that profile
* Use the name of the folder to start chromium:

```bash
chromium --profile-directory="Profile 1"
# or
google-chrome --profile-directory="Profile 1"
```

## Create desktop entries

* Create `.desktop` files to `~/.local/share/applications` folder with content like this:

```bash
[Desktop Entry]
Name=Netflix
Icon=/home/peter/.local/share/icons/netflix.svg
Comment=Netflix & chill
Exec=chromium --app=https://www.netflix.com --profile-directory=Default --start-maximized
Type=Application
Categories=Internet
Terminal=false
```

* Put the icons for example to `~/.local/share/icons/`
* Dont forget to make them executable!

## Edit an existing (system generated) desktop entry

```bash
# list all desktop files
ls /usr/share/applications/*.desktop
# copy the default desktop entry to your home folder
cp /usr/share/applications/something.desktop ~/.local/share/applications
# finally edit this file
```

## Set workspace switch keys to the same as in Windows \(Win+Ctrl+Arrows\)

```bash
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Page_Up', '<Control><Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Page_Up', '<Control><Super>Right']"
```

## Change Alt+Tab and Super+Tab bindings

```bash
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>Tab']"
```

## Install Docker

```bash
sudo apt install docker.io docker-compose
# add to usergroup to avoid using sudo
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
```

## Set up L2TP VPN 

```bash
sudo apt-get update 
sudo apt-get install network-manager-l2tp network-manager-l2tp-gnome
```

This will add the L2TP option to the default VPN settings. 

To add pre-shared key, go to the IPsec settings. 

## Change the default terminal emulator

```bash
sudo update-alternatives --config x-terminal-emulator
```
Select the desired terminal from the list of alternatives.

