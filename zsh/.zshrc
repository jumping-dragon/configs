
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
HISTIGNORE="clear:bg:fg:cd:cd -:cd ..:exit:date:w:* --help:ls:l:ll:lll"
HISTFILE="$HOME/.cache/zsh/.zsh_history"
HISTSIZE=5000000
SAVEHIST=5000000

setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Prevent brew auto update
HOMEBREW_NO_AUTO_UPDATE=1

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/zsh/shortcutrc" ] && source "$HOME/.config/zsh/shortcutrc"
[ -f "$HOME/.config/zsh/aliasrc" ] && source "$HOME/.config/zsh/aliasrc"

[ -f "$HOME/.config/zsh/.zshenv" ] && source "$HOME/.config/zsh/.zshenv"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Swap capslock and escape if running gnome
if type "gsettings" > /dev/null; then
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"
fi