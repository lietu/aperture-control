$url = "https://github.com/microsoft/winget-cli/releases/download/v0.1.4331-preview/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle"

if (Get-Command winget.exe -ErrorAction SilentlyContinue) {
    Write-Output "WinGet already installed."
} else {
    $target = "$env:LOCALAPPDATA\Temp\winget-cli.appxbundle"
    $wc = New-Object System.Net.WebClient
    Write-Output "Downloading WinGet..."
    $wc.DownloadFile($url, $target)
    Write-Output "Installing WinGet..."
    Add-AppxPackage -Path "$target"
}