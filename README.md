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

By default, the terminal title is updated before each prompt. The used [hooks]
can be customized with the zstyle below. For example, to have the title updated
before each prompt and also before a command is executed:

    zstyle ':zim:termtitle' hooks 'precmd' 'preexec'

[prompt expansion escape sequences]: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
[hooks]: http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
