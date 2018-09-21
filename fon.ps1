 function Set-NewDesktop
 {
 Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value "C:\fl.jpeg"
 Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaperstyle -value "6"
 rundll32.exe user32.dll, UpdatePerUserSystemParameters
 }
 Set-NewDesktop

 Remove-Item -Path "C:\Users\student\Desktop\Google Chrome.lnk"