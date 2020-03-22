$packages = @(
'Microsoft-Hyper-V-All',
'Microsoft-Windows-Subsystem-Linux',
'VirtualMachinePlatform'
)

Write-Host 'Enabling Windows optional features:'
$packages | % {
  Write-Host "-> $_"
  Enable-WindowsOptionalFeature -NoRestart -Online -FeatureName $_
}
Write-Host ''
