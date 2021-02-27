# Tips & Tricks

## Start Chromium with specific profile

This works in case of SNAP installation. 

* Check profile folders under `~/snap/chromium/common/chromium` , they will be called "Default", "Profile 1", "Profile 2" etc.
* In each folder there is a `Preferences` file where in the first few lines you can see the username and email associated with that profile
* Use the name of the folder to start chromium:

```text
chromium --profile-directory="Profile 1"
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

## **Set workspace switch keys to the same as in Windows \(Win+Ctrl+Arrows\)**

```bash
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Super>Right']"
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

## ...



