# Determine which code you want by
# 1. Selecting it in the Language Settiongs
# 2. Running Get-WinUserLanguageList in PS
$keyboardLayout = '0409:0000040B'  # Finnish QWERTY

$languageList = Get-WinUserLanguageList
$languageList[0].InputMethodTips.Clear()
$languageList[0].InputMethodTips.Add($keyboardLayout)
Set-WinUserLanguageList -LanguageList $languageList -Force
