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
'openvpn',
'postman',
'registrychangesview',
'rufus',
'slack',
'winmerge-jp'
)

$packages.GetEnumerator() | % { Install-Package $_ -Force -ProviderName 'ChocolateyGet' }
