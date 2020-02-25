powershell -ExecutionPolicy RemoteSigned .\scripts\set_appx_packages.ps1
powershell -ExecutionPolicy RemoteSigned .\scripts\set_optional_features.ps1

reg import .\registrations\settings.reg
reg import .\registrations\control_panel.reg
reg import .\registrations\sounds.reg
reg import .\registrations\others.reg

pause
