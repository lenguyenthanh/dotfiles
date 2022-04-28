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
brew install elixir
brew install fasd
brew install fd
brew install fzf
brew install ghc
brew install git
brew install git-delta
brew install gnu-sed
brew install gnupg2
brew install jq
brew install lua-language-server
brew install mas # Mac App Store command-line
brew install neovim
brew install nvm
brew install pass
brew install pinentry-mac
brew install python@3.8
brew install reattach-to-user-namespace # tmux copy/paste
brew install ripgrep
brew install sbt
brew install tmux
brew install trash
brew install tree
brew install yarn
brew install zsh

# Apps
brew install appcleaner --cask
brew install docker --cask
brew install firefox --cask
brew install firefox-developer-edition --cask
brew install flux --cask
brew install gpg-suite --cask
brew install iTerm2 --cask
brew install intellij-idea --cask
brew install keybase --cask
brew install temurin --cask
brew install vagrant --cask
brew install virtualbox --cask
brew install virtualbox-extension-pack --cask

# Mac App Store
mas install 823766827 # OneDrive
mas install 497799835 # Xcode
mas install 425955336 # Skitch

# fonts
brew install font-fira-code --cask
brew install font-fira-mono-nerd-font --cask

# brew clean up
brew cleanup
