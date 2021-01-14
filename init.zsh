[[ ${TERM} != dumb ]] && () {
  if [[ ${TERM_PROGRAM} == Apple_Terminal ]]; then
    termtitle_update() {
      print -n "\E]7;${PWD}\a"
    }
    termtitle_update_preexec() { termtitle_update }
  else
    local precmd_format preexec_format
    zstyle -s ':zim:termtitle' format 'precmd_format' || precmd_format='%n@%m: %~'
    zstyle -s ':zim:termtitle:preexec' format 'preexec_format'
    case ${TERM} in
      screen)
        builtin eval "termtitle_update() { print -Pn '\Ek${precmd_format}\E\\' }"
        builtin eval "termtitle_update_preexec() { print -Pn '\Ek${preexec_format}\E\\' }"
        ;;
      *)
        builtin eval "termtitle_update() { print -Pn '\E]0;${precmd_format}\a' }"
        builtin eval "termtitle_update_preexec() { print -Pn '\E]0;${preexec_format}\a' }"
        ;;
    esac
  fi

  autoload -Uz add-zsh-hook
  add-zsh-hook precmd termtitle_update # hook to update before each prompt
  [[ -n ${preexec_format} ]] && add-zsh-hook preexec termtitle_update_preexec # hook to update before a command is executed, only set if a format was specified
  termtitle_update # we execute it once to initialize the window title
}
