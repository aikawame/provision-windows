$packages = @(
'FaxServicesClientPackage',
'Internet-Explorer-Optional-amd64',
'MediaPlayback',
'Printing-XPSServices-Features',
'SMB1Protocol',
'SMB1Protocol-Client'
'SMB1Protocol-Deprecation',
'WindowsMediaPlayer'
)

$packages | % { Disable-WindowsOptionalFeature -NoRestart -Online -FeatureName $_ }
