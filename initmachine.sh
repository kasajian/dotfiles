#!/bin/bash

# ~/p is installed from here:
#   https://kasajian.visualstudio.com/DefaultCollection/_git/p

os=$(uname)
echo $os

if [[ $os == 'Darwin' ]]; then

elif [[ $platform == 'Linux' ]]; then

fi
exit

# Haven't tested with non-link, but actual, ~/.vim dir existing

chmod +x ~/dotfiles/makesymlinks.sh
~/dotfiles/makesymlinks.sh


if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [[ $os == 'Darwin' ]]; then
    # Restart automatically if the computer freezes
    #sudo systemsetup -setrestartfreeze on

    # Check for software updates daily, not just once per week
    #defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

    # Enable full keyboard access for all controls
    # (e.g. enable Tab in modal dialogs)
    #defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

    # Enable subpixel font rendering on non-Apple LCDs
    #defaults write NSGlobalDomain AppleFontSmoothing -int 2

    # Show icons for hard drives, servers, and removable media on the desktop
    #defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
    #defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
    #defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
    #defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

    # Finder: show hidden files by default
    #defaults write com.apple.finder AppleShowAllFiles -bool true

    # Finder: show status bar
    #defaults write com.apple.finder ShowStatusBar -bool true

    # Finder: show path bar
    #defaults write com.apple.finder ShowPathbar -bool true

    # When performing a search, search the current folder by default
    #defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

    # Empty Trash securely by default
    #defaults write com.apple.finder EmptyTrashSecurely -bool true

    # Show the ~/Library folder
    #chflags nohidden ~/Library

    # Set the icon size of Dock items to 52 pixels
    #defaults write com.apple.dock tilesize -int 52

    # Automatically hide and show the Dock
    #defaults write com.apple.dock autohide -bool true

    # Make sure indexing is enabled for the main volume
    #sudo mdutil -i on / > /dev/null
    # Rebuild the index from scratch
    #sudo mdutil -E / > /dev/null


    ## Show the main window when launching Activity Monitor
    #defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
    #
    ## Visualize CPU usage in the Activity Monitor Dock icon
    #defaults write com.apple.ActivityMonitor IconType -int 5
    #
    ## Show all processes in Activity Monitor
    #defaults write com.apple.ActivityMonitor ShowCategory -int 0
    #
    ## Sort Activity Monitor results by CPU usage
    #defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
    #defaults write com.apple.ActivityMonitor SortDirection -int 0
    #

    ## Use plain text mode for new TextEdit documents
    #defaults write com.apple.TextEdit RichText -int 0
    ## Open and save files as UTF-8 in TextEdit
    #defaults write com.apple.TextEdit PlainTextEncoding -int 4
    #defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
    #
    ## Enable the debug menu in Disk Utility
    #defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
    #defaults write com.apple.DiskUtility advanced-image-options -bool true
    #
    #
    ## Enable the WebKit Developer Tools in the Mac App Store
    #defaults write com.apple.appstore WebKitDeveloperExtras -bool true
    #
    ## Enable Debug Menu in the Mac App Store
    #defaults write com.apple.appstore ShowDebugMenu -bool


    # Allow installing user scripts via GitHub Gist or Userscripts.org
    #defaults write com.google.Chrome ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"
    #defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"
    #
    ## Disable the all too sensitive backswipe on Magic Mouse
    #defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
    #defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false
    #

    #for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
    #	"Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
    #	"Opera" "Safari" "SizeUp" "Spectacle" "SystemUIServer" "Terminal" \
    #	"Transmission" "Twitter" "iCal"; do
    #	killall "${app}" > /dev/null 2>&1
    #done
    #
fi
