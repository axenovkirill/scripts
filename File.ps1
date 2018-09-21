Import-Module BitsTransfer
Start-BitsTransfer -Source https://raw.githubusercontent.com/axenovkirill/scripts/master/ConfVM.ps1 -Destination c:\
Start-BitsTransfer -Source https://raw.githubusercontent.com/axenovkirill/scripts/master/putty.reg -Destination c:\
Start-BitsTransfer -Source https://raw.githubusercontent.com/axenovkirill/scripts/master/fl.jpeg -Destination C:\
Start-BitsTransfer -Source https://raw.githubusercontent.com/axenovkirill/scripts/master/fon.ps1 -Destination C:\
Set-ExecutionPolicy RemoteSigned -Force
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce' -Name "confdesktop" -Value "powershell.exe -executionpolicy bypass -File c:\ConfVM.ps1"  -PropertyType "String"
Get-ScheduledTask -TaskName ServerManager | Disable-ScheduledTask


