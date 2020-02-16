rmdir /s /q centos8-gui
IF %ERRORLEVEL% EQU 0 packer build centos-gui.json
IF %ERRORLEVEL% EQU 0 vagrant box add -f --name centos8-gui centos8-gui/package.box
