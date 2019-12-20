# system related
export PATH="${PATH}:${HOME}/.local/bin"
export PATH="${PATH}:${HOME}/bin"

# others (additional PATHs should go before pwd)
export PATH="${PATH}:."

# make python use UTF-8 encoding for output to stdin, stdout, stderr
export PYTHONIOENCODING='UTF-8'

# colored GCC warnings and errors;
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# ruby
export GEM_HOME="${HOME}/gems"
export PATH="${HOME}/gems/bin:${PATH}"

# rust
export PATH="${HOME}/.cargo/bin:${PATH}"
