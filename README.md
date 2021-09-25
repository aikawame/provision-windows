# provision-windows

## WSLのインストール

以下のスクリプトを実行します。

最後にUACの再起動ダイアログが出現するので、クリックして再起動します。

```powershell
powershell -ExecutionPolicy Bypass ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/aikawame/provision-windows/main/install.ps1') | iex)
```

## WSLの初期化とAnsibleのインストール

再起動すると、Ubuntuの初期設定画面が表示されるのでユーザーを作成します。

その後、以下のスクリプトを実行すると、WSLの初期化とAnsibleのインストール、構成管理の適用を行います。

```powershell
powershell -ExecutionPolicy Bypass ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/aikawame/provision-windows/main/main.ps1') | iex)
```
