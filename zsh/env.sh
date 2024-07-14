#!/bin/zsh

# Fzf config
export FZF_DEFAULT_COMMAND='fd --type f --color=never'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d . --color=never'
export FZF_DEFAULT_OPTS='
  --height 50% --multi --reverse
  --bind ctrl-f:page-down,ctrl-b:page-up
'
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
{ eval ssh-agent; ssh-add -A; } &>/dev/null

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# GPG signing
export GPG_TTY=$(tty)

source $HOME/.ghcup/env

# nvm
export NVM_DIR="$HOME/.nvm"

export EDITOR=nvim

source ~/.dotfiles/powerlevel10k/powerlevel10k.zsh-theme

# complete -F _gradle gw
function gw {
    gradle=$(
	current=$(pwd)
	while [ ! -f gradlew ]; do
	    cd ..
	    if [ $current = $(pwd) ]; then
		exit 1
	    fi
	    current=$(pwd)
	done
	echo $current/gradlew
    )
    if [ $? = 0 ]; then
	$gradle $*
    else
	echo "Could not find gradlew"
    fi
}

eval "$(zoxide init --cmd j zsh)"
