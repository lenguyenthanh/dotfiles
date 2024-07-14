# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# emacs keybindings
bindkey -e

# save zsh history
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

#zmodload zsh/zprof
export LC_ALL=en_US.UTF-8
# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

# Use dotfile as ZSH custom directory
ZSH_CUSTOM=$DOTFILES/zsh

# Active environment
. $DOTFILES/zsh/env.sh
. $DOTFILES/zsh/completion
. $DOTFILES/zsh/aliases.zsh
. $DOTFILES/zsh/path.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> scala-cli completions >>>
fpath=("/Users/tle/Library/Application Support/ScalaCli/completions/zsh" $fpath)
compinit
# <<< scala-cli completions <<<
