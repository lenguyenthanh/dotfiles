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

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install VimPlug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Haskell Stack
curl -sSL https://get.haskellstack.org/ | sh

echo "Setting up symlink..."

# Symlink zshrc
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc

# Symlink gitconfig
rm -rf $HOME/.gitconfig
ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig

# Symlink vimrc
rm -rf $HOME/.vimrc
ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc

# Symlink neovim
rm -rf $HOME/.config/nvim/init.vim
mkdir -p .config/nvim
ln -s $HOME/.dotfiles/init.vim $HOME/.config/nvim

# Symlink ideavimrc
rm -rf $HOME/.ideavimrc
ln -s $HOME/.dotfiles/ideavimrc $HOME/.ideavimrc

# Symlink tmux
rm -rf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf

# Install py3 for Neovim
pip3 install --user neovim

# https://stackoverflow.com/questions/43433542/stuck-at-android-repositories-cfg-could-not-be-loaded
touch ~/.android/repositories.cfg

echo "Done!"
