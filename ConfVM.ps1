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

Remove-Item -Path "C:\Users\default\Desktop\Google Chrome.lnk"

function Set-PinnedApplication

{

   	[CmdletBinding()]

   	param(

      [Parameter(Mandatory=$true)][string]$Action, 

	  [Parameter(Mandatory=$true)][string]$FilePath

   	)

   	if(-not (test-path $FilePath)) { 

   		throw "FilePath does not exist."  

	}

   	function InvokeVerb {

   		param([string]$FilePath,$verb)

		$verb = $verb.Replace("&","")

		$path= split-path $FilePath

		$shell=new-object -com "Shell.Application" 

		$folder=$shell.Namespace($path)   

		$item = $folder.Parsename((split-path $FilePath -leaf))

		$itemVerb = $item.Verbs() | ? {$_.Name.Replace("&","") -eq $verb}

		if($itemVerb -eq $null){

			throw "Verb $verb not found."			

		} else {

			$itemVerb.DoIt()

		}

   	}

	function GetVerb {

		param([int]$verbId)

		try {

			$t = [type]"CosmosKey.Util.MuiHelper"

		} catch {

			$def = [Text.StringBuilder]""

			[void]$def.AppendLine('[DllImport("user32.dll")]')

			[void]$def.AppendLine('public static extern int LoadString(IntPtr h,uint id, System.Text.StringBuilder sb,int maxBuffer);')

			[void]$def.AppendLine('[DllImport("kernel32.dll")]')

			[void]$def.AppendLine('public static extern IntPtr LoadLibrary(string s);')

			add-type -MemberDefinition $def.ToString() -name MuiHelper -namespace CosmosKey.Util			

		}

		if($global:CosmosKey_Utils_MuiHelper_Shell32 -eq $null){		

			$global:CosmosKey_Utils_MuiHelper_Shell32 = [CosmosKey.Util.MuiHelper]::LoadLibrary("shell32.dll")

		}

		$maxVerbLength=255

		$verbBuilder = new-object Text.StringBuilder "",$maxVerbLength

		[void][CosmosKey.Util.MuiHelper]::LoadString($CosmosKey_Utils_MuiHelper_Shell32,$verbId,$verbBuilder,$maxVerbLength)

		return $verbBuilder.ToString()

	}

	$verbs = @{ 

		"PintoTaskbar"=5386

		"UnpinfromTaskbar"=5387

	}

	if($verbs.$Action -eq $null){

   		Throw "Action $action not supported`nSupported actions are:`n`tPintoTaskbar`n`tUnpinfromTaskbar"

	}

	InvokeVerb -FilePath $FilePath -Verb $(GetVerb -VerbId $verbs.$action)

}

Set-PinnedApplication -Action PintoTaskbar -FilePath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Notepad++\Notepad++.lnk'

Set-PinnedApplication -Action PintoTaskbar -FilePath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefox.lnk'

Set-PinnedApplication -Action PintoTaskbar -FilePath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PuTTY (64-bit)\PuTTY.lnk'

Set-PinnedApplication -Action PintoTaskbar -FilePath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Cisco eReader\Cisco eReader.lnk'

Set-PinnedApplication -Action PintoTaskbar -FilePath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Foxit Reader\Foxit Reader.lnk'

$tmZone = "Russian Standard Time"
$WinOSVerReg = Get-Item "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
$WinOSVer = $WinOSVerReg.GetValue("CurrentVersion")
if ($WinOSVer -GE 6){
tzutil.exe /s $tmZone
} Else {
$param = "/c Start `"Change tmZone`" /MIN %WINDIR%\System32\Control.exe TIMEDATE.CPL,,/Z "
$param += $tmZone
$proc = [System.Diagnostics.Process]::Start( "CMD.exe", $param )
}

Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice' -Name ProgId -Value 'ChromeHTML'
Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice' -Name ProgId -Value 'ChromeHTML'

Function Set-WallPaper($Value)
{
 Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value
 Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaperstyle -value "6"
 rundll32.exe user32.dll, UpdatePerUserSystemParameters
}
 
Set-WallPaper -value "c:\fl.jpeg"

regedit -s -q c:\putty.reg
