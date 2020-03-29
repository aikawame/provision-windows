$packages = @(
'7zip.install',
'docker-desktop',
'github-desktop',
'GoogleChrome',
'intellijidea-ultimate',
'keyhac',
'keypirinha',
'Kindle',
'line',
'microsoft-windows-terminal',
'myrica',
'openvpn',
'postman',
'registrychangesview',
'rufus',
'slack',
'wsl-ubuntu-1804',
'winmerge-jp'
)

function Install-Package-Retryable($package, $errorCount = 0) {
  try {
    Install-Package $package -Force -ProviderName 'ChocolateyGet'
  } catch {
    if ($errorCount -lt 2) {
      Install-Package-Retryable $package ($errorCount + 1)
    } else {
      Write-Error $_.Exception
    }
  }
}

function Install-TablePlus() {
  Write-Host '-> TablePlus'
  Invoke-WebRequest -Uri https://tableplus.com/release/windows/tableplus_latest -OutFile TablePlusSetup.exe -UseBasicParsing
  .\TablePlusSetup.exe /SILENT
  Remove-Item .\TablePlusSetup.exe
}

Write-Host 'Installing packages:'
$packages | % {
  Write-Host "-> $_"
  Install-Package-Retryable $_
}
Install-TablePlus
Write-Host ''

Write-Host 'Converting Ubuntu to WSL2...'
wsl --set-version Ubuntu-18.04 2
Write-Host ''
