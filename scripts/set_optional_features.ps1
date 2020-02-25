###############################
# Windows の機能の無効化
###############################

# Fax
Disable-WindowsOptionalFeature -NoRestart -Online -FeatureName "FaxServicesClientPackage"

# Internet Explorer 11
Disable-WindowsOptionalFeature -NoRestart -Online -FeatureName "Internet-Explorer-Optional-amd64"

# Microsoft XPS ドキュメントライター
Disable-WindowsOptionalFeature -NoRestart -Online -FeatureName "Printing-XPSServices-Features"

# SMB 1.0/CIFS ファイル共有のサポート
Disable-WindowsOptionalFeature -NoRestart -Online -FeatureName "SMB1Protocol"
Disable-WindowsOptionalFeature -NoRestart -Online -FeatureName "SMB1Protocol-Client"
Disable-WindowsOptionalFeature -NoRestart -Online -FeatureName "SMB1Protocol-Deprecation"

# メディア機能
Disable-WindowsOptionalFeature -NoRestart -Online -FeatureName "MediaPlayback"
Disable-WindowsOptionalFeature -NoRestart -Online -FeatureName "WindowsMediaPlayer"

###############################
# Windows の機能の有効化
###############################

# Windows Subsystem for Linux
Enable-WindowsOptionalFeature -NoRestart -Online -FeatureName "Microsoft-Windows-Subsystem-Linux"
