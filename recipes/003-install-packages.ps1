# Install all the packages you want to use in other scripts

$chocoPackages = @(
	"7zip.install",
	"adobereader",
	"aria2",
	"audacity",
	"azure-cli",
	"ccleaner",
	"chocolateygui",
	"cpu-z.install",
	"cyg-get",
	"cygwin",
	"dejavufonts",
	"docker-cli",
	"dotnet4.6.1",
	"foobar2000",
	"gimp",
	"git-fork",
	"git.install",
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
	# "kubeval", ... Until https://github.com/instrumenta/kubeval/pull/212 is merged
	"makemkv",
	"mingw",
	"minikube",
	"mpc-hc",
	"nodejs-lts",
	"obs-studio",
	"putty",
	"procexp",
	"procmon",
	"python3",
	"qbittorrent",
	"screentogif",
	"sharex",
	"shutup10",
	"slack",
	"spotify",
	"steam",
	"sublimetext3",
	"sublimemerge",
	"sysinternals",
	"telegram.install",
	"tortoisesvn",
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
	"wiztree",
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
