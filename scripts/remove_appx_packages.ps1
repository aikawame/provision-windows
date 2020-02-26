$packages = @(
'Microsoft.Microsoft3DViewer',            # 3Dビューアー
'Microsoft.ZuneMusic',                    # Groove ミュージック
'Microsoft.MicrosoftSolitaireCollection', # Microsoft Solitaire Collection
'Microsoft.MixedReality.Portal',          # Mixed Reality ポータル
'Microsoft.MicrosoftOfficeHub',           # Office
'Microsoft.Office.OneNote',               # OneNote
'Microsoft.People',                       # People
'Microsoft.Print3D',                      # Print 3D
'Microsoft.SkypeApp',                     # Skype
'Microsoft.MicrosoftStickyNotes',         # Sticky Notes
'Microsoft.XboxApp',                      # Xbox
'Microsoft.XboxGameOverlay',              # Xbox
'Microsoft.XboxSpeechToTextOverlay',      # Xbox
'Microsoft.Xbox.TCUI',                    # Xbox Live
'Microsoft.WindowsAlarms',                # アラーム＆クロック
'Microsoft.WindowsCamera',                # カメラ
'Microsoft.XboxGamingOverlay',            # ゲーム バー
'Microsoft.YourPhone',                    # スマホ同期アプリ
'Microsoft.Getstarted',                   # ヒント
'Microsoft.WindowsFeedbackHub',           # フィードバック Hub
# 'Microsoft.Windows.Photos',             # フォト
'Microsoft.MSPaint',                      # ペイント 3D
'Microsoft.WindowsSoundRecorder',         # ボイス レコーダー
'Microsoft.WindowsMaps',                  # マップ
'microsoft.windowscommunicationsapps',    # メール/カレンダー
'Microsoft.Messaging',                    # メッセージング
'Microsoft.OneConnect',                   # モバイル通信プラン
'Microsoft.ZuneVideo',                    # 映画 & テレビ
# 'Microsoft.ScreenSketch,                # 切り取り & スケッチ
'Microsoft.BingWeather',                  # 天気
# 'Microsoft.WindowsCalculator',          # 電卓
'Microsoft.GetHelp'                       # 問い合わせ
)

# TODO: なぜか消えてくれないパッケージが幾つかあるので調べる
$packages | % { Get-AppxPackage $_ | Remove-AppxPackage  }
