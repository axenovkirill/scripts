$list = Get-WinUserLanguageList
$list.Add("ru-RU")
Set-WinUserLanguageList $list -Force
$Install_Path = "C:\Users\student\Desktop"
$WSShell = New-Object -com WScript.Shell
$ShortcutPath = Join-Path -Path $Install_Path -ChildPath "List registracii.url"
$NewShortcut = $WSShell.CreateShortcut($ShortcutPath)
$NewShortcut.TargetPath = "https://goo.gl/forms/qfKT57oppr51KgP63"
$NewShortcut.Save()
$Install_Path = "C:\Users\student\Desktop"
$WSShell = New-Object -com WScript.Shell
$ShortcutPath = Join-Path -Path $Install_Path -ChildPath "Anketa slushatelya.url"
$NewShortcut = $WSShell.CreateShortcut($ShortcutPath)
$NewShortcut.TargetPath = "https://docs.google.com/forms/d/e/1FAIpQLSd3u6D2kdBrOuFyZYPZHE5P1ANZR_7xXYVxciaAVpmW_ktFxw/viewform?c=0&w=1"
$NewShortcut.Save()
