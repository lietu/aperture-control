# Uninstall old packages

$chocoPackages = @(
    "dashlane",
    "skyfonts",
    "python2"
)

# ----- LOGIC ----- #

# Check currently installed packages
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
