'$list = Get-WinUserLanguageList' | out-file c:\test.ps1 #создание файла с одной строкой
'$list.Add("ru-RU")' | out-file c:\test.ps1 -append #дописывание информации в конец существующего файла
'Set-WinUserLanguageList -LanguageList $list -Force' | out-file c:\test.ps1 -append #дописывание информации в конец существующего файла
Set-ExecutionPolicy RemoteSigned -Force
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run', "confdesktop", "REG_SZ", "c:\test.ps1")
