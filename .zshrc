# History settings
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
# SHARE_HISTORY implies APPEND_HISTORY, which is on by default anyway
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE


# Automatic cd
setopt AUTO_CD


# Basic autocomplete. Rebuilding the dump and rescanning for insecure
# directories is the slowest part of startup, so do it once a day at most;
# -C reuses the existing dump and skips the scan.
autoload -Uz compinit
_zcompdump_stale=($HOME/.zcompdump(N.mh+24))   # empty unless older than 24h
if (( $#_zcompdump_stale )); then
    compinit
else
    compinit -C
fi
unset _zcompdump_stale


# This enables a selectable menu when you press Tab multiple times
zstyle ':completion:*' menu select


# Enable Case Insensitive matching (e.g., 'cd doc' matches 'Documents')
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'


# Environment
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
export EDITOR=nvim
export GPG_TTY=$(tty)


# Plugins
for _plugin in \
    /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh \
    /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
do
    [[ -r $_plugin ]] && source $_plugin
done
unset _plugin


# Locally installed binaries take precedence
export PATH="$HOME/.local/bin:$PATH"


# Enable starship
eval "$(starship init zsh)"
