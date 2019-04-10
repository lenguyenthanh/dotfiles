# Vim alias
alias v='nvim'
export VISUAL='nvim'

# git
alias g='git'
alias glr='git pull --rebase'
alias gcount='git count'

# chess
function downloadgames() { curl -L -o $1.pgn "https://lichess.org/games/export/$1?perfType=classical,rapid&color=$2" }

# Top
alias cpu='top -o cpu'
alias mem='top -o rsize' # memory

# Gradle
alias grdcln='./gradlew clean'
alias grdcheck='./gradlew clean check'
alias grdclnb='./gradlew clean build'
alias installAll='./gradlew :app:installAll'
alias installDebug='./gradlew :app:installDebug'

function gradlewrapper() { ./gradlew wrapper --gradle-version $1 --distribution-type all}

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Basic commands
# mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }
alias rmf='rm -rf'

# Copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'

# Always put back
alias trash='trash -F'
