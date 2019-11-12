Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
net localgroup "Hyper-V Administrators" $env:USERNAME /add
