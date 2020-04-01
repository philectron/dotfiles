# base16-shell from https://github.com/chriskempson/base16-shell
# also generate ~/.vimrc_background for .vimrc to load
BASE16_SHELL="${HOME}/.bash/base16-shell/"

[[ -n "${PS1}" ]] && [[ -s "${BASE16_SHELL}/profile_helper.sh" ]] && \
  eval "$("${BASE16_SHELL}/profile_helper.sh")"
