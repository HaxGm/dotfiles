# History settings
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
# SHARE_HISTORY implies APPEND_HISTORY, which is on by default anyway
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE


# Automatic cd
setopt AUTO_CD


# Basic autocomplete
autoload -Uz compinit
compinit


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

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Locally installed binaries take precedence
export PATH="$HOME/.local/bin:$PATH"


# Enable starship
eval "$(starship init zsh)"
