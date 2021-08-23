#!/bin/bash -x
sudo apt-get update
echo "libc6:amd64     libraries/restart-without-asking        boolean true" | sudo debconf-set-selections
echo "libssl1.1:amd64 libssl1.1/restart-services      string" | sudo debconf-set-selections
sudo apt-get install -y linux-headers-"$(uname -r)" build-essential zlib1g-dev libssl-dev libreadline-gplv2-dev unzip

if [[ -f /home/vagrant/VBoxGuestAdditions.iso ]]; then
	vbox_guest_additions_path="/home/vagrant/VBoxGuestAdditions.iso"

elif [[ -f /root/VBoxGuestAdditions.iso ]]; then
	vbox_guest_additions_path="/root/VBoxGuestAdditions.iso"
fi
sudo mkdir -p /mnt/virtualbox
sudo mount -o loop "$vbox_guest_additions_path" /mnt/virtualbox
sudo sh /mnt/virtualbox/VBoxLinuxAdditions.run
sudo umount /mnt/virtualbox
sudo rm -rf "$vbox_guest_additions_path"