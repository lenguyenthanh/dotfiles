# PATH
export PATH="~/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH"

export JAVA_HOME="$(/usr/libexec/java_home -v17)"
export ANDROID_HOME="/usr/local/share/android-sdk"
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
export NDK_HOME="/usr/local/share/android-ndk"
export ANDROID_NDK_HOME="/usr/local/share/android-ndk"

# JAVA & ANDROID
#export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$JAVA_HOME/bin:$ANDROID_SDK_ROOT/tools/bin:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH"

# Node
export PATH="/usr/local/opt/node@16/bin:$PATH"

# RUST
export PATH="$HOME/.cargo/bin:$PATH"
RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/

# Coursier
export PATH="$PATH:/Users/thanhle/Library/Application Support/Coursier/bin"
