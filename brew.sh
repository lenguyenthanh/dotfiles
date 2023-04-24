# Taps
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions

# Binaries
brew install atool # unzip tools
brew install bat
brew install coreutils # Those that come with macOS are outdated
brew install coursier/formulas/coursier
brew install ctags
brew install fd
brew install fzf
brew install git
brew install gh
brew install git-delta
brew install gnu-sed
brew install gnupg2
brew install jq
brew install lua-language-server
brew install mas # Mac App Store command-line
brew install neovim
brew install node@18
brew install pass
brew install pinentry-mac
brew install python
brew install reattach-to-user-namespace # tmux copy/paste
brew install ripgrep
brew install tmux
brew install trash
brew install tree
brew install zsh
brew install pandoc
brew install mactex --cask
brew install jenv
brew install llvm
brew install alfred
brew install visualvm
brew install zoxide

# Apps
brew install appcleaner --cask
brew install docker --cask
brew install firefox --cask
brew install firefox-developer-edition --cask
brew install flux --cask
brew install gpg-suite --cask
brew install iTerm2 --cask
brew install intellij-idea --cask
brew install temurin17 --cask

# Mac App Store
mas install 823766827 # OneDrive
# mas install 497799835 # Xcode

# fonts
brew install font-fira-code --cask
brew install font-fira-mono-nerd-font --cask

# brew clean up
brew cleanup
