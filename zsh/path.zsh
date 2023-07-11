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

export JAVA_HOME="$(/usr/libexec/java_home -v 20)"

# JAVA
export PATH="$JAVA_HOME/bin:$PATH"

# private local path
. $DOTFILES/zsh/path.local
