chcp 65001

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
Write-Host 'Restart Windows.'
