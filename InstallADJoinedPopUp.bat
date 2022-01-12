xcopy *.* "C:\temp\" /Y /I
SCHTASKS /Create /TN "Hybrid Join\Check for hybrid join completion" /xml "Check for hybrid join completion.xml"
Echo Scheduled Task Created >> "%ALLUSERSPROFILE%\Microsoft\IntuneManagementExtension\Logs\CheckHybridJoin.txt"
