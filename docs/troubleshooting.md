# Troubleshooting

## If SNAP apps don’t start: 

```bash
sudo apparmor_parser -r /var/lib/snapd/apparmor/profiles/*
```

## Infinite login loop issue \(nvidia driver\)

{% embed url="http://ubuntuhandbook.org/index.php/2020/01/login-loop-auto-login-enabled-in-ubuntu-19-10-with-nvidia-driver/" %}

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

...

