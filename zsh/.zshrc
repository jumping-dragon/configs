
path+=('/opt/homebrew/bin')
path+=('/Users/alvinjanuar/.local/share/solana/install/active_release/bin')
export PATH

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%{$fg[green]%}%n%{$fg[yellow]%}@%{$fg[blue]%}%M:%{$fg[magenta]%}%~%{$reset_color%}$ %b"

setopt prompt_subst
. ~/git-prompt.sh
export RPROMPT=$'$(__git_ps1 "%s") %W %*'

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="~/.cache/zsh/history"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/zsh/shortcutrc" ] && source "$HOME/.config/zsh/shortcutrc"
[ -f "$HOME/.config/zsh/aliasrc" ] && source "$HOME/.config/zsh/aliasrc"

[ -f "$HOME/.config/zsh/.zshenv" ] && source "$HOME/.config/zsh/.zshenv"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
