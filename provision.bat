powershell -ExecutionPolicy RemoteSigned .\scripts\set_appx_packages.ps1

reg import .\registrations\settings.reg
reg import .\registrations\others.reg

pause
