# PATH
PATH="/opt/homebrew/bin:/opt/homebrew/sbin:~/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH"

# RUST
PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/

# mactext
PATH=$PATH:/Library/TeX/texbin/

# jenv
PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
# https://github.com/jenv/jenv/issues/44
export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
alias jenv_set_java_home='export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"'

# JAVA
export PATH="$JAVA_HOME/bin:$PATH:$HOME/bin/kafka/bin:$HOME/.dotfiles/bin:$HOME/bin/async-profiler"

# private local path
. $DOTFILES/zsh/rf.local
