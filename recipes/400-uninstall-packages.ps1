# Uninstall old packages

$chocoPackages = @(
	"chocolateygui",
	"git-fork",
    "dashlane",
    "skyfonts",
    "python2",
    "kubeval",
    "conemu",
    "gitkraken",
    "treesizefree"
)

$appxPackages = @(
    "king.com.",
    "Microsoft.Zune",
    "SpotifyAB."
)

# ----- LOGIC ----- #

# Check currently installed chocolatey packages
$chocoInstalled = choco list --local-only -r | ForEach-Object {
    return $_.Split("|", 2)[0]
}

# Remove packages
$chocoPackages | ForEach-Object {
    $pkg = $_

    if ($chocoInstalled -contains $pkg) {
        choco.exe uninstall -y --ignore-autouninstaller-failure --ignore-detected-reboot $pkg
    } else {
        Write-Output "$pkg is not installed."
    }
}

# Get current installed Appx packages incl. Windows preinstalled trash
$appxInstalled = get-AppxPackage -AllUsers | Select Name, PackageFullName | sort-object -Property Name

# Remove unwanted packages
$appxInstalled | ForEach-Object {
    $name = $_.Name
    $pkg = $_.PackageFullName

    $appxPackages | ForEach-Object {
        $prefix = $_
        if ($name.StartsWith($prefix)) {
            Write-Output "Uninstalling $pkg"
            Remove-AppxPackage "$pkg"
        }
    }
}
