$packages = @(
'Microsoft-Windows-Subsystem-Linux'  # Windows Subsystem for Linux
)

$packages | % { Enable-WindowsOptionalFeature -NoRestart -Online -FeatureName $_ }
