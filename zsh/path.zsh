# PATH
export PATH="~/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH"

export JAVA_HOME="$(/usr/libexec/java_home -v17)"

# JAVA & ANDROID
export PATH="$JAVA_HOME/bin:$PATH"

# RUST
export PATH="$HOME/.cargo/bin:$PATH"
RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/

# Coursier
export PATH="$PATH:/Users/thanhle/Library/Application Support/Coursier/bin"
