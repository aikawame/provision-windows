chcp 65001

Write-Host ''
Write-Host 'PowerShellを設定しています...'
Set-ExecutionPolicy RemoteSigned -Force
Enable-PSRemoting -Force -SkipNetworkProfileCheck
$ErrorActionPreference = 'Stop'

Write-Host ''
Write-Host 'WSLをインストールしています...'
wsl --install

Write-Host ''
Write-Host 'UACの設定を変更しています...'
$path = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System'
Set-ItemProperty -Path $path -Name 'EnableLUA' -Value 0

Write-Host ''
Write-Host 'Windowsのダイアログに従い、再起動してください。'
