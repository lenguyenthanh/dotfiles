 #!/bin/zsh

# Theme
ZSH_THEME="nt9"

# Oh-My-Zsh Plugins
plugins=(fzf colored-man-pages)

# Activate Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Vim key binding
#bindkey -v

# Fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --color=never'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d . --color=never'
export FZF_DEFAULT_OPTS='
  --height 50% --multi --reverse
  --bind ctrl-f:page-down,ctrl-b:page-up
'

{ eval ssh-agent; ssh-add -A; } &>/dev/null

# GPG signing
export GPG_TTY=$(tty)

source $HOME/.ghcup/env

# nvm
export NVM_DIR="$HOME/.nvm"

export EDITOR=nvim

complete -F _gradle gw
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
