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


export RF_EXTRA_OPTS="$RF_EXTRA_OPTS --add-opens java.base/java.io=ALL-UNNAMED"
export RF_EXTRA_OPTS="$RF_EXTRA_OPTS --add-opens java.base/java.lang=ALL-UNNAMED"
export RF_EXTRA_OPTS="$RF_EXTRA_OPTS --add-opens java.base/sun.net.www.protocol.file=ALL-UNNAMED"
export RF_EXTRA_OPTS="$RF_EXTRA_OPTS --add-opens java.base/sun.net.www.protocol.jar=ALL-UNNAMED"
export ES_JAVA_OPTS='-Xms512m -Xmx1g'
export KAFKA_HEAP_OPTS='-Xms256m -Xmx512m'

export RF_LOGBACK_CONFIG=
# ~/rfconf/logback.xml
# export RF_LOG_BASE
# ~/rfData/log
# export RF_VAULT_BASE
# ~/work/git/vault

# use sbt-toplecat dev mode
# to avoid faltal warning in development
export SBT_TPOLECAT_DEV=true

# colima and testcontainers

export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export TESTCONTAINERS_HOST_OVERRIDE=192.168.106.2
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"


source ~/kubectl-context-prompt.sh
export PS1="${BLUE}\W ${GREEN}\u${YELLOW}\$(__kube_ps1)${NORMAL} \$ "
