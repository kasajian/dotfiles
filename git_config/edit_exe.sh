#!/usr/bin/env bash
# ============================================================
# Set git core.editor to Microsoft's modern cross-platform edit
# https://github.com/microsoft/edit
# ============================================================

case "$(uname -s)" in
    MINGW*|MSYS*|CYGWIN*)
        git config --global core.editor '"C:\Windows\System32\edit.exe"'
        ;;
    *)
        git config --global core.editor edit
        ;;
esac
