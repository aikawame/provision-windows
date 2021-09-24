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
Set-Location -Path C:\Windows\Temp
$client = New-Object net.webclient
$source = 'https://github.com/aikawame/provision-windows/archive/main.zip'
$client.DownloadFile($source, 'C:\Windows\Temp\provision-windows.zip')
Expand-Archive -Path .\provision-windows.zip -DestinationPath .\ -Force
Set-Location -Path .\provision-windows

Write-Host ''
Write-Host 'AnsibleのPlaybookを実行しています...'
wsl ansible-playbook playbook.yml -i hosts --ask-vault-pass

Write-Host ''
Write-Host '作業ファイルを削除しています...'
Set-Location -Path C:\Windows\Temp
Remove-Item .\provision-windows.zip
Remove-Item .\provision-windows -Recurse
