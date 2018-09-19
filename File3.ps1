'$list = Get-WinUserLanguageList' | out-file c:\test.ps1 #создание файла с одной строкой
'$list.Add("ru-RU")' | out-file c:\test.ps1 -append #дописывание информации в конец существующего файла
'Set-WinUserLanguageList -LanguageList $list -Force' | out-file c:\test.ps1 -append #дописывание информации в конец существующего файла
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
c:\test.ps1
