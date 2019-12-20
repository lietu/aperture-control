# Install all the packages you want to use in other scripts

$chocoPackages = @(
	"7zip.install",
	"adobereader",
	"aria2",
	"audacity",
	"azure-cli",
	"ccleaner",
	"chocolateygui",
	"conemu",
	"cpu-z.install",
	"cyg-get",
	"cygwin",
	"dashlane",
	"dejavufonts",
	"discord.install",
	"docker-cli",
	"dotnet4.6.1",
	"everything",
	"foobar2000",
	"gimp",
	"git-fork",
	"git.install",
	"gitkraken",
	"goggalaxy",
	"golang",
	"gpu-z",
	"hg",
	"irfanview",
	"jetbrainstoolbox",
	"jq",
	"jre8",
	"kitty",
	"kubernetes-cli",
	"kubernetes-helm",
	"kubeval",
	"makemkv",
	"mingw",
	"minikube",
	"mpc-hc",
	"nodejs.install",
	"obs-studio",
	"putty",
	"procexp",
	"procmon",
	"python2",
	"python3",
	"qbittorrent",
	"screentogif",
	"sharex",
	"shutup10",
	"skyfonts",
	"slack",
	"spotify",
	"steam",
	"sublimetext3",
	"sysinternals",
	"telegram.install",
	"tortoisesvn",
	"treesizefree",
	"vcbuildtools",
	"vcredist-all",
	"veracrypt",
	"virtualbox",
	"vivaldi",
	"vscode",
	"weasel-pageant.portable",
	"whatsapp",
	"winmerge",
	"winscp",
	"wsl",
	"yarn"
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


# TODO: kubeseal, kubernetic, kubebox
