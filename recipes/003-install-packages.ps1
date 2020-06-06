# Install all the packages you want to use in other scripts

$wingetPackages = @(
	"1Password",
	"7Zip",
	"Adobe Acrobat Reader DC",
	"Audacity",
	"Azure CLI",
	"Azure Cosmos Emulator",
	"Brave Browser",
	"CPU-Z",
	"Microsoft.DirectX",
	"Discord",
	"GIMP",
	"Git",
	"Git Extensions",
	"Go",
	"GOG Galaxy",
	"GPU-Z",
	"Insomnia",
	"IrfanView",
	"Krisp",
	"GnuWin32.Make",
	"Microsoft.VC++2010Redist-x86",
	"Microsoft.VC++2015-2019Redist-x64",
	"Microsoft.VC++2015-2019Redist-x86",
	"Microsoft.VC++2010Redist-x64",
	"MicrosoftGitCredentialManagerforWindows",
	"MTPutty",
	"Node.js@12.16.3",
	"ProtonVPN",
	"ScreenToGif",
	"Slack",
	"Spotify",
	"Steam",
	"Sublime Merge",
	"Sublime Text",
	"Telegram Desktop",
	"Visual Studio Code",
	"vivaldi",
	"GnuWin32.Wget",
	"WhatsApp",
	"Windows Terminal",
	"WinMerge",
	"WinSCP",
	"WizTree",
	"Yarn"
)

$chocoPackages = @(
	"aria2",
	"ccleaner",
	"chocolateygui",
	"cyg-get",
	"cygwin",
	"dejavufonts",
	"docker-cli",
	"dotnet4.6.1",
	"foobar2000",
	"hg",
	"jetbrainstoolbox",
	"jq",
	"jre8",
	"kubernetes-cli",
	"makemkv",
	"mingw",
	"minikube",
	"mpc-hc",
	"procexp",
	"procmon",
	"python3",
	"qbittorrent",
	"shutup10",
	"sysinternals",
	"tortoisesvn",
	"vcbuildtools",
	"vcredist-all",
	"veracrypt",
	"virtualbox",
	"weasel-pageant.portable",
	"wsl"
)

$scoopPackages = @(
    "brave",
    "dos2unix",
    "lame",
    "pypy3",
    "youtube-dl"
)

scoop.cmd bucket add extras


# ----- LOGIC ----- #

$wingetPackageList = "$env:USERPROFILE\.winget-packages"

# Check currently installed packages
$wingetInstalled = @()
if (Test-Path $wingetPackageList) {
	$wingetInstalled = Get-Content $wingetPackageList | ForEach-Object {
		return $_
	}
}

# Check currently installed packages
$chocoInstalled = choco list --local-only -r | ForEach-Object {
    return $_.Split("|", 2)[0]
}

$scoopInstalled = scoop.cmd list | ForEach-Object {
    if ($_.StartsWith("  ")) {
        return $_.Trim().Split(" ", 2)[0]
    }
}

# Install packages

$wingetPackages | ForEach-Object {
	$pkg = $_
	if ($wingetInstalled -contains $pkg) {
		Write-Output "Already have $pkg installed via WinGet"
	} else {
		if ($pkg -match "@") {
			$name, $version = $pkg.split("@")
			winget.exe install --version "$version" -e "$name"
		} else {
			winget.exe install -e "$pkg"
		}
		Add-Content "$wingetPackageList" "`n$pkg"
	}
}

$chocoPackages | ForEach-Object {
    $pkg = $_
    if ($chocoInstalled -contains $pkg) {
        Write-Output "Already have $pkg installed."
    } else {
        choco.exe install -y $pkg
    }
}

$scoopPackages | ForEach-Object {
    $pkg = $_
    if ($scoopInstalled -contains $pkg) {
        Write-Output "Already have $pkg installed."
    } else {
        scoop.cmd install $pkg
    }
}
