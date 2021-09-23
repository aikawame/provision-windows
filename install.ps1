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
Write-Host 'AnsibleのPlaybookを実行しています...'
wsl ansible-playbook playbook.yml -i hosts --ask-vault-pass

Write-Host ''
# Set-Location -Path $env:temp
# Remove-Item .\provision-windows-main.zip
# Remove-Item .\provision-windows-main -Recurse
