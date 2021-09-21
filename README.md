# provision-windows

## WSLのインストール

以下のスクリプトを実行すると、WSLをインストール後に自動的に再起動します。

```powershell
powershell -ExecutionPolicy Bypass ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/aikawame/provision-windows/main/install_wsl.ps1') | iex)
```

## WSLの初期化とAnsibleのインストール

再起動すると、Ubuntuの初期設定画面が表示されます。rootユーザーを使用する場合はそのまま閉じます。

その後、以下のスクリプトを実行すると、WSLの初期化とAnsibleのインストール、構成管理の適用を行います。

```powershell
powershell -ExecutionPolicy Bypass ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/aikawame/provision-windows/main/install.ps1') | iex)
```
