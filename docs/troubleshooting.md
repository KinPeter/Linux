# Troubleshooting

## WebStorm/IDEA `[node | npm] not found` when running script

This is because by default NVM puts its "magic" to the `~/.bashrc` file which adds the `node` and `npm` commands to the PATH. This only loads when you start a "normal" terminal window. IDEs however start a login shell, which reads configuration from the `~/.profile` file. So the solution:
- Copy the lines added by NVM from `.bashrc` to `.profile`
- Save your files and close your IDE
- Log out / log in to Linux to apply the changes and load NVM stuff with the shell
- Restart your IDE and try again

## Infinite login loop issue \(nvidia driver\)

[Look for the solution here](http://ubuntuhandbook.org/index.php/2020/01/login-loop-auto-login-enabled-in-ubuntu-19-10-with-nvidia-driver/)

## Increase file watchers limitation 

* Add the following line to either `/etc/sysctl.conf` file or a new \*.conf file \(e.g. idea.conf\) under `/etc/sysctl.d/` directory: 

```bash
fs.inotify.max_user_watches = 524288
```

* Then run this command to apply the change:

```bash
sudo sysctl -p --system
```

And don't forget to restart your IDE. 

## If SNAP apps don’t start: 

```bash
sudo apparmor_parser -r /var/lib/snapd/apparmor/profiles/*
```
