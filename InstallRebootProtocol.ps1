# Creating registry entries if they don't exists
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null 
$RegPath = "HKCR:\rebootnow\"
New-Item -Path "$RegPath" -Force
New-ItemProperty -Path "$RegPath" -Name "(Default)" -Value "URL:Reboot Protocol" -PropertyType "String"
New-ItemProperty -Path "$RegPath" -Name "URL Protocol" -Value "" -PropertyType "String"
New-Item -Path "$RegPath\shell\open\command" -Force
New-ItemProperty -Path "$RegPath\shell\open\command" -Name "(Default)" -Value 'c:\temp\Reboot.bat' -PropertyType "String"

New-Item -Path "$env:ALLUSERSPROFILE\Microsoft\IntuneManagementExtension\Logs" -Name "RebootProtocol.txt" -ItemType "file" -Value "Hybrid Join Reboot Protocol set"