command = "powershell.exe -NoProfile -WindowStyle Hidden -executionpolicy bypass C:\temp\Toast_Notify.ps1"
set shell = CreateObject("WScript.Shell")
shell.Run command,0 