#'$list = Get-WinUserLanguageList' | out-file c:\test.ps1 #создание файла с одной строкой
#'$list.Add("ru-RU")' | out-file c:\test.ps1 -append #дописывание информации в конец существующего файла
#'Set-WinUserLanguageList -LanguageList $list -Force' | out-file c:\test.ps1 -append #дописывание информации в конец существующего файла
Import-Module BitsTransfer
Start-BitsTransfer -Source https://raw.githubusercontent.com/axenovkirill/scripts/master/ConfVM2.ps1 -Destination c:\
Set-ExecutionPolicy RemoteSigned -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' -Name "confdesktop" -Value "powershell.exe -executionpolicy bypass -File c:\test.ps1"  -PropertyType "String"
