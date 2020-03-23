Set-ExecutionPolicy RemoteSigned -Force
$ErrorActionPreference = 'Stop'

Set-Location -Path C:\Windows\Temp
Invoke-WebRequest -Uri https://github.com/aikawame/provision-windows/archive/master.zip -OutFile provision-windows-master.zip -UseBasicParsing
Expand-Archive -Path .\provision-windows-master.zip -DestinationPath .\ -Force
Set-Location -Path .\provision-windows-master

.\scripts\remove_appx_packages.ps1
.\scripts\install_package_providers.ps1
.\scripts\install_packages.ps1

Reg import .\registrations\settings.reg
Reg import .\registrations\control_panel.reg
Reg import .\registrations\sounds.reg
Reg import .\registrations\others.reg

wsl DEBIAN_FRONTEND=noninteractive apt update
wsl DEBIAN_FRONTEND=noninteractive apt install -y ansible
wsl ansible-playbook -i local local.yml --ask-vault-pass

Set-Location -Path C:\Windows\Temp
Remove-Item .\provision-windows-master.zip
Remove-Item .\provision-windows-master -Recurse
