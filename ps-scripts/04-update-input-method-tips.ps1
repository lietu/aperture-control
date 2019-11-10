$languageList = Get-WinUserLanguageList
$languageList[0].InputMethodTips.Clear()
$languageList[0].InputMethodTips.Add('0409:0000040B')  # Finnish QWERTY
Set-WinUserLanguageList -LanguageList $languageList -Force
