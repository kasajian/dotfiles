@echo off

rem make a link to the vim sub-folder located in the same folder as this batch
rem file to the $home/vimfiles folder

rem infer vim's $home variable, looks something like this: c:\home
if %home%.==. set home=%userprofile%

rem vim searches for the vimrc file in this order:
rem   $home/_vimrc
rem   $home/vimfiles/vimrc
rem   $vim/_vimrc

rem We want vim to pick up the one in vimfiles because it's recommended
rem and vundles seems to require it.
set vimfiles=%home%\vimfiles
set other_vimrc=%home%\_vimrc
if exist %other_vimrc% echo Please move file %other_vimrc% so Vim can find vimrc in %vimfiles% & goto :eof

rem if there's no vimfiles folder already, awesome
if not exist %vimfiles%\nul goto :novimfiles

rem if there's already a vimfiles folder, we can delete it if it's a link
for %%i in (%vimfiles%) do set attribs=%%~ai
set attrib9=%attribs:~8,1%
if %attrib9% equ l rmdir %vimfiles% & goto novimfiles

echo Please move %vimfiles% folder.  Cannot make a link folder if real one exists.  & goto :eof

:novimfiles
rem get path of this bat file, with trailing backslash so we can constrcut
set vimsubfolder=%~dp0vim
mklink /J %vimfiles% %herepath%vim

mklink /J %appdata%\console console
