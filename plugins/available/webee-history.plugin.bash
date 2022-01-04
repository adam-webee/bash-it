# shellcheck shell=bash
about-plugin 'improve history handling with sane defaults'

# Append the history list to the file named by the value of the HISTFILE
# variable when the shell exits, rather than overwriting the file.
shopt -s histappend

# erase duplicates; alternative option: export HISTCONTROL=ignoredups
export HISTCONTROL=${HISTCONTROL:-ignorespace:erasedups}

# limitless history
export HISTSIZE=-1

# Flush history to disk after each command.
export PROMPT_COMMAND="history -a;${PROMPT_COMMAND}"

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
