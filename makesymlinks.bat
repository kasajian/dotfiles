@echo off
if %home%.==. set home=%userprofile%
set vimfiles=%home%\vimfiles
set vimfiles80=%home%\.vim
mklink /J %vimfiles% vim
mklink /J %vimfiles80% vim
