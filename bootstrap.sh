#!/bin/sh

echo "Setting up your Mac..."

# Install Xcode
xcode-select --install

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install all our dependencies with bundle (See Brewfile)
echo "Installing brewfile"
chmod +x brew.sh
./brew.sh

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp $HOME/.dotfiles/themes/nt9.zsh-theme $HOME/.oh-my-zsh/themes/

# Install VimPlug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Haskell Stack
echo "Installiing Stack..."
curl -sSL https://get.haskellstack.org/ | sh

echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Setting up symlink..."

# Symlink zshrc
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc

# Symlink gitconfig
rm -rf $HOME/.gitconfig
ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig

# Symlink vimrc
rm -rf $HOME/.vimrc
ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc

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

# Install fzf key bindings and fuzzy compeletion:
$(brew --prefix)/opt/fzf/install

# Install py3 for Neovim
pip3 install pynvim

# https://stackoverflow.com/questions/43433542/stuck-at-android-repositories-cfg-could-not-be-loaded
touch ~/.android/repositories.cfg

# Default Mac settings

chmod +x ./macos/setup.sh
./macos/setup.sh

echo "Done. Enjoy!"
