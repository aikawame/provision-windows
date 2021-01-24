Write-Host 'Applying other settings:'

net accounts /maxpwage:unlimited

New-Item -Type SymbolicLink C:\Users\aikawame\AppData\Roaming\Keyhac -Value "\\wsl$\Ubuntu-20.04\root\src\appdata-windows\Keyhac"
New-Item -Type SymbolicLink C:\Users\aikawame\AppData\Roaming\Powerman -Value "\\wsl$\Ubuntu-20.04\root\src\appdata-windows\Powerman"
New-Item -Type SymbolicLink C:\Users\aikawame\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -Value "\\wsl$\Ubuntu-20.04\root\src\appdata-windows\Terminal\settings.json"
Copy-Item \\wsl$\Ubuntu-20.04\root\src\appdata-windows\Fonts\Ricty-Bold.ttf C:\Windows\Fonts\Ricty-Bold.ttf

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Ricty Bold (TrueType)" /t REG_SZ /d Ricty-Bold.ttf /f
