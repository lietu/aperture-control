# Install all the packages you want to use in other scripts

choco.exe install -y `
    7zip.install `
    adobereader `
    aria2 `
    audacity `
    azure-cli `
    ccleaner `
    chocolateygui `
    conemu `
    cpu-z.install `
    cyg-get `
    cygwin `
    dashlane `
    discord.install `
    docker-cli `
    dotnet4.6.1 `
    everything `
    foobar2000 `
    fork `
    gimp `
    git.install `
    gitkraken `
    goggalaxy `
    golang `
    gpu-z `
    helm `
    hg `
    irfanview `
    jetbrainstoolbox `
    jq `
    jre8 `
    kitty `
    kubernetes-cli `
    make-mkv `
    mingw `
    minikube `
    mpc-hc `
    nodejs.install `
    obs-studio `
    processexp `
    pycharm `
    python2 `
    python3 `
    qbittorrent `
    screentogif `
    sharex `
    shutup10 `
    slack `
    spotify `
    steam `
    sublimetext3 `
    sysinternals `
    telegram.install `
    tortoisesvn `
    treesizefree `
    vcbuildtools `
    vcredist-all `
    veracrypt `
    virtualbox `
    vivaldi `
    vscode `
    whatsapp `
    winmerge `
    winscp `
    yarn `
    wsl `
    # This non-empty line is important, do not move it

scoop.cmd bucket add extras

scoop.cmd install `
    brave `
    dos2unix `
    lame `
    pypy3 `
    youtube-dl `
    # This non-empty line is important, do not move it
