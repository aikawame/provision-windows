Set-ExecutionPolicy RemoteSigned -Force
$ErrorActionPreference = 'Stop'

Set-Location -Path $env:temp
$client = New-Object net.webclient
$client.DownloadFile('https://github.com/aikawame/provision-windows/archive/master.zip', "$env:temp\provision-windows-master.zip")
Expand-Archive -Path .\provision-windows-master.zip -DestinationPath .\ -Force
Set-Location -Path .\provision-windows-master

.\scripts\remove_appx_packages.ps1
.\scripts\install_package_providers.ps1
.\scripts\install_packages.ps1

Reg import .\registrations\settings.reg
Reg import .\registrations\control_panel.reg
Reg import .\registrations\sounds.reg
Reg import .\registrations\others.reg

wsl DEBIAN_FRONTEND=noninteractive apt-get update
wsl DEBIAN_FRONTEND=noninteractive apt-get install -y ansible
wsl ansible-playbook -i local local.yml --ask-vault-pass

# Set-Location -Path $env:temp
# Remove-Item .\provision-windows-master.zip
# Remove-Item .\provision-windows-master -Recurse
