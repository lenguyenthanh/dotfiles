 #!/bin/zsh

# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH"

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Vim key binding
bindkey -v

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
