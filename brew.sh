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
#brew install elixir
brew install fasd
brew install fd
brew install fzf
brew install jq
brew install ghc
brew install gnupg2
brew install mas # Mac App Store command-line
brew install nvm
brew install neovim
brew install tmux
brew install python@3.8
brew install sbt
brew install coursier/formulas/coursier
brew install trash
brew install tree
brew install ripgrep
brew install gnu-sed
brew install yarn
brew install zsh
brew install atool # unzip tools
brew install reattach-to-user-namespace # tmux copy/paste
brew install pass

# Apps
brew install android-sdk --cask
brew install android-studio --cask
brew install intellij-idea --cask
brew install appcleaner --cask
brew install docker --cask
brew install firefox-developer-edition --cask
brew install gpg-suite --cask
brew install iTerm2 --cask
brew install keybase --cask
brew install vagrant --cask
brew install virtualbox --cask
brew install virtualbox-extension-pack --cask
brew install flux --cask
brew install temurin --cask

# Mac App Store
mas install 823766827 # OneDrive
mas install 1176895641 # 'Spark'
mas install 747648890 # 'telegram'
mas install 497799835 # Xcode
mas install 425955336 # Skitch

# fonts
brew cask install font-fira-code

# brew clean up
brew cleanup
