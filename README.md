# provision-windows

## インストール

```powershell
powershell -ExecutionPolicy Bypass ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/aikawame/provision-windows/main/install.ps1') | iex)
```

途中でPCが自動的に再起動し、その後の処理でAnsible Vaultのパスワードを求められます。
