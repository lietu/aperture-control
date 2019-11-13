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
    gimp `
    git-fork `
    git.install `
    gitkraken `
    goggalaxy `
    golang `
    gpu-z `
    hg `
    irfanview `
    jetbrainstoolbox `
    jq `
    jre8 `
    kitty `
    kubernetes-cli `
    kubernetes-helm `
    kubeval `
    makemkv `
    mingw `
    minikube `
    mpc-hc `
    nodejs.install `
    obs-studio `
    putty `
    procexp `
    procmon `
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
    weasel-pageant.portable `
    whatsapp `
    winmerge `
    winscp `
    wsl `
    yarn `
    # This non-empty line is important, do not move it

# TODO: kubeseal, kubernetic, kubebox

scoop.cmd bucket add extras

scoop.cmd install `
    brave `
    dos2unix `
    lame `
    pypy3 `
    youtube-dl `
    # This non-empty line is important, do not move it
