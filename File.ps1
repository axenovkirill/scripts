#'$list = Get-WinUserLanguageList' | out-file c:\test.ps1 #создание файла с одной строкой
#'$list.Add("ru-RU")' | out-file c:\test.ps1 -append #дописывание информации в конец существующего файла
#'Set-WinUserLanguageList -LanguageList $list -Force' | out-file c:\test.ps1 -append #дописывание информации в конец существующего файла
Import-Module BitsTransfer
Start-BitsTransfer -Source https://raw.githubusercontent.com/axenovkirill/scripts/master/ConfVM.ps1 -Destination c:\
Start-BitsTransfer -Source https://raw.githubusercontent.com/axenovkirill/scripts/master/putty.reg -Destination c:\
Set-ExecutionPolicy RemoteSigned -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce' -Name "confdesktop" -Value "powershell.exe -executionpolicy bypass -File c:\ConfVM.ps1"  -PropertyType "String"
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice' -Name ProgId -Value 'ChromeHTML'
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice' -Name ProgId -Value 'ChromeHTML'
Get-ScheduledTask -TaskName ServerManager | Disable-ScheduledTask

