git config --global user.name "Janne Enberg"
git config --global user.email "janne.enberg@lietu.net"
git config --global core.autocrlf false

git config --global credential.helper ""

git config --global diff.tool winmerge
git config --replace --global difftool.winmerge.cmd "\"C:\Program Files\WinMerge\WinMergeU.exe\" -e \"$LOCAL\" \"$REMOTE\""

git config --global merge.tool winmerge
git config --replace --global mergetool.winmerge.cmd "\"C:\Program Files\WinMerge\WinMergeU.exe\" -e -u -dl \"Base\" -dr \"Mine\" \"$LOCAL\" \"$REMOTE\" \"$MERGED\""
git config --global mergetool.prompt false
