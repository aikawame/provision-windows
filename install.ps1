Write-Host ''
Write-Host 'Setting PowerShell...'
Set-ExecutionPolicy RemoteSigned -Force
Enable-PSRemoting -Force -SkipNetworkProfileCheck
$ErrorActionPreference = 'Stop'

Write-Host ''
Write-Host 'Installing WSL...'
wsl --install

Write-Host ''
Write-Host 'Setting UAC...'
$path = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System'
Set-ItemProperty -Path $path -Name 'EnableLUA' -Value 0

Write-Host ''
Write-Host 'Downloading Ansible Playbook...'
Set-Location -Path C:\Windows\Temp
$client = New-Object net.webclient
$source = 'https://github.com/aikawame/provision-windows/archive/main.zip'
$client.DownloadFile($source, 'C:\Windows\Temp\provision-windows.zip')
Expand-Archive -Path .\provision-windows.zip -DestinationPath .\ -Force
Rename-Item .\provision-windows-main -NewName .\provision-windows

Write-Host ''
Write-Host 'Restart Windows.'
