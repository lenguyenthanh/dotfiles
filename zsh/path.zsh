# PATH
export PATH="~/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH"

# JAVA
export JAVA_16_HOME=$(/usr/libexec/java_home -v16)
export JAVA_14_HOME=$(/usr/libexec/java_home -v14)
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)

#export JAVA_HOME="$(/usr/libexec/java_home -v1.8)"
export JAVA_HOME="$(/usr/libexec/java_home -v16)"

alias java16='export JAVA_HOME=$JAVA_16_HOME'
alias java14='export JAVA_HOME=$JAVA_14_HOME'
alias java8='export JAVA_HOME=$JAVA_8_HOME'

export ANDROID_HOME="/usr/local/share/android-sdk"
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"

# JAVA & ANDROID
export PATH="$JAVA_HOME/bin:$ANDROID_SDK_ROOT/tools/bin:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH"

# RUST
export PATH="$HOME/.cargo/bin:$PATH"
RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/

