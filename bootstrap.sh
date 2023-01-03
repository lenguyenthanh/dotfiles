#!/bin/sh

echo "Setting up your Mac..."

# Install Xcode
xcode-select --install

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Install dependencies using brew
echo "Installing brewfile..."
chmod +x brew.sh
./brew.sh

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp $HOME/.dotfiles/themes/nt9.zsh-theme $HOME/.oh-my-zsh/themes/

echo "Installing Scala...."
cs setup

echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installing Haskell..."
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# Tmux plugins Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Setting up symlink..."

# Symlink zshrc
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc

# Symlink gitconfig
rm -rf $HOME/.gitconfig
ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig

# Symlink neovim
rm -rf $HOME/.config/nvim/init.vim
mkdir -p .config/nvim
ln -s $HOME/.dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim

# Symlink ideavimrc
rm -rf $HOME/.ideavimrc
ln -s $HOME/.dotfiles/ideavimrc $HOME/.ideavimrc

# Symlink tmux
rm -rf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf

# Symlink Marta conf
rm -rf "$HOME/Library/Application Support/org.yanex.marta/conf.marco"
ln -s $HOME/.dotfiles/preferences/marta.conf "$HOME/Library/Application Support/org.yanex.marta/conf.marco"

# Symlink zshrc
rm -rf /private/etc/hosts
sudo ln -s $HOME/.dotfiles/hosts /private/etc/hosts

# Install fzf key bindings and fuzzy compeletion:
$(brew --prefix)/opt/fzf/install

# Install py3 for Neovim
pip3 install pynvim

# Install Ansible
# pip3 install ansible

# https://stackoverflow.com/questions/43433542/stuck-at-android-repositories-cfg-could-not-be-loaded
touch ~/.android/repositories.cfg

# Default Mac settings

chmod +x ./macos/setup.sh
./macos/setup.sh

echo "Done. Enjoy!"
