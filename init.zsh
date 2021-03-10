[[ ${TERM} != dumb ]] && () {
  local termtitle_format
  local zhooks zhook
  zstyle -a ':zim:termtitle' hooks 'zhooks' || zhooks=(precmd)
  autoload -Uz add-zsh-hook
  for zhook in ${zhooks}; do
    if [[ ${TERM_PROGRAM} == Apple_Terminal ]]; then
      termtitle_update_${zhook}() {
        print -n "\E]7;${PWD}\a"
      }
    else
      zstyle -s ":zim:termtitle:${zhook}" format 'termtitle_format' || \
          zstyle -s ':zim:termtitle' format 'termtitle_format' || \
          termtitle_format='%n@%m: %~'
      case ${TERM} in
        screen)
          builtin eval "termtitle_update_${zhook}() { print -Pn '\Ek${termtitle_format}\E\\' }"
          ;;
        *)
          builtin eval "termtitle_update_${zhook}() { print -Pn '\E]0;${termtitle_format}\a' }"
          ;;
      esac
      add-zsh-hook ${zhook} termtitle_update_${zhook}
    fi
  done
}
