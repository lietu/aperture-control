function user_env([string]$name, [string]$value) {
    [System.Environment]::SetEnvironmentVariable($name, $value, 'User')
    [System.Environment]::SetEnvironmentVariable($name, $value, 'Process')
}

function machine_env([string]$name, [string]$value) {
    [System.Environment]::SetEnvironmentVariable($name, $value, 'Machine')
    [System.Environment]::SetEnvironmentVariable($name, $value, 'Process')
}

$jdk = ((Get-ChildItem "C:\Program Files\OpenJDK\" -Filter "openjdk*") | Sort-Object)[0]

# Make Git use Pageant for SSH keys
user_env GIT_SSH C:\ProgramData\chocolatey\bin\PLINK.EXE

# Path for Go sources etc.
user_env GOPATH C:\source\go

user_env DOCKER_BUILDKIT 1

# Java JDK and Android SDK garbage since they can't configure themselves for some reason
machine_env JAVA_HOME "C:\Program Files\OpenJDK\$jdk"
machine_env ANDROID_HOME "C:\Android\android-sdk"
