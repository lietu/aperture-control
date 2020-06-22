Set-ItemProperty -Path 'HKCU:\Keyboard Layout\Toggle' -Name HotKey -Value 3
Set-ItemProperty -Path 'HKCU:\Keyboard Layout\Toggle' -Name "Language HotKey" -Value 3
Set-ItemProperty -Path 'HKCU:\Keyboard Layout\Toggle' -Name "Layout HotKey" -Value 3

New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS

Set-ItemProperty -Path 'HKU:\.DEFAULT\Keyboard Layout\Toggle' -Name HotKey -Value 3
Set-ItemProperty -Path 'HKU:\.DEFAULT\Keyboard Layout\Toggle' -Name "Language HotKey" -Value 3
Set-ItemProperty -Path 'HKU:\.DEFAULT\Keyboard Layout\Toggle' -Name "Layout HotKey" -Value 3
