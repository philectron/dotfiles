# system related
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/bin:${PATH}"
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

# haskell
[[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ]] && \
  source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
