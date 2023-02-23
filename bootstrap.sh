#!/bin/sh

echo "Setting up your Mac..."

# Install XCode Command Line Tools.
xcode-select --install &> /dev/null

# Wait until XCode Command Line Tools installation has finished.
until $(xcode-select --print-path &> /dev/null); do
  sleep 5;
done

# Accept Xcode license
sudo xcodebuild -license accept

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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

scala-cli config power true

echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installing Haskell..."
export BOOTSTRAP_HASKELL_NONINTERACTIVE=yes
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
mkdir -p $HOME/.config/nvim
ln -s $HOME/.dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim

# Symlink ideavimrc
rm -rf $HOME/.ideavimrc
ln -s $HOME/.dotfiles/ideavimrc $HOME/.ideavimrc

# Symlink tmux
rm -rf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf

# Symlink zshrc
# rm -rf /private/etc/hosts
# sudo ln -s $HOME/.dotfiles/hosts /private/etc/hosts

# Install fzf key bindings and fuzzy compeletion:
$(brew --prefix)/opt/fzf/install

# Install py3 for Neovim
pip3 install pynvim

# Default Mac settings

chmod +x ./macos/setup.sh
./macos/setup.sh

echo "Done. Enjoy!"
