$username = 'student'
$password = '1234QWer1234'
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $username, $securePassword
Start-Process powershell -Credential $Credential -Verb RunAs -ArgumentList ("-file c:/test.ps1")
