powershell -ExecutionPolicy RemoteSigned .\scripts\remove_unused_apps.ps1

reg import .\registrations\settings.reg
reg import .\registrations\others.reg

pause
