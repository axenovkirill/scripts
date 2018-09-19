$username = 'student'
$password = '1234QWer1234'
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $username, $securePassword
Start-Process powershell.exe -Credential $credential -ArgumentList ("-ExecutionPolicy Unrestricted -file c:/test.ps1")
