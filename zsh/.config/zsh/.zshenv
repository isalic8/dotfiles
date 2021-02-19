#!/bin/zsh

autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

export PATH=$PATH:/var/lib/snapd/snap/bin:$HOME/.node/bin:$HOME/.local/bin/:$(du "$HOME/.bin/" | cut -f2 | paste -sd ':'):~/.emacs.d/bin
export NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"
export JAVA_HOME=/opt/jdk
export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export PAGER="less"
export TERMINAL="st"
export BROWSER="firefox"
export BROWSERCLI="w3m"
export COLORTERM="truecolor"
export HISTSIZE="100000"
export HISTFILESIZE="100000"
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
[[ $TMUX = "" ]] && export TERM="xterm-256color"

#export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    #vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    #-c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    #-c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# Manpage colors
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# ~/ Cleanup
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export MPLAYER_HOME="$XDG_CONFIG_HOME/mplayer"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export OLDPWD="$HOME"
export ELINKS_CONFDIR="${XDG_CONFIG_HOME:-$HOME.config/elinks}"
export PASSWORD_STORE_DIR="$HOME/.password-store/"

export NOTES=$HOME/notes
export TEMPLATES=$HOME/.local/templates
export VIDEOS=/media/hdd/videos

export LF_ICONS="\
*.exe=:\
di=:\
fi=:\
ex=:\
tw=:\
ow=:\
ln=:\
or=:\
*.php=:\
*.bin=:\
*.txt=:\
*.mom=:\
*.me=:\
*.ms=:\
*.png=:\
*.webp=辶:\
*.webm=辶:\
*.ico=:\
*.jpg=:\
*.jpe=:\
*.jpeg=:\
*.gif=:\
*.svg=:\
*.tif=:\
*.tiff=:\
*.xcf=🖌 :\
*.html=:\
*.xml=:\
*.gpg=:\
*.css=:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=:\
*.r=:\
*.R=:\
*.rmd=:\
*.Rmd=:\
*.m=:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=辶:\
*.mkv=辶:\
*.mp4=辶:\
*.webm=辶:\
*.mpeg=辶:\
*.avi=辶:\
*.zip=:\
*.rar:\
*.7z=:\
*.tar.gz=:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.gba=🎮:\
*.nes=🎮:\
*.gdi=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=ℹ:\
*.iso=:\
*.img=:\
*.bib=🎓:\
*.ged=👪:\
*.part=PART:\
*.torrent= :\
*.jar=:\
*.java=:\
"
