function Install-WSL2-Kernel-Update() {
  Write-Host '-> WSL2 Kernel Update'
  $client = New-Object net.webclient
  $client.DownloadFile('https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi', "$env:temp\wsl_update_x64.msi")
  Invoke-Expression "msiexec /i $env:temp\wsl_update_x64.msi /passive /norestart"
  wsl --set-default-version 2
}

function Install-Ubuntu() {
  Write-Host '-> Ubuntu'
  choco install -y wsl-ubuntu-2004 --params /InstallRoot:true
  wsl -s Ubuntu-20.04
}

Write-Host 'Installing packages:'
Install-WSL2-Kernel-Update
Install-Ubuntu
Write-Host ''
