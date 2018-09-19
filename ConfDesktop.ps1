$Install_Path = "C:\Users\Default\Desktop"
$WSShell = New-Object -com WScript.Shell
$ShortcutPath = Join-Path -Path $Install_Path -ChildPath "List registracii1.url"
$NewShortcut = $WSShell.CreateShortcut($ShortcutPath)
$NewShortcut.TargetPath = "https://goo.gl/forms/qfKT57oppr51KgP63"
$NewShortcut.Save()
$Install_Path = "C:\Users\Default\Desktop"
$WSShell = New-Object -com WScript.Shell
$ShortcutPath = Join-Path -Path $Install_Path -ChildPath "Anketa slushatelya1.url"
$NewShortcut = $WSShell.CreateShortcut($ShortcutPath)
$NewShortcut.TargetPath = "https://docs.google.com/forms/d/e/1FAIpQLSd3u6D2kdBrOuFyZYPZHE5P1ANZR_7xXYVxciaAVpmW_ktFxw/viewform?c=0&w=1"
$NewShortcut.Save()

