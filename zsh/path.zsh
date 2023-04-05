# PATH
PATH="/opt/homebrew/bin:/opt/homebrew/sbin:~/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH"

export JAVA_HOME="$(/usr/libexec/java_home -v 17)"

# JAVA
PATH="$JAVA_HOME/bin:$PATH"

# RUST
PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/

# mactext
PATH=$PATH:/Library/TeX/texbin/

# jenv
export PATH="$HOME/.jenv/bin:$PATH:$HOME/.flutter/bin"
eval "$(jenv init -)"

# private local path
. $DOTFILES/zsh/path.local
