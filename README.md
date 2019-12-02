termtitle
=========

Sets a custom terminal title.

Settings
--------

You can set a custom terminal title containing [prompt expansion escape sequences],
that is redrawn before each prompt. The example below sets the title to show the
current directory name:

    zstyle ':zim:termtitle' format '%1~'

[prompt expansion escape sequences]: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
