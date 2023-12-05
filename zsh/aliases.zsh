# Vim
alias v='nvim'
alias vim='nvim'
export VISUAL='nvim'
alias :q='exit'
alias :e='nvim'
alias :c='clear'

# git
alias g='git'

# hoogle
# alias h='hoogle'

alias cat='bat'
alias sed='gsed -E'
alias find='fd'

alias ghcid='stack exec ghcid'

# update all dependencies
alias utd='cs update && brew upgrade && brew doctor && brew cleanup --prune=all'

# Top
alias cpu='top -o cpu'
alias mem='top -o rsize' # memory

# Gradle
alias grdcheck='gw clean check'
alias grdclnb='gw clean build'

function gradlewrapper() { ./gradlew wrapper --gradle-version $1 --distribution-type all}

# mkdir then cd
function mkcd() { mkdir -p "$@" && cd "$_"; }
function copy() { cat "$@" | pbcopy; }
function js() { cat "$@" | jq }

# kill
alias k9='kill -9'
alias killsbt='jps -v | grep sbt-launch | cut -d "'" "'" -f1 | xargs kill -9'
alias killmetals='jps -v | grep metals | cut -d "'" "'" -f1 | xargs kill -9'
alias killjps='jps -v | cut -d "'" "'" -f1 | xargs kill -9'
function kx() { jps | grep "$@" | awk '{ print $1 }' | xargs kill -9 }

# tmux session
alias tp='tmux attach -t personal'
alias trf='tmux attach -t rf'

# Copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'


# Always enable put back
#alias trash='trash -F'
alias rm='trash -F'

# Force remove
alias rmf='trash -rf -F'

# Show ip
alias ip='ifconfig | rg inet'

# python3 as default
# alias python='python3'
# alias pip=pip3

# scala-cli
alias sc='scala-cli'

# Yarn
alias y='yarn'
alias yd='yarn add --dev'
alias ya='yarn add'
alias yt='yarn test'
alias yg='yarn global add'

alias usenvm='source $(brew --prefix nvm)/nvm.sh'

# docker
alias dk='docker'
alias dc='docker-compose'

# curl
alias weather='curl wttr.in'
alias publicip='curl ifconfig.co'
function shortlink() { curl --max-redirs 0 "https://tinyurl.com/api-create.php?url=$1" | pbcopy | echo "Copied!" }
function cheat() { curl "cheat.sh/$1" | cat }
function qrcode() { curl "qrenco.de/$1" }
function dict() { curl "dict.org/d:$1" | cat }
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# pass
alias pg='pass git'

# chess
function dlgames() { curl -L -o $1_$2.pgn "https://lichess.org/games/export/$1?perfType=classical,rapid&color=$2" }


# oh-my-zsh directories.zsh
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus


alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir

# List directory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
