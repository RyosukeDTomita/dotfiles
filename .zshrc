# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="essembeh"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vi-mode
)

source $ZSH/oh-my-zsh.sh
PROMPT="$PROMPT\$(vi_mode_prompt_info)"
RPROMPT="\$(vi_mode_prompt_info)$RPROMPT"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#----------added by sigma----------
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


# Ctrl r https://github.com/ohmyzsh/ohmyzsh/issues/5213
bindkey '^r' history-incremental-search-backward


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


# settings for command line edit mode vi
# NOTE: oh-my-zshのvi-mode pluginが全部よしなにやってくれるのでarchiveする。https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode
#bindkey -v # bash set -o vi
#bindkey '^P' up-history # emacs Ctrl p
#bindkey '^N' down-history # emacs Ctrl n
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
#bindkey '^A' vi-beginning-of-line # emacs Ctrl A
# Ctrl r https://github.com/ohmyzsh/ohmyzsh/issues/5213
#bindkey '^r' history-incremental-search-backward


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

