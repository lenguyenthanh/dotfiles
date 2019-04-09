#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install VimPlug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Haskell Stack
curl -sSL https://get.haskellstack.org/ | sh

# Symlink zshrc
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc

# Symlink gitconfig
rm -rf $HOME/.gitconfig
ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig

# Symlink gitconfig
rm -rf $HOME/.gitconfig.local
ln -s $HOME/.dotfiles/gitconfig.local $HOME/.gitconfig.local

# Symlink vimrc
rm -rf $HOME/.vimrc
ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc

# Symlink neovim config
rm -rf $HOME/.config/nvim/init.vim
mkdir -p .config/nvim
ln -s $HOME/.dotfiles/init.vim $HOME/.config/nvim

# Symlink ideavimrc
rm -rf $HOME/.ideavimrc
ln -s $HOME/.dotfiles/ideavimrc $HOME/.ideavimrc

# Symlink tmux
rm -rf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf

# Symlink mackup
rm -rf $HOME/.mackup.cfg
ln -s $HOME/.dotfiles/mackup.cfg $HOME/.mackup.cfg

# https://stackoverflow.com/questions/43433542/stuck-at-android-repositories-cfg-could-not-be-loaded
touch ~/.android/repositories.cfg
