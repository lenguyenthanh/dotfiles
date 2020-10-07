# Taps
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions

# Binaries
brew install coreutils # Those that come with macOS are outdated
brew install git
brew install git-delta
brew install bat
brew install ctags
brew install elixir
brew install fasd
brew install fd
brew install fzf
brew install jq
brew install ghc
brew install gnupg2
brew install mas # Mac App Store command-line
brew install nvm
brew install neovim --HEAD
brew install tmux
brew install python@3.8
brew install sbt
brew install coursier/formulas/coursier
brew install trash
brew install tree
brew install ripgrep
brew install yarn
brew install zsh
brew install atool # unzip tools
brew install reattach-to-user-namespace # tmux copy/paste
brew install pass

# Apps
brew cask install android-sdk
brew cask install android-studio
brew cask install intellij-idea-ce
brew cask install appcleaner
brew cask install docker
brew cask install firefox-developer-edition
brew cask install gpg-suite
brew cask install iTerm2
brew cask install java
brew cask install keybase
brew cask install vagrant
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install flux

# Mac App Store
mas install 823766827 # OneDrive
mas install 1176895641 # 'Spark'
mas install 747648890 # 'telegram'
mas install 497799835 # Xcode

# fonts
brew cask install font-fira-code

# brew clean up
brew cleanup
