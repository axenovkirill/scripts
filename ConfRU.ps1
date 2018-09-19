$list = Get-WinUserLanguageList
$list.Add('ru-RU')
Set-WinUserLanguageList $list -Force

