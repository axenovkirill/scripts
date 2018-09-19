
'$list = Get-WinUserLanguageList' | out-file c:\test.ps1 
'$list.Add("ru-RU")' | out-file c:\test.ps1 -append 
'Set-WinUserLanguageList -LanguageList $list -Force' | out-file c:\test.ps1 -append
'function Set-PinnedApplication {[CmdletBinding()]' | out-file c:\test.ps1 -append
'param([Parameter(Mandatory=$true)][string]$Action,[Parameter(Mandatory=$true)][string]$FilePath)' | out-file c:\test.ps1 -append
'if(-not (test-path $FilePath)) {throw "FilePath does not exist."}' | out-file c:\test.ps1 -append
'function InvokeVerb {' | out-file c:\test.ps1 -append 
'param([string]$FilePath,$verb)' | out-file c:\test.ps1 -append
'$verb = $verb.Replace("&","")' | out-file c:\test.ps1 -append
'$path= split-path $FilePath' | out-file c:\test.ps1 -append 
'Set-WinUserLanguageList -LanguageList $list -Force' | out-file c:\test.ps1 -append
'$shell=new-object -com "Shell.Application"' | out-file c:\test.ps1 -append
'$folder=$shell.Namespace($path)' | out-file c:\test.ps1 -append 
'$item = $folder.Parsename((split-path $FilePath -leaf))' | out-file c:\test.ps1 -append
'$itemVerb = $item.Verbs() | ? {$_.Name.Replace("&","") -eq $verb}' | out-file c:\test.ps1 -append
'if($itemVerb -eq $null){throw "Verb $verb not found."} else {$itemVerb.DoIt()}	}' | out-file c:\test.ps1 -append 
'function GetVerb {param([int]$verbId' | out-file c:\test.ps1 -append
'try {$t = [type]"CosmosKey.Util.MuiHelper"} catch {$def = [Text.StringBuilder]""' | out-file c:\test.ps1 -append
'[void]$def.AppendLine('[DllImport("user32.dll")]')' | out-file c:\test.ps1 -append 
'[void]$def.AppendLine('public static extern int LoadString(IntPtr h,uint id, System.Text.StringBuilder sb,int maxBuffer);')' | out-file c:\test.ps1 -append
'[void]$def.AppendLine('[DllImport("kernel32.dll")]')' | out-file c:\test.ps1 -append
'[void]$def.AppendLine('public static extern IntPtr LoadLibrary(string s);')' | out-file c:\test.ps1 -append 
'add-type -MemberDefinition $def.ToString() -name MuiHelper -namespace CosmosKey.Util}' | out-file c:\test.ps1 -append
'if($global:CosmosKey_Utils_MuiHelper_Shell32 -eq $null){$global:CosmosKey_Utils_MuiHelper_Shell32 = [CosmosKey.Util.MuiHelper]::LoadLibrary("shell32.dll")}' | out-file c:\test.ps1 -append
'$maxVerbLength=255' | out-file c:\test.ps1 -append 
'$verbBuilder = new-object Text.StringBuilder "",$maxVerbLength' | out-file c:\test.ps1 -append
'[void][CosmosKey.Util.MuiHelper]::LoadString($CosmosKey_Utils_MuiHelper_Shell32,$verbId,$verbBuilder,$maxVerbLength)' | out-file c:\test.ps1 -append 
'return $verbBuilder.ToString()}' | out-file c:\test.ps1 -append 
'}$verbs = @{"PintoTaskbar"=5386' | out-file c:\test.ps1 -append
'"UnpinfromTaskbar"=5387}' | out-file c:\test.ps1 -append
'if($verbs.$Action -eq $null){Throw "Action $action not supported`nSupported actions are:`n`tPintoTaskbar`n`tUnpinfromTaskbar"} InvokeVerb -FilePath $FilePath -Verb $(GetVerb -VerbId $verbs.$action)}' | out-file c:\test.ps1 -append 
'Set-PinnedApplication -Action PintoTaskbar -FilePath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Notepad++\Notepad++.lnk'' | out-file c:\test.ps1 -append
'Set-PinnedApplication -Action PintoTaskbar -FilePath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefox.lnk'' | out-file c:\test.ps1 -append
'Set-PinnedApplication -Action PintoTaskbar -FilePath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PuTTY (64-bit)\PuTTY.lnk'' | out-file c:\test.ps1 -append
'Set-PinnedApplication -Action PintoTaskbar -FilePath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Cisco eReader\Cisco eReader.lnk'' | out-file c:\test.ps1 -append
'Set-PinnedApplication -Action PintoTaskbar -FilePath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Foxit Reader\Foxit Reader.lnk'' | out-file c:\test.ps1 -append

$Install_Path = "C:\Users\default\Desktop"

$WSShell = New-Object -com WScript.Shell

$ShortcutPath = Join-Path -Path $Install_Path -ChildPath "List registracii.url"

$NewShortcut = $WSShell.CreateShortcut($ShortcutPath)

$NewShortcut.TargetPath = "https://goo.gl/forms/qfKT57oppr51KgP63"

$NewShortcut.Save()

$Install_Path = "C:\Users\default\Desktop"

$WSShell = New-Object -com WScript.Shell

$ShortcutPath = Join-Path -Path $Install_Path -ChildPath "Anketa slushatelya.url"

$NewShortcut = $WSShell.CreateShortcut($ShortcutPath)

$NewShortcut.TargetPath = "https://docs.google.com/forms/d/e/1FAIpQLSd3u6D2kdBrOuFyZYPZHE5P1ANZR_7xXYVxciaAVpmW_ktFxw/viewform?c=0&w=1"

$NewShortcut.Save()


Set-ExecutionPolicy RemoteSigned -Force

New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' -Name "confdesktop" -Value "powershell.exe -executionpolicy bypass -File c:\test.ps1"  -PropertyType "String"
