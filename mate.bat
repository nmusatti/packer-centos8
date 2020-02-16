rmdir /s centos8-mate
IF %ERRORLEVEL% EQU 0 packer.io build centos-mate.json
IF %ERRORLEVEL% EQU 0 vagrant box add -f --name centos8-mate centos8-mate/package.box
