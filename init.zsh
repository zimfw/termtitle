# more work probably needs to be done here to support multiplexers
() {
  if [[ ${TERM_PROGRAM} == Apple_Terminal ]]; then
    termtitle_update() {
      print -n "\E]7;${PWD}\a"
    }
  else
    case ${TERM} in
      xterm*|*rxvt)
        local termtitle_format
        zstyle -s ':zim:termtitle' format 'termtitle_format' || termtitle_format='%n@%m: %~'
        builtin eval "termtitle_update() { print -Pn '\E]0;${termtitle_format}\a' }"
        ;;
      *) return 1 ;;
    esac
  fi

  local zhooks zhook
  zstyle -a ':zim:termtitle' hooks 'zhooks' || zhooks=(precmd)
  autoload -Uz add-zsh-hook
  for zhook (${zhooks}) add-zsh-hook ${zhook} termtitle_update
  termtitle_update  # we execute it once to initialize the window title
}
