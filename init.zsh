# sets the window title and updates upon directory change
# more work probably needs to be done here to support multiplexers
case ${TERM} in
  xterm*|*rxvt)
    termtitle_precmd() {
      local zformat
      if zstyle -s ':zim:termtitle' format 'zformat'; then
        print -Pn "\E]0;${zformat}\a"
      fi
    }
    autoload -Uz add-zsh-hook && add-zsh-hook precmd termtitle_precmd
    termtitle_precmd  # we execute it once to initialize the window title
    ;;
esac
