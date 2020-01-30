# packer-centos8
A [Packer](https://www.packer.io/) template to build [CentOS 8](https://www.centos.org/) [Vagrant](https://www.vagrantup.com/)
base boxes for [VirtualBox](https://www.virtualbox.org/).

This project supports the creation of the following kind of base boxes:
* bare: A minimal installation without Virtual Box Guest Additions on a 16GB dynamically sized disk;
* vbga: A minimal installation with Guest Additions on a 32GB dinamically sized disk.

The `bare` base box may be built with the following command:

    packer build -var-file linux.json -var-file bare.json centos.json

Customizable variables may be provided on the command line or by means of variable files. Note that the `linux.json` var file
reflects my personal conventions on where to keep local installation images, you may want to provide your own location. This will
result in a `centos8-bare.box` file being created, which may be installed with the following command:

    vagrant box add -f --name centos8-bare centos8-bare.box

To build the `vbga` base box, replace `bare` with `vbga` in the commands above.

This project was derived from the templates available in the [packer-templates](https://github.com/maier/packer-templates) project.
A sibling [packer-centos7](https://github.com/nmusatti/packer-centos7) project may be used to build CentOS 7 boxes.
