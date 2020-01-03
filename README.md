termtitle
=========

Sets a custom terminal title.

Settings
--------

The default terminal title format is `%n@%m: %~`, which corresponds to
`username@host: /path/to/working/directory`.

You can set your own format using [prompt expansion escape sequences].
The example below sets the format to show the working directory name:

    zstyle ':zim:termtitle' format '%1~'

For Apple Terminal, the above is not supported, and the working directory escape
sequence is sent instead.

By default, the terminal title is updated before each prompt. The used [hooks]
can be customized with the following zstyle:

    zstyle ':zim:termtitle' hooks 'precmd' 'preexec'

[prompt expansion escape sequences]: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
[hooks]: http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
