$packages = @(
'7zip.install',
'docker-desktop',
'fonts-ricty-diminished',
'github-desktop',
'GoogleChrome',
'intellijidea-ultimate',
'keyhac',
'keypirinha',
'Kindle',
'line',
'microsoft-windows-terminal',
'openvpn',
'postman',
'registrychangesview',
'rufus',
'slack',
'wsl-ubuntu-1804',
'winmerge-jp'
)

$packages.GetEnumerator() | % { Install-Package $_ -Force -ProviderName 'ChocolateyGet' }
