export XDG_CONFIG_HOME=$HOME/.config
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GPG_TTY=$(tty)                      # Allows for gpg signing

export HISTFILE="$ZDOTDIR/.zsh_history"    # History filepath
export HISTSIZE=10000                      # Maximum events for internal history
export SAVEHIST=10000                      # Maximum events in history file
