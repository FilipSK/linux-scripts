# Linux script collection

This is the collection of various linux scripts used to make my life easier. I will upload to github progressively as I polish them.

Note: You do not need to install git to use them. Just use curl/wget to download latest script and run it - for example:

```
wget https://raw.githubusercontent.com/FilipSK/linux-scripts/master/lxc-init.sh
sudo sh lxc-init.sh
```

## lxc-init.sh

This script initializes LXC container created from Ubuntu template (as of commit, I am using version 19.04). It properly sets
- Time Zone (edit script to get yours)
- Locale
- caching proxy for APT (you really should use one if you deploy bunch of containers)
- All latest updates
- Enables bash auto completion
- Enables unattended upgrades
- Installs prometheus-node-exporter

Having an init script is really useful so you do not have to set up all the basics by hand.
