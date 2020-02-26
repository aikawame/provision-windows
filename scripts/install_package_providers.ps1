$providers = @(
'NuGet',
'PowerShellGet',
'ChocolateyGet',
'Chocolatey'
)

$providers | % { Install-PackageProvider $_ -Force }
