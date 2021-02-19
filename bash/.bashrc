#vim: filetype=conf :
#!/bin/bash
#export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]localhost \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
umask 0027
shopt -s autocd
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
bind -m vi-command 'Control-k: kill-whole-line'
bind -m vi-insert 'Control-k: kill-whole-line'
bind -m vi-insert '"\ed": "tm\n"'
bind "\C-f: 'vifmrun . \r'"

source "$HOME/.config/bash/exports"
source "$HOME/.config/bash/functions"
source "$HOME/.config/bash/aliases"
# If we're using tmux, hide the status bar
[ ! $TMUX = "" ] && alias vim="nvim +\"call ToggleHiddenAll()\""

# Node user directory
[ ! -d "$HOME/.node/lib" ] && mkdir -p "$HOME/.node/lib"

if [ "$TERM" != "linux" ]; then
    source ~/.config/bin-config/pureline/pureline ~/.config/bin-config/pureline/pureline.conf
fi
