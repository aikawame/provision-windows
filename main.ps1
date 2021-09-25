chcp 65001

Write-Host ''
Write-Host 'WSLを初期化しています...'
wsl DEBIAN_FRONTEND=noninteractive apt-get update
wsl DEBIAN_FRONTEND=noninteractive apt-get install -y language-pack-ja ansible
wsl update-locale LANG=ja_JP.UTF8
wsl DEBIAN_FRONTEND=noninteractive dpkg-reconfigure tzdata

Write-Host ''
Write-Host 'Ansibleをインストールしています...'
wsl apt-get update
wsl apt-get install -y python3-pip
wsl pip install ansible pywinrm

Write-Host ''
Write-Host 'AnsibleのPlaybookをダウンロードしています...'
Set-Location -Path C:\Windows\Temp
$client = New-Object net.webclient
$source = 'https://github.com/aikawame/provision-windows/archive/main.zip'
$client.DownloadFile($source, 'C:\Windows\Temp\provision-windows.zip')
Expand-Archive -Path .\provision-windows.zip -DestinationPath .\ -Force
Rename-Item .\provision-windows-main -NewName .\provision-windows
Set-Location -Path .\provision-windows

Write-Host ''
Write-Host 'AnsibleのPlaybookを実行しています...'
wsl ansible-playbook playbook.yml -i hosts --ask-vault-pass
