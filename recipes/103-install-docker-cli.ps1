Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$PSDefaultParameterValues['*:ErrorAction']='Stop'

# Requires 7z in path
$source = "https://desktop.docker.com/win/stable/amd64/Docker%20Desktop%20Installer.exe"
$target = "$env:USERPROFILE\bin"
$installer = "docker-installer.exe"
$old = Get-Location

$parent = [System.IO.Path]::GetTempPath()
[string] $name = [System.Guid]::NewGuid()
$temp = Join-Path $parent $name
echo "Temporary working directory: $temp"
New-Item -ItemType Directory -Path ($temp)
cd $temp

echo "Downloading $source"
$dst = "$temp/$installer"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($source, $dst)

echo "Extracting installer"
mkdir extracted
7z e -y -oextracted $installer 

echo "Copying needed binaries"
Copy-Item -Force extracted\docker.exe $target
Copy-Item -Force extracted\com.docker.cli.exe $target

echo "Cleaning up"
cd $old
Remove-Item -Recurse -Force $temp
