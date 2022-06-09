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

# github
alias gh="open \`git remote -v | grep git@github.com | grep fetch | head -1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/http:\/\//'\`"

# hoogle
alias h='hoogle'

alias cat='bat'
alias sed='gsed -E'

alias ghcid='stack exec ghcid'

# Top
alias cpu='top -o cpu'
alias mem='top -o rsize' # memory

# Gradle
alias gw='./gradlew'
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
#alias trash='trash -F'
alias rm='trash -F'

# Force remove
alias rmf='trash -rf -F'

# Show ip
alias ip='ifconfig | rg inet'

# python3 as default
alias python='python3'

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

# vagrant
alias vg='vagrant'

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

# chess
function dlgames() { curl -L -o $1_$2.pgn "https://lichess.org/games/export/$1?perfType=classical,rapid&color=$2" }
