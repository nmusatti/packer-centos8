# packer-centos8
A [Packer](https://www.packer.io/) template to build [CentOS 8](https://www.centos.org/) [Vagrant](https://www.vagrantup.com/)
base boxes for [VirtualBox](https://www.virtualbox.org/).

This project supports the creation of the following kind of base boxes:
* bare: A minimal installation without Virtual Box Guest Additions on a 16GB dynamically sized disk;
* vbga: A minimal installation with Guest Additions on a 32GB dinamically sized disk.
* gui: A basic GNOME workstation, derived from the `vbga` base box.
* mate: A basic MATE desktop workstation, derived from the `gui` base box.

Note that, as the MATE desktop is not available from the [EPEL repository](https://fedoraproject.org/wiki/EPEL), it is installed from
the [Official unofficial repository for MATE for EL8](https://copr.fedorainfracloud.org/coprs/stenstorp/MATE/)

The `bare` base box may be built with the following command:

    packer build -var-file linux.json -var-file bare.json centos.json

Customizable variables may be provided on the command line or by means of variable files. Note that the `linux.json` var file
reflects my personal conventions on where to keep local installation images, you may want to provide your own location. This will
result in a `centos8-bare.box` file being created, which may be installed with the following command:

    vagrant box add -f --name centos8-bare centos8-bare.box

To build the `vbga` base box, replace `bare` with `vbga` in the commands above. Once you have built and installed the `centos8-vbga.box`
you may build the `centos8-gui` box with the following command:

    packer build centos-gui.json

The new box will be stored in the `centos8-gui/package.box` file. It may be installed as follows:

    vagrant box add -f --name centos8-gui centos8-gui/package.box

Once the `centos8-gui` box is install you may build the `centos8-mate` one by replacing `mate` for `gui` in the last two commands.

This project was derived from the templates available in the [packer-templates](https://github.com/maier/packer-templates) project.
Sibling [packer-centos7](https://github.com/nmusatti/packer-centos7), [packer-centos8-stream](https://github.com/nmusatti/packer-centos8-stream) and
[packer-fedora](https://github.com/nmusatti/packer-fedora) projects may be used to build CentOS 7, CentOS 8 Stream and Fedora boxes.
