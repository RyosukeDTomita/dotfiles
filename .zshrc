#------------added by tomita------------
HISTFILE=~/.zsh_history
HISTSIZE=1000 #"現在のshellが使用できる履歴数
SAVEHIST=1000 #セッション終了時にHISTFILEに保存される履歴数
setopt APPEND_HISTORY # 複数のzshを開いている場合に最後の履歴だけがHISTFILE
setopt SHARE_HISTORY # 別のターミナルとの履歴も安全にHISTFILEに保存される。NOTE: デフォルトでは複数のターミナルを開いている場合には最後に閉じたターミナルの履歴が保存される。
setopt INC_APPEND_HISTORY # 即座にHISTFILEに追加
setopt HIST_IGNORE_SPACE # コマンドの先頭にSPACEを入れることでHISTFILEに保存されなくなる
setopt HIST_REDUCE_BLANKS # 無駄なSPACEを削除
setopt HIST_VERIFY # 履歴から選んだコマンドが即座に実行されなくなる
setopt EXTENDED_HISTORY # 実行時刻を記録する

# ignore duplicate history
#setopt HIST_IGNORE_DUPS # 直前に実行したコマンドと同じコマンドを履歴に追加しない
setopt HIST_IGNORE_ALL_DUPS # 既に履歴に存在するコマンドがサイド実行された時に履歴に追加しない
setopt HIST_FIND_NO_DUPS # Ctrl r使用時に重複コマンドを表示しない

# ignore blank line history
setopt HIST_IGNORE_SPACE

# sigma's alias
PATH=$PATH":/home/tomita/bash"
CDPATH=:/home/tomita/memo/ # cdのtab completionのsuggestに追加
alias cd='cd ' # cdの後にエイリアスを使えるようにする設定
alias ls='ls --color=auto -F'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias matrix='cmatrix -abs'
alias rm='rm -iv'
alias mv='mv -iv'
alias cp='cp -iv'
alias lhS='ls -lhS'
alias lsl='clear && ls'
alias dd='echo "dd is not available"'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias du='du -h'
if type vim > /dev/null 2>&1; then
  alias vim='nvim'
fi
alias xsel='xsel -bi'
alias ipython='ipython3'
alias ipython3='ipython3 --TerminalInteractiveShell.editing_mode=vi'
alias gs='git status'
alias gb='git branch'

# WSL or Ubuntu desktop
# NOTE: /proc/versionにmicrosoftが入っているかどうかでWSLか判定できる。
if grep -q microsoft /proc/version; then
  alias open='wsl-open'
else
  alias open='xdg-open'
fi

# settings for ubuntu desktop
alias screenshot='gnome-screenshot'
alias lock="xdg-screensaver lock"
alias upower='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias chrome='google-chrome-stable > /dev/null 2>&1 &'
alias firefox='firefox > /dev/null 2>&1 &'
alias discord='discord > /dev/null 2>&1 &'
alias dl='/home/tomita/Downloads'
alias fc='fc -e'
alias winekd='wine ~/app/kindle-for-pc-1-17-44183.exe'
alias vpngate='cd ~/app/vpngate-with-proxy && ./run tui && cd -'
alias torb='cd ~/app/tor_browser && ./start-tor-browser.desktop'
alias vchanger='sox -d -d pitch -700 contrast 100 echo 0.8 0.88 6 0.4 '
alias goldendict='goldendict > /dev/null 2>&1 &'
alias veracrypt='veracrypt > /dev/null 2>&1 &'
alias unmount='fusermount -u'
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


# settings for command line edit mode vi
bindkey -v # bash set -o vi
bindkey '^P' up-history # emacs Ctrl p
bindkey '^N' down-history # emacs Ctrl n
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^A' vi-beginning-of-line # emacs Ctrl A
# Ctrl r https://github.com/ohmyzsh/ohmyzsh/issues/5213
bindkey '^r' history-incremental-search-backward


# vi mode status https://zenn.dev/nabezokodaikon/articles/41b92074b2e22f
RESET='%f'            # リセット
YELLOW='%F{yellow}'
GREEN='%F{green}'     # 緑
BLUE='%F{blue}'       # 青
BOLD='%B'

#PROMPT_NOR="${debian_chroot:+($debian_chroot)}${GREEN}%n@%m${RESET}${YELLOW}[NOR]${RESET}:${BLUE}%~${RESET}$ "
PROMPT_NOR="${debian_chroot:+($debian_chroot)}${GREEN}sigma@%m${RESET}${YELLOW}[NOR]${RESET}:${BLUE}%~${RESET}$ "
PROMPT_INS=$(echo "$PROMPT_NOR" | sed 's/\[NOR\]/\[INS\]/')
PROMPT_VIS=$(echo "$PROMPT_NOR" | sed 's/\[NOR\]/\[VIS\]/')

function zle-line-pre-redraw {
  if [[ $REGION_ACTIVE -ne 0 ]]; then
    NEW_PROMPT=$PROMPT_VIS
  elif [[ $KEYMAP = vicmd ]]; then
    VI_MODE=NOR
    NEW_PROMPT=$PROMPT_NOR
  elif [[ $KEYMAP = main ]]; then
    VI_MODE=INS
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
if type setxkbmap > /dev/null 2>&1; then
  setxkbmap -model jp106 -layout jp -option ctrl:nocaps
fi


# default editor
export VISUAL=vim;
export EDITOR=vim;


# tor
#export http_proxy=socks5://127.0.0.1:9050
#export https_proxy=$http_proxy
#export ftp_proxy=$http_proxy
#export rsync_proxy=$http_proxy
#export HTTP_PROXY=$http_proxy
#export HTTPS_PROXY=$http_proxy
#export FTP_PROXY=$http_proxy
#export RSYNC_PROXY=$http_proxy


# pyenv
export PYENV_ROOT="$HOME/.pyenv"
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


# gh tab completion
# NOTE: compinitと干渉するのでcompinitよりも下に書く。
if type gh > /dev/null 2>&1; then
  eval "$(gh completion -s zsh)"
fi


# SSL decode for Wireshark
#export SSLKEYLOGFILE=/home/tomita/ssl-key.log


#-----add PATH-----
# java
export JAVA_HOME=/usr/lib/jvm/jdk-11.0.15/


# rbenv
PATH=$PATH":$HOME/.rbenv/bin"


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# go lang
PATH=$PATH":/usr/local/go/bin"


# aqua
PATH=$PATH":$(aqua root-dir)/bin"

