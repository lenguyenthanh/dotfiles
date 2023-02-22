#zmodload zsh/zprof

# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Use dotfile as ZSH custom directory
ZSH_CUSTOM=$DOTFILES/zsh

# Active environment
. $DOTFILES/zsh/env.sh

# Active completion
. $DOTFILES/zsh/completion

# copilot-cli alias
eval "$(github-copilot-cli alias -- "$0")"