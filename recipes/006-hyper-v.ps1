Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart
net localgroup "Hyper-V Administrators" $env:USERNAME /add
