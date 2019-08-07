#!/bin/sh

#
# Script to automatically set-up lxc containers (Ubuntu 19.04)
#

#
#set correct timezone and locale
#
timedatectl set-timezone Europe/Bratislava
locale-gen en_US.UTF-8

#
# Set up apt cacher 
#
echo "Acquire::http::Proxy \"http://10.0.0.107:3142\";" | tee /etc/apt/apt.conf.d/00proxy

#
# Update base distro
#
apt-get update
apt-get dist-upgrade
apt-get install -y patch

#
# Enable bash auto completion 
#
patch/etc/bash.bashrc <<-EOF
35,41c35,41
< #if ! shopt -oq posix; then
< #  if [ -f /usr/share/bash-completion/bash_completion ]; then
< #    . /usr/share/bash-completion/bash_completion
< #  elif [ -f /etc/bash_completion ]; then
< #    . /etc/bash_completion
< #  fi
< #fi
---
> if ! shopt -oq posix; then
>   if [ -f /usr/share/bash-completion/bash_completion ]; then
>     . /usr/share/bash-completion/bash_completion
>   elif [ -f /etc/bash_completion ]; then
>     . /etc/bash_completion
>   fi
> fi
EOF

#
#configure unattended upgrades for the system
#
apt install -y unattended-upgrades
patch -l /etc/apt/apt.conf.d/50unattended-upgrades <<-EOF
14c14
< //    "\${distro_id}:\${distro_codename}-updates";
---
>       "\${distro_id}:\${distro_codename}-updates";
EOF

#
#prometheus
#
apt install -y prometheus-node-exporter

