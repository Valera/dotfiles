# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt appendhistory beep extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' matcher-list 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/vfedotov/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if [[ -x "`whence -p dircolors`" ]]; then
eval `dircolors`
    alias ls='ls -F --color=auto'
    alias grep='grep --color=auto'
else
    alias ls='ls -F'
fi

HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt incappendhistory 
setopt sharehistory
setopt extendedhistory

source ~/.zkbd/$TERM-${DISPLAY:-$VENDOR-$OSTYPE}
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char


[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char
bindkey "^X^X" push-line

# http://eax.me/zsh/

export RPROMPT='%~'

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
alias dh='dirs -v'
alias pd='popd'

autoload -U colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}

setopt prompt_subst
PROMPT='${vcs_info_msg_0_}%# '

zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%s %{$reset_color%}%r/%S%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%} %m%u%c%{$reset_color%} "
zstyle ':vcs_info:*' check-for-changes true

alias as='aptitude search'
alias ai='sudo aptitude install'
alias vim='vim -p'

torrents=/media/Torrents/torrents/

alias homegit='git --git-dir=$HOME/.homeconfig.git/ --work-tree=$HOME'
