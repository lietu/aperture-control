function set_env([string]$name, $value) {
    $path = "env:\$name"
    if (Get-Item -Path $path) {
        Set-Item -Path $path -Value $value
    } else {
        New-Item -Path $path -Value $value
    }
}

# Make Git use Pageant for SSH keys
set_env GIT_SSH C:\ProgramData\chocolatey\bin\PLINK.EXE

# Path for Go sources etc.
set_env GOPATH C:\source\go
