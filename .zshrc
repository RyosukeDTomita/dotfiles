#------------added by tomita------------
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# append to history file no overwrite
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt EXTENDED_HISTORY

# ignore duplicate history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# ignore blank line history
setopt HIST_IGNORE_SPACE

PATH=$PATH":/home/tomita/bash"
CDPATH=:/home/tomita/memo/
alias ls='ls --color=auto -F'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias matrix='cmatrix -abs'
alias rm='rm -iv'
alias mv='mv -iv'
alias cp='cp -iv'
alias open='xdg-open'
alias screenshot='gnome-screenshot'
alias lock="xdg-screensaver lock"
alias lhS='ls -lhS'
alias lsl='clear && ls'
alias upower='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
#alias dd='echo "dd is not available"'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias chrome='google-chrome-stable > /dev/null 2>&1 &'
alias firefox='firefox > /dev/null 2>&1 &'
alias discord='discord > /dev/null 2>&1 &'
#alias vim='source /home/tomita/bash/vim'
alias vim='nvim'
alias cd='cd '
alias dl='/home/tomita/Downloads'
alias gs='git status'
alias gb='git branch'
alias mkprg='mkprg.bash'
alias fc='fc -e'
alias winekd='wine ~/app/kindle-for-pc-1-17-44183.exe'
alias vpngate='cd ~/app/vpngate-with-proxy && ./run tui && cd -'
alias torb='cd ~/app/tor_browser && ./start-tor-browser.desktop'
alias vchanger='sox -d -d pitch -700 contrast 100 echo 0.8 0.88 6 0.4 '
alias goldendict='goldendict > /dev/null 2>&1 &'
alias veracrypt='veracrypt > /dev/null 2>&1 &'
alias xsel='xsel -bi'
alias ipython='ipython3'
alias ipython3='ipython3 --TerminalInteractiveShell.editing_mode=vi'
alias unmount='fusermount -u'
alias du='du -h'
alias ping='ping -t 128'
alias redmine='cd /usr/local/bin/redmine-4.2.8 && bundle exec rails server webrick -e production > /dev/null 2>&1 &'


# rm -rf -i
function rm() {
        DIR=$(eval echo '$'$#)
        OPTION=${@%*$DIR}
    if [[ $OPTION =~ r && $OPTION =~ f ]]; then
        echo "rm -rf: remove directory $DIR? [y,n]"
        read judge
        case "$judge" in
            "y")
                :
                ;;
            ?)
                return 0
                ;;
        esac
    fi
    command rm $@
} # end function rm


# command line edit mode vi
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
# ctrl r https://github.com/ohmyzsh/ohmyzsh/issues/5213
bindkey '^r' history-incremental-search-backward


# vi mode status https://zenn.dev/nabezokodaikon/articles/41b92074b2e22f
RESET='%f'            # リセット
YELLOW='%F{yellow}'
GREEN='%F{green}'     # 緑
BLUE='%F{blue}'       # 青
BOLD='%B'
#PROMPT_INS="${debian_chroot:+($debian_chroot)}${BOLD}${GREEN}%n@%m${RESET}${YELLOW}[INS]${RESET}:${BLUE}%~${RESET}$ "
PROMPT_INS="${debian_chroot:+($debian_chroot)}${GREEN}%n@%m${RESET}${YELLOW}[INS]${RESET}:${BLUE}%~${RESET}$ "
PROMPT_NOR="${debian_chroot:+($debian_chroot)}${GREEN}%n@%m${RESET}${YELLOW}[NOR]${RESET}:${BLUE}%~${RESET}$ "
PROMPT_VIS="${debian_chroot:+($debian_chroot)}${GREEN}%n@%m${RESET}${YELLOW}[VIS]${RESET}:${BLUE}%~${RESET}$ "


function zle-line-pre-redraw {
    if [[ $REGION_ACTIVE -ne 0 ]]; then
        NEW_PROMPT=$PROMPT_VIS
    elif [[ $KEYMAP = vicmd ]]; then
        NEW_PROMPT=$PROMPT_NOR
    elif [[ $KEYMAP = main ]]; then
        NEW_PROMPT=$PROMPT_INS
    fi

    if [[ $PROMPT = $NEW_PROMPT ]]; then
        return
    fi

    PROMPT=$NEW_PROMPT

    zle reset-prompt
}

function zle-keymap-select zle-line-init {
    case $KEYMAP in
        vicmd)
            PROMPT=$PROMPT_NOR
            ;;
        main|viins)
            PROMPT=$PROMPT_INS
            ;;
    esac

    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-pre-redraw


# convert caps ctrl
setxkbmap -model jp106 -layout jp -option ctrl:nocaps


# Ranger
export VISUAL=vim;
export EDITOR=vim;


# gh tab completion
eval "$(gh completion -s zsh)"


# tor
#export http_proxy=socks5://127.0.0.1:9050
#export https_proxy=$http_proxy
#export ftp_proxy=$http_proxy
#export rsync_proxy=$http_proxy
#export HTTP_PROXY=$http_proxy
#export HTTPS_PROXY=$http_proxy
#export FTP_PROXY=$http_proxy
#export RSYNC_PROXY=$http_proxy


# java
export JAVA_HOME=/usr/lib/jvm/jdk-11.0.15/


# SSL decode for Wireshark
export SSLKEYLOGFILE=/home/tomita/ssl-key.log


# rbenv
PATH=$PATH":$HOME/.rbenv/bin"


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# go lang
PATH=$PATH":/usr/local/go/bin"


# aqua
PATH=$PATH":$(aqua root-dir)/bin"


# tmp
alias openbook='open ~/bookshelf/english/english_grammar_in_use_intermediate_2019_5th-ed.pdf'


# pyenv
export PYENV_ROOT="~/.pyenv"
if [[ -d $PYENV_ROOT/bin ]]; then
  PATH=$PATH":$PYENV_ROOT/bin"
  eval "$(pyenv init -)"
fi


# aws
alias as='aws sts get-caller-identity'
# NOTE: zsh cannot use complete directory.
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws
