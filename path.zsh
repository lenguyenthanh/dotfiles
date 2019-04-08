# JAVA
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export ANDROID_HOME="/usr/local/share/android-sdk"
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"

# JAVA & ANDROID
export PATH="$JAVA_HOME/bin:$ANDROID_SDK_ROOT/tools/bin:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH"

# RUST
export PATH="$HOME/.cargo/bin:$PATH"
