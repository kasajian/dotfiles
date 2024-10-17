# git config --global core.editor C:/tools/vim/vim90/gvim.exe
git config --global difftool.prompt false

git config --global diff.tool winmerge
git config --global difftool.winmerge.cmd 'WinMergeU.exe -r -u -dl Local -dr Remote """$LOCAL""" """$REMOTE"""'
git config --global diff.tool w
git config --global difftool.w.cmd 'WinMergeU.exe -r -u -dl Local -dr Remote """$LOCAL""" """$REMOTE"""'
git config --global merge.tool kdiff3
git config --global mergetool.kdiff3.cmd 'kdiff3 """$BASE""" """$LOCAL""" """$REMOTE""" -o """$MERGED"""'

git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global core.autocrlf false
git config --global push.default simple
git config --global color.status.untracked "red bold"
git config --global color.status.added "green bold"
git config --global color.status.changed "magenta bold"

git config --global alias.l "log --graph --pretty=format:'%C(auto)%h %d%s %C(green)(%ad) %C(cyan)[%an]%Creset' --date=local"
git config --global alias.l2 "log --graph --pretty=format:'%C(auto)%h %d%s %C(green)(%ad) %C(cyan)<%ae>%Creset' --date=local"

git config --global alias.b "branch --sort committerdate"
git config --global alias.ba "branch -a --sort committerdate"

git config --global user.name dev
git config --global user.email dev@dev.com