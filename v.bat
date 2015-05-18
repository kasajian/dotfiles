@echo off
setlocal

rem make a link to the vim sub-folder located in the same folder as this batch
rem file to the $home/vimfiles folder

rem infer vim's $home variable, looks something like this: c:\home
set h=%home%
if %h%.==. set h=%homedrive%%homepath%

rem vim searches for the vimrc file in this order:
rem   $home/_vimrc
rem   $home/vimfiles/vimrc
rem   $vim/_vimrc

rem We want vim to pick up the one in vimfiles because it's recommended
rem and vundles seems to require it.
set vimfiles=%h%\vimfiles
set other_vimrc=%h%\_vimrc
if exist %other_vimrc% goto You cannot have file %other_vimrc% because the version in %vimfiles% will be ignored & goto :eof

rem if there's no vimfiles folder already, awesome
if not exist %vimfiles%\nul goto :novimfiles

rem if there's already a vimfiles folder, we can delete it if it's a link
for %%i in (%vimfiles%) do set attribs=%%~ai
set attrib9=%attribs:~8,1%
if %attrib9% equ l rmdir %vimfiles% & goto novimfiles

echo A non-link %vimfiles% folder exists.  Cannot make link. & goto :eof

:novimfiles
rem get path of this bat file, with trailing backslash so we can constrcut
set vimsubfolder=%~dp0vim
mklink /J %vimfiles% %herepath%vim
