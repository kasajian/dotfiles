mkdir -p ~/.vim/pack/tpope/start
pushd ~/.vim/pack/tpope/start
export GIT_SSL_NO_VERIFY=1
git clone https://tpope.io/vim/sensible.git
cd sensible
git pull
popd

ln -s ~/dotfiles/.vimrc ~/.vimrc
