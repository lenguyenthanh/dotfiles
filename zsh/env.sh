 #!/bin/zsh

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Theme
ZSH_THEME="nt9"

# Oh-My-Zsh Plugins
plugins=(fzf fasd colored-man-pages)

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

# nvm
export NVM_DIR="$HOME/.nvm"

export EDITOR=nvim
