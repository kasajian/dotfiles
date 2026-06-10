#!/usr/bin/env bash
# ============================================================
# diff_win_config.sh — Windows-only diff/merge tool config
# Skip on macOS/Linux
# ============================================================

case "$(uname -s)" in
    MINGW*|MSYS*|CYGWIN*) ;;
    *)
        echo "Skipping: diff_win_config.sh is Windows-only (WinMerge, KDiff3)"
        exit 0
        ;;
esac

# git config --global core.editor C:/tools/vim/vim90/gvim.exe
git config --global difftool.prompt false

# Primary diff tool: WinMerge
git config --global diff.tool winmerge
git config --global difftool.winmerge.cmd 'WinMergeU.exe -r -u -dl Local -dr Remote """$LOCAL""" """$REMOTE"""'

# Short alias: git difftool -t w
git config --global diff.tool w
git config --global difftool.w.cmd 'WinMergeU.exe -r -u -dl Local -dr Remote """$LOCAL""" """$REMOTE"""'

# Merge tool: KDiff3
git config --global merge.tool kdiff3
git config --global mergetool.kdiff3.cmd 'kdiff3 """$BASE""" """$LOCAL""" """$REMOTE""" -o """$MERGED"""'

