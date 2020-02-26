$packages = @(
'FaxServicesClientPackage',         # Fax
'Internet-Explorer-Optional-amd64', # Internet Explorer 11
'Printing-XPSServices-Features',    # Microsoft XPS ドキュメントライター
'SMB1Protocol',                     # SMB 1.0/CIFS ファイル共有のサポート
'SMB1Protocol-Client',              # SMB 1.0/CIFS ファイル共有のサポート
'SMB1Protocol-Deprecation',         # SMB 1.0/CIFS ファイル共有のサポート
'MediaPlayback',                    # メディア機能
'WindowsMediaPlayer'                # メディア機能
)

$packages | % { Disable-WindowsOptionalFeature -NoRestart -Online -FeatureName $_ }
