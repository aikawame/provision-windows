# provision-windows

## WSLのインストール

以下のPowerShellスクリプトを実行します。

最後にUACの再起動ダイアログが出現するので、クリックして再起動します。

```powershell
powershell -ExecutionPolicy Bypass ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/aikawame/provision-windows/main/install.ps1') | iex)
```

## WSLの初期化とAnsibleのインストール

再起動すると、Ubuntuの初期設定画面が表示されるのでユーザーを作成します。

その後、以下のシェルスクリプトをWSL上で実行すると、WSLの初期化とAnsibleのインストール、構成管理の適用を行います。

```shell
curl -sf https://raw.githubusercontent.com/aikawame/provision-windows/main/install.sh | sh
```
