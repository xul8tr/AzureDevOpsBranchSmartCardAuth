# 1. Set execution policy for the session
Set-ExecutionPolicy -Scope CurrentUser Unrestricted -Force

# 2. Get Visual Studio's Common7 directory
$regKey = "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\devenv.exe"
$vsCommon7Dir = ((Get-ItemPropertyValue -Path $regKey -Name "(Default)") -split '\\ide')[0].Replace("`"","")

# 3. Get Visual Studio's "Microsoft.VisualStudio.DevShell.dll" path
$vsDevShellDll = "$vsCommon7Dir\Tools\Microsoft.VisualStudio.DevShell.dll"

# 4. Open the Visual Studio's Developer PowerShell in a new window so you can use tf.exe
Start-Process powershell.exe -ArgumentList @(
    '-NoExit',
    '-ExecutionPolicy', 'Bypass',
    '-Command',
    "Import-Module '$vsDevShellDll' -Force; Enter-VsDevShell -VsInstanceId '4a1c3bfd' -SkipAutomaticLocation"
)
