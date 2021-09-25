Write-Host ''
Write-Host 'PowerShellを設定しています...'
Set-ExecutionPolicy RemoteSigned -Force
Enable-PSRemoting -Force -SkipNetworkProfileCheck
$ErrorActionPreference = 'Stop'
$path = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System'
Set-ItemProperty -Path $path -Name 'EnableLUA' -Value 0

Write-Host ''
Write-Host 'WSLをインストールしています...'
wsl --install

Write-Host ''
Write-Host 'メイン処理を準備しています...'
$path = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce'
$name = 'Provisioning'
$script = 'https://raw.githubusercontent.com/aikawame/provision-windows/main/main.ps1'
$value = "powershell -ExecutionPolicy Bypass ((New-Object Net.WebClient).DownloadString('$script') | iex)"
Set-ItemProperty -Path $path -Name $name -Value $value

Write-Host ''
Write-Host 'コンピューターを再起動しています...'
Restart-Computer -Force
