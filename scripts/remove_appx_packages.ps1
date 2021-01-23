$packages = @(
'Microsoft.549981C3F5F10',
'Microsoft.BingWeather',
'Microsoft.DesktopAppInstaller',
'Microsoft.GetHelp',
'Microsoft.Getstarted',
'Microsoft.Messaging',
'Microsoft.Microsoft3DViewer',
'Microsoft.MicrosoftOfficeHub',
'Microsoft.MicrosoftSolitaireCollection',
'Microsoft.MicrosoftStickyNotes',
'Microsoft.MixedReality.Portal',
'Microsoft.MSPaint',
'Microsoft.Office.OneNote',
'Microsoft.OneConnect',
'Microsoft.People',
'Microsoft.Print3D',
# 'Microsoft.ScreenSketch',
'Microsoft.SkypeApp',
'Microsoft.Xbox.TCUI',
'Microsoft.XboxApp',
'Microsoft.XboxGameOverlay',
'Microsoft.XboxGamingOverlay',
'Microsoft.XboxSpeechToTextOverlay',
# 'Microsoft.Windows.Photos',
'Microsoft.WindowsAlarms',
# 'Microsoft.WindowsCalculator',
'Microsoft.WindowsCamera',
'microsoft.windowscommunicationsapps',
'Microsoft.WindowsFeedbackHub',
'Microsoft.WindowsMaps',
'Microsoft.WindowsSoundRecorder',
'Microsoft.YourPhone',
'Microsoft.ZuneMusic',
'Microsoft.ZuneVideo'
)

Write-Host 'Removing UWP applications:'
$packages | % {
  Write-Host "-> $_"
  Get-AppxPackage $_ | Remove-AppxPackage
}
Write-Host ''
