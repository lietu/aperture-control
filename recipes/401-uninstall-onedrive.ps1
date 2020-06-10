# Uninstall OneDrive that fucking cancer

taskkill /f /im OneDrive.exe
$path = "${Env:SYSTEMROOT}\SysWOW64\"
cmd /C "$path\OneDriveSetup.exe /uninstall"
