#!/bin/bash

# exit on error and undefined variables
set -eu

# set locale
sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

# set timezone
ln -sf /usr/share/zoneinfo/UTC /etc/localtime

# enabling all mirros
sed -i "s|#Server|Server|g" /etc/pacman.d/mirrorlist

# storing the system journal in RAM
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

# default releng configuration
sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

# enable useful services and display manager
enabled_services=('choose-mirror.service' 'lxdm.service' 'vboxservice.service'
                  'NetworkManager.service')
systemctl enable ${enabled_services[@]}
systemctl set-default graphical.target

# create the user directory for live session
if [ ! -d /root ]; then
    mkdir -p /root/Desktop
    chmod 700 /root && chown -R root:root /root
fi

# remove special (not needed) files
rm /etc/systemd/system/getty@tty1.service.d/autologin.conf
rm /root/{.automated_script.sh,.zlogin}

# setting root password
echo "root:mantos" | chpasswd

# default shell
chsh -s /bin/zsh

# disabling VirtualBox notification
sed -i "s|notify-send|echo|g" /usr/bin/VBoxClient-all

# font configuration
ln -fs /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
ln -fs /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
ln -fs /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d

# radare2 configuration file
cp -rfv "/etc/skel/radare2rc" "/root/.radare2rc"

# gdb configuration file
cp -rfv "/etc/skel/gdbinit" "/root/.gdbinit"

# gtk rc (transparency)
cp -rfv "/etc/skel/gtkrc-2.0" "/root/.gtkrc-2.0"

# xfce4 and more skel configuration to root but leaving original content for bk
rm -fr /root/.config || true
cp -rfv /etc/skel/config /root/.config

# setup repository, add pacman.conf entry, sync databases
pacman -Syy --noconfirm
pacman -Scc --noconfirm
pacman-optimize
pacman-db-upgrade
pacman-key --init
# install BlackArch repository with default mirror (that's why the sed)
curl -s https://blackarch.org/strap.sh | \
    sed "s|get_mirror$|#get_mirror|1" | sh
pacman-key --populate blackarch archlinux
