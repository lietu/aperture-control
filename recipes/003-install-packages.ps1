# Install all the packages you want to use in other scripts

$chocoPackages = @(
	"7zip.install",
	"adobereader",
	"android-sdk",
	"audacity",
	"azure-cli",
	"cpu-z.install",
	"cyg-get",
	"cygwin",
	"dejavufonts",
	"docker-cli",
	"dotnet4.6.1",
	"foobar2000",
	"gimp",
	"git.install",
	"goggalaxy",
	"golang",
	"gpu-z",
	"irfanview",
	"jetbrainstoolbox",
	"makemkv",
	"mingw",
	"mpc-hc",
	"nodejs-lts",
	"obs-studio",
	"OpenJDK8",
	"OpenJDK8jre",
	"putty",
	"procexp",
	"procmon",
	"python3",
	"qbittorrent",
	"screentogif",
	"shutup10",
	"slack",
	"spotify",
	"steam",
	"sublimetext3",
	"sublimemerge",
	"sysinternals",
	"telegram.install",
	"vcbuildtools",
	"visualstudio2017buildtools",
	"visualstudio2019buildtools",
	"vcredist-all",
	"veracrypt",
	"virtualbox",
	"vscode",
	"weasel-pageant.portable",
	"whocrashed",
	"winmerge",
	"winscp",
	"wiztree",
	"yarn"
)

$scoopPackages = @(
    "dos2unix",
    "lame",
    "pypy3"
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
