setlocal

set vimpath=
for %%i in ("vim.exe") do set vimpath="%%~$path:i"
if %vimpath%.==. echo "Could not find vim.exe in the path" & goto :eof
for %%i in (%vimpath%) do set vimdir="%%~dpi"
:: vimdir will look something like this: "C:\Program Files (x86)\Git\share\vim\vim74\"

echo found vim at %vimdir%
goto :eof
