Write-Host ''
Write-Host 'WSLを初期化しています...'
wsl DEBIAN_FRONTEND=noninteractive apt-get update
wsl DEBIAN_FRONTEND=noninteractive apt-get install -y language-pack-ja ansible
wsl update-locale LANG=ja_JP.UTF8
wsl DEBIAN_FRONTEND=noninteractive dpkg-reconfigure tzdata

Write-Host ''
Write-Host 'Ansibleをインストールしています...'
wsl apt update
wsl apt install -y python3-pip
wsl pip install ansible pywinrm

Write-Host ''
Write-Host 'AnsibleのPlaybookをダウンロードしています...'
Set-Location -Path $env:temp
$client = New-Object net.webclient
$client.DownloadFile('https://github.com/aikawame/provision-windows/archive/main.zip', "$env:temp\provision-windows-main.zip")
Expand-Archive -Path .\provision-windows-main.zip -DestinationPath .\ -Force
Set-Location -Path .\provision-windows-main

Write-Host ''
Write-Host 'Windowsの構成管理を適用しています...'
wsl ansible-playbook -i win win.yml --ask-vault-pass

Write-Host ''
Write-Host 'WSLの構成管理を適用しています...'
wsl ansible-playbook -i wsl wsl.yml --ask-vault-pass

Write-Host ''
Write-Host 'その他の設定を適用しています...'
net accounts /maxpwage:unlimited
New-Item -Type SymbolicLink C:\Users\aikawame\AppData\Roaming\Keyhac -Value "\\wsl$\Ubuntu-20.04\root\src\appdata-windows\Keyhac"
New-Item -Type SymbolicLink C:\Users\aikawame\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -Value "\\wsl$\Ubuntu-20.04\root\src\appdata-windows\Terminal\settings.json"
Copy-Item -Path "\\wsl$\Ubuntu-20.04\root\src\appdata-windows\Powerman" -Recurse C:\Users\aikawame\AppData\Roaming\Powerman
schtasks /create /TN BraviaPowerOn /XML ./misc/BraviaPowerOn.xml /ru MAPC01\aikawame /rp password
Copy-Item -Path "\\wsl$\Ubuntu-20.04\root\src\appdata-windows\Fonts\Ricty-Bold.ttf" -Destination C:\Windows\Fonts\Ricty-Bold.ttf
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Ricty Bold (TrueType)" /t REG_SZ /d Ricty-Bold.ttf /f

Write-Host ''
# Set-Location -Path $env:temp
# Remove-Item .\provision-windows-main.zip
# Remove-Item .\provision-windows-main -Recurse
