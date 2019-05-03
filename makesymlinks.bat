rem @echo off
if not defined home set home=%userprofile%
rem vim searches for the user vimrc file in this order: (for "C:\Program Files (x86)\vim\vim80\vim.exe")
rem for C:\Program Files\Git\usr\bin\vim.exe:
rem:  $home/.vimrc"
rem:  ~/.vim/vimrc"

set vimfiles=%home%\vimfiles
set vimfiles80=%home%\.vim
rem mklink /D %vimfiles% vim
rem mklink /D %vimfiles80% vim

rem get dir path of this bat file, with trailing backslash so we can construct
set vimsubfolder=%~dp0vim
mklink /D %vimfiles% %vimsubfolder%

rem This is for the git vim.exe.  see above.
mklink %home%\.vimrc %vimsubfolder%\vimrc


rem this is for zconsole (not vim related)
mklink /J %appdata%\console console

mklink /D %home%\.vim %vimsubfolder%
