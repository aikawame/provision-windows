powershell -ExecutionPolicy RemoteSigned .\scripts\delete_unused_apps.ps1

reg import .\registrations\settings.reg

pause
