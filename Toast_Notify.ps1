#Specify Launcher App ID
$LauncherID = "{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe"

#Load Assemblies
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null
 
#Build XML Template
[xml]$ToastTemplate = @"
<toast duration="long" scenario="reminder">
    <visual>
        <binding template="ToastGeneric">
            <text>Autopilot Build Process</text>
            <text>This device is now set up for use in the environment. Please restart to complete the process</text>
            <image placement="appLogoOverride" src="C:\temp\AutopilotAppLogo.jpg" />
            <image placement="hero" src="C:\temp\Autopilot.jpg" />
        </binding>
    </visual>
</toast>
"@

#Build XML ActionTemplate 
[xml]$ActionTemplate = @"
<toast>
    <actions>
       
        <action activationType="protocol" arguments="rebootnow:" content="Reboot" />       
        <action arguments="dismiss" content="Later" activationType="system"/>

    </actions>
</toast>
"@
		
#Define default actions to be added $ToastTemplate
$Action_Node = $ActionTemplate.toast.actions
		
#Append actions to $ToastTemplate
[void]$ToastTemplate.toast.AppendChild($ToastTemplate.ImportNode($Action_Node, $true))
 
#Prepare XML
$ToastXml = [Windows.Data.Xml.Dom.XmlDocument]::New()
$ToastXml.LoadXml($ToastTemplate.OuterXml)

#Prepare and Create Toast
$ToastMessage = [Windows.UI.Notifications.ToastNotification]::New($ToastXML)
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($LauncherID).Show($ToastMessage)