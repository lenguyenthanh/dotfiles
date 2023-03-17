# Vim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias vs='nvim -S'
export VISUAL='nvim'
alias :q='exit'
alias :e='nvim'
alias :c='clear'

# git
alias g='git'

# hoogle
alias h='hoogle'

alias cat='bat'
alias sed='gsed -E'

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

# kill
alias k9='kill -9'
alias killsbt='jps -v | grep sbt-launch | cut -d "'" "'" -f1 | xargs kill -9'
alias killmetals='jps -v | grep metals | cut -d "'" "'" -f1 | xargs kill -9'

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
alias python='python3'
alias pip=pip3

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

# scala
alias scala='scala3-repl'

# curl
alias weather='curl wttr.in'
alias publicip='curl ifconfig.co'
function shortlink() { curl --max-redirs 0 "https://tinyurl.com/api-create.php?url=$1" | pbcopy | echo "Copied!" }
function cheatsheet() { curl "cheat.sh/$1" | cat }
function qrcode() { curl "qrenco.de/$1" }
function dict() { curl "dict.org/d:$1" | cat }
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# pass
alias pg='pass git'

# quick restart zshrc
alias zrc='source ~/.zshrc'

# chess
function dlgames() { curl -L -o $1_$2.pgn "https://lichess.org/games/export/$1?perfType=classical,rapid&color=$2" }
