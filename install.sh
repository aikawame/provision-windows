echo ''
echo 'WSLを初期化しています...'
DEBIAN_FRONTEND=noninteractive apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y language-pack-ja
update-locale LANG=ja_JP.UTF8
DEBIAN_FRONTEND=noninteractive dpkg-reconfigure tzdata

echo ''
echo 'Ansibleをインストールしています...'
DEBIAN_FRONTEND=noninteractive apt-get install -y python3-pip
DEBIAN_FRONTEND=noninteractive pip install ansible pywinrm

echo ''
echo 'AnsibleのPlaybookを適用しています...'
cd /mnt/c/Windows/Temp/provision-windows
ansible-playbook playbook.yml -i hosts --ask-vault-pass
