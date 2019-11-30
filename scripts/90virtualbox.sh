set -ux

if [ "$guest_additions_mode" = "disable" ]; then
    exit 0
fi

#
# packages need to install VBGA
#
yum -y install bzip2 perl kernel-devel-`uname -r` epel-release gcc
yum -y install dkms

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso

