# AzureDevOpsBranchSmartCardAuth
This contains a script to launch a Visual Studio PowerShell console to manage branch permissions

You ABSOLUTELY MUST use the following PowerShell LaunchVSDevPS.ps1 script in order to run Visual Studio Developer PowerShell in a manner in which tf.exe can authenticate to your smartcard CAC credentials!
 
Thus, tf.exe MUST be run inside the Visual Studio Developer PowerShell in order to apply granular branch permissions on a repository
