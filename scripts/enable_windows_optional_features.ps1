$packages = @(
'Microsoft-Windows-Subsystem-Linux'
)

$packages | % { Enable-WindowsOptionalFeature -NoRestart -Online -FeatureName $_ }
