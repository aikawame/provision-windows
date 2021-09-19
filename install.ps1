Set-ExecutionPolicy RemoteSigned -Force
Enable-PSRemoting -Force -SkipNetworkProfileCheck
$ErrorActionPreference = 'Stop'

Set-Location -Path $env:temp
$client = New-Object net.webclient
$client.DownloadFile('https://github.com/aikawame/provision-windows/archive/main.zip', "$env:temp\provision-windows-main.zip")
Expand-Archive -Path .\provision-windows-main.zip -DestinationPath .\ -Force
Set-Location -Path .\provision-windows-main
Write-Host ''
.\scripts\install_package_providers.ps1
.\scripts\install_packages.ps1
.\scripts\update_reg_acls.ps1
Write-Host ''
Write-Host 'Applying registry:'
Reg import .\registrations\settings.reg
Reg import .\registrations\control_panel.reg
Reg import .\registrations\sounds.reg
Reg import .\registrations\others.reg
Write-Host ''
Write-Host 'Provisioning WSL environment:'
wsl DEBIAN_FRONTEND=noninteractive apt-get update
wsl DEBIAN_FRONTEND=noninteractive apt-get install -y language-pack-ja ansible
wsl update-locale LANG=ja_JP.UTF8
wsl DEBIAN_FRONTEND=noninteractive dpkg-reconfigure tzdata
Write-Host ''
wsl ansible-playbook -i windows -u aikawame windows.yml --ask-vault-pass
wsl ansible-playbook -i local local.yml --ask-vault-pass
Write-Host ''
Write-Host 'Increase max_map_count for Elasticsearch container:'
wsl -d docker-desktop echo 262144 ^> /proc/sys/vm/max_map_count
Write-Host ''
.\scripts\others.ps1
Write-Host ''
# Set-Location -Path $env:temp
# Remove-Item .\provision-windows-main.zip
# Remove-Item .\provision-windows-main -Recurse
