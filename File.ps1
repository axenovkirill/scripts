"$list = Get-WinUserLanguageList" | out-file c:\test.ps1 #создание файла с одной строкой
"$list.Add("ru-RU")" | out-file c:\test.ps1 -append #дописывание информации в конец существующего файла
"Set-WinUserLanguageList $list -Force" | out-file c:\test.ps1 -append #дописывание информации в конец существующего файла
