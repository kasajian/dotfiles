# git config --global core.editor C:/tools/vim/vim90/gvim.exe
git config --global difftool.prompt false

git config --global diff.tool winmerge
git config --global difftool.winmerge.cmd 'WinMergeU.exe -r -u -dl Local -dr Remote """$LOCAL""" """$REMOTE"""'
git config --global diff.tool w
git config --global difftool.w.cmd 'WinMergeU.exe -r -u -dl Local -dr Remote """$LOCAL""" """$REMOTE"""'
git config --global merge.tool kdiff3
git config --global mergetool.kdiff3.cmd 'kdiff3 """$BASE""" """$LOCAL""" """$REMOTE""" -o """$MERGED"""'

