$packages = @(
'Microsoft-Hyper-V-All',
'Microsoft-Windows-Subsystem-Linux',
'VirtualMachinePlatform'
)

$packages | % { Enable-WindowsOptionalFeature -NoRestart -Online -FeatureName $_ }
