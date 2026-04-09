git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global color.status.untracked "red bold"
git config --global color.status.added "green bold"
git config --global color.status.changed "magenta bold"

git config --global alias.l "log --graph --pretty=format:'%C(auto)%h %d%s %C(green)(%ad) %C(cyan)[%an]%Creset' --date=local"
git config --global alias.l2 "log --graph --pretty=format:'%C(auto)%h %d%s %C(green)(%ad) %C(cyan)<%ae>%Creset' --date=local"

git config --global alias.b "branch --sort committerdate"
git config --global alias.ba "branch -a --sort committerdate"

git config --global core.longpaths true
git config --global credential.useHttpPath true
