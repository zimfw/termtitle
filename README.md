termtitle
=========

Sets a custom terminal title.

Settings
--------

The default terminal title format is `%n@%m: %~`, which corresponds to
`username@host: /path/to/working/directory`.

You can set your format using [prompt expansion escape sequences].
The following example sets the format to show the working directory name:

    zstyle ':zim:termtitle' format '%1~'

Apple Terminal does not support the above, but a working directory escape
sequence which is sent instead.

By default, the terminal title is updated before each prompt. To also update
the title with a custom format before a command is executed, the optional
zstyle below can be added.

    zstyle ':zim:termtitle:preexec' format '$1'

[prompt expansion escape sequences]: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
