Set-ExecutionPolicy RemoteSigned -Force
Enable-PSRemoting -Force -SkipNetworkProfileCheck
$ErrorActionPreference = 'Stop'

Write-Host ''
Write-Host 'WSLをインストールしています...'
wsl --install
Restart-Computer -Force
