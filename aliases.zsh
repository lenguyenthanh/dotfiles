# Vim
alias v='nvim'
alias vs='nvim -S'
export VISUAL='nvim'

# git
alias g='git'

# chess
function downloadgames() { curl -L -o $1.pgn "https://lichess.org/games/export/$1?perfType=classical,rapid&color=$2" }

# Top
alias cpu='top -o cpu'
alias mem='top -o rsize' # memory

# Gradle
alias gr='./gradlew'
alias grdcln='./gradlew clean'
alias grdcheck='./gradlew clean check'
alias grdclnb='./gradlew clean build'
alias installAll='./gradlew :app:installAll'
alias installDebug='./gradlew :app:installDebug'

function gradlewrapper() { ./gradlew wrapper --gradle-version $1 --distribution-type all}

# mkdir then cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Force remove
alias rmf='rm -rf'

# Copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'

# Always enable put back
alias trash='trash -F'

# python3 as default
alias python='python3'
