$packages = @(
'Internet-Explorer-Optional-amd64',
'MediaPlayback',
'MicrosoftWindowsPowerShellV2Root',
'NetFx4-AdvSrvs',
'Printing-Foundation-Features',
'Printing-XPSServices-Features',
'SMB1Protocol',
'SMB1Protocol-Client'
'SMB1Protocol-Deprecation',
'WindowsMediaPlayer',
'WorkFolders-Client'
)

Write-Host 'Disabling Windows optional features:'
$packages | % {
  Write-Host "-> $_"
  Disable-WindowsOptionalFeature -NoRestart -Online -FeatureName $_
}
Write-Host ''
