# Vim
alias v='nvim'
alias vs='nvim -S'
export VISUAL='nvim'
alias vi='nvim'
alias :q='exit'
alias :e='nvim'
alias :c='clear'

# git
alias g='git'

# hoogle
alias h='hoogle'

alias cat='bat'

alias ghcid='stack exec ghcid'

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


# Copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'

# Always enable put back
alias trash='trash -F'
alias rm='trash'
# Force remove
alias rmf='trash -rf -F'

# Show ip
alias ip='ifconfig | rg inet'

# python3 as default
alias python='python3'

# Yarn
alias y='yarn'
alias yd='yarn add --dev'
alias ya='yarn add'
alias yg='yarn global add'

alias usenvm='source $(brew --prefix nvm)/nvm.sh'

# docker
alias dk='docker'
alias dc='docker-compose'
