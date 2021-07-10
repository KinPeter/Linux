# Tips & Tricks

- [Start Chrome with specific profile](#start-chrome-with-specific-profile)
- [Create desktop entries](#create-desktop-entries)
- [Edit an existing (system generated) desktop entry](#edit-an-existing-system-generated-desktop-entry)
- [Set workspace switch keys to the same as in Windows](#set-workspace-switch-keys-to-the-same-as-in-windows)
- [Change Alt-Tab and Super-Tab bindings](#change-alt-tab-and-super-tab-bindings)
- [Install Docker](#install-docker)
- [Set up L2TP VPN](#set-up-l2tp-vpn)
- [Change the default terminal emulator](#change-the-default-terminal-emulator)
- [Laptop: use 3 and 4 finger gestures on touchpad](#laptop-use-3-and-4-finger-gestures-on-touchpad)
- [Install VMWare Player](#install-vmware-player)
- [Use a Windows 10 VM to configure Logitech mouse](#use-a-windows-10-vm-to-configure-logitech-mouse)
- [Add Korean (hangul) input source](#add-korean-hangul-input-source)

---
## Start Chrome with specific profile

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

---
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

---
## Edit an existing (system generated) desktop entry

```bash
# list all desktop files
ls /usr/share/applications/*.desktop
# copy the default desktop entry to your home folder
cp /usr/share/applications/something.desktop ~/.local/share/applications
# finally edit this file
```

---
## Set workspace switch keys to the same as in Windows 

> \(Win+Ctrl+Arrows\)

```bash
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Page_Up', '<Control><Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Page_Down', '<Control><Super>Right']"
```

---
## Change Alt-Tab and Super-Tab bindings

```bash
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>Tab']"
```

---
## Install Docker

```bash
sudo apt install docker.io docker-compose
# add to usergroup to avoid using sudo
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
```

---
## Set up L2TP VPN 

```bash
sudo apt-get update 
sudo apt-get install network-manager-l2tp network-manager-l2tp-gnome
```

This will add the L2TP option to the default VPN settings. 

To add pre-shared key, go to the IPsec settings. 

---
## Change the default terminal emulator

```bash
sudo update-alternatives --config x-terminal-emulator
```
Select the desired terminal from the list of alternatives.

---
## Laptop: use 3 and 4 finger gestures on touchpad

Install Touchegg according to its [instructions on GitHub](https://github.com/JoseExposito/touchegg).

Don't forget the [shell extension](https://extensions.gnome.org/extension/4033/x11-gestures/).

After first running with `touchegg`, it will create a default config file in `~/.config/touchegg/touchegg.conf`. Replace the defaults with this:
```xml
<application name="All">
  <!-- Change to one workspace down -->
  <gesture type="SWIPE" fingers="3" direction="RIGHT">
    <action type="CHANGE_DESKTOP">
      <direction>previous</direction>
      <animate>true</animate>
      <animationPosition>auto</animationPosition>
    </action>
  </gesture>
  <!-- Change to one workspace up -->
  <gesture type="SWIPE" fingers="3" direction="LEFT">
    <action type="CHANGE_DESKTOP">
      <direction>next</direction>
      <animate>true</animate>
      <animationPosition>auto</animationPosition>
    </action>
  </gesture>
  <!-- Show application overview -->
  <gesture type="SWIPE" fingers="3" direction="UP">
    <action type="SEND_KEYS">
      <keys>Super_L</keys>
      <on>begin</on>
    </action>
  </gesture>
</application>
```
After a reboot, it will start up automatically.

---
## Install VMWare Player

### Build essentials
Some packages are needed to run VMWare, so use
```
sudo apt install build-essential
```

### Download and install
Download the latest VMWare Player for Linux. It'll come as a `.bundle` file. Assuming that it has been downloaded to your Downloads directory. If so, use the command below to make the file executable:
```
chmod +x ~/Downloads/VMware-Player*
```
And then run the installation file:
```
sudo ~/Downloads/VMware-Player*
```
This will open an installation window. From here, just click yes/next and it's done.

---
## Use a Windows 10 VM to configure Logitech mouse

- Download a minimal Win10 image e.g. from [here](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/)
- Open VMWare player, choose the `Open a virtual machine` option, find the downloaded VM image and load it up. (Give some extra RAM if possible)
- When it asks for installing VMWare Tools, accept it
- Download and install the Logitech Gaming Software (however it won't be able to detect the mouse just yet)

From here, the order of steps are not actually clear, but this is what I've done:
- Go to `File > Player preferences`, click `Download all components now`. This will install all kinds of extras for VMWare
- Go to the VM settings of the Win10 machine, on the `Hardware` tab click `Add...`, and add the `USB Controller`. 
- Select the new controller, spin up the `USB Compatibility`, and check the `Show all USB input devices` option. Save.
- Here it might be necessary to restart the VM if it was running.
- To fully connect the mouse to the Windows guest, so the Logitech sofware can detect it, it must be disconnected from the host. That means while doing the configuration, the mouse will NOT work outside of the VM - just keep this in mind.
- Go to the `Virtual Machine > Removable devices` menu in the running VM, there all connected devices - including the mouse - should be displayed.
- Select the mouse from the list and choose `Connect (disconnect from host)`. This will make the Windows VM fully access the connected mouse.
- To get back control of the mouse on the host, either shut down the VM or use `Alt + V` to open the menu by keyboard, then you can again select the mouse in the device list and choose `Disconnect (connect to host)`.

---
## Add Korean (hangul) input source

- Go to Settings -> Region and Language. Look for input source `Korean (Hangul)`.
- If there is no such thing, go to "Manage Installed Languages" and install Korean language pack.
- Make sure here that the keyboard input method system is set to `IBus`.
- In terminal, make sure the `ibus-hangul` package is installed (`sudo apt install ibus-hangul`)
- After a restart, now it should be possible to find the `Korean (Hangul)` among the input sources.
- If still not, in terminal list the available ibus engines `ibus list-engine`, and/or try to set it to hangul with `ibus engine hangul`.