# PATH
PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH"

# RUST
# PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/

# mactext
# PATH=$PATH:/Library/TeX/texbin/

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
. ~/.asdf/plugins/java/set-java-home.zsh

# JAVA
export PATH="$HOME/.dotfiles/bin:$HOME/bin/async-profiler:$PATH"

# private local path
. $DOTFILES/zsh/rf.local
. $DOTFILES/zsh/lichess.local
