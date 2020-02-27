powershell Set-ExecutionPolicy RemoteSigned -Force
powershell .\scripts\remove_appx_packages.ps1
powershell .\scripts\disable_windows_optional_features.ps1
powershell .\scripts\enable_windows_optional_features.ps1
powershell .\scripts\install_package_providers.ps1
powershell .\scripts\install_packages.ps1

reg import .\registrations\settings.reg
reg import .\registrations\control_panel.reg
reg import .\registrations\sounds.reg
reg import .\registrations\others.reg

pause
