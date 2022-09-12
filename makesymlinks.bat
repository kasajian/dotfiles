:: /J used so second parameter can be relative to this cwd, rather than the link
mklink /J %appdata%\console console

:: Link .vimrc in the cwd to ~\.vimrc
mklink ..\.vimrc .\dotfiles\.vimrc

:: VIM Plugins
:: 	Install "sensible"
mkdir ..\.vim\pack\tpope\start
pushd ..\.vim\pack\tpope\start
git clone --depth=1 https://tpope.io/vim/sensible.git
cd sensible
git pull
popd'


:: bash / osx ???
REM mkdir -p ~/.vim/pack/tpope/start
REM pushd ~/.vim/pack/tpope/start
REM git clone https://tpope.io/vim/sensible.git
REM popd
