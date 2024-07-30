# Environment Settings

export PATH="${PATH}:${HOME}/.local/bin:${HOME}/bin"

# Java
export JAVA_HOME='/usr/lib/jvm/java-21-openjdk-amd64'

# SDKMAN
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"
