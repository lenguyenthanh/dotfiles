# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES

# Theme
ZSH_THEME="nt9"

# Plugins
plugins=(fzf fasd)

. $DOTFILES/env.sh

# Activate Oh-My-Zsh
source $ZSH/oh-my-zsh.sh
