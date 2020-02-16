rmdir /s centos8-gui
IF %ERRORLEVEL% EQU 0 packer.io build centos-gui.json
IF %ERRORLEVEL% EQU 0 vagrant box add -f --name centos8-gui centos8-gui/package.box
