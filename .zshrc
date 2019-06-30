
# use dir name to change dir directly
setopt AUTO_CD

setopt no_nomatch

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# User configuration

# zplug part
# visit https://github.com/unixorn/awesome-zsh-plugins
##################################################

export ZPLUG=/usr/local/opt/zplug
source $ZPLUG/init.zsh

zplug "lib/*", from:oh-my-zsh
zplug "plugins/git",		from:oh-my-zsh
zplug "plugins/vi-mode",		from:oh-my-zsh
zplug "plugins/osx",		from:oh-my-zsh
zplug "plugins/sublime",		from:oh-my-zsh
#zplug "plugins/correction",		from:oh-my-zsh
zplug "b4b4r07/enhancd",		use:init.sh
zplug "mollifier/anyframe"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
#zplug "zsh-users/zsh-autosuggestions"
#zplug "zsh-users/zsh-completions"
zplug 'dracula/zsh',		as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load 

# remove repositories which are no longer managed
zplug clean

export PATH=$HOME/.zplug/bin:$PATH

# zplug end
##################################################

# env varible for enhancd plugin
export ENHANCD_FILTER=fzf:fzy

# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH=$PATH:/usr/local/aria2/bin/:/Users/daipei/Workshop/Shell/
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Theos configuration
export THEOS=/opt/theos
export PATH=$THEOS/bin:$PATH

# my shadowsocks server ip
export VPS="47.244.243.77"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PATH=/Users/daipei/development/flutter/bin:$PATH

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


# key map start here

# key map up and down for zsh-history-substring-search
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# key map end here

# alias start here
##################################################

alias czsh="vim ~/.zshrc"
alias cvim="vim ~/.vimrc"
alias cign="vim .gitignore"
alias cssh="vim ~/.ssh/config"

alias o="open ."

alias h="~"

# the vim install by brew is preferred
if [ -x /usr/local/bin/vim ]
then
		alias vim="/usr/local/bin/vim"
else
		alias vim="/usr/bin/vim"
fi

# check ip address quickly
alias ip="curl https://ip.sb"

# musicbox alias
alias mb="musicbox"

# mentohust alias
alias mh="_ mentohust"

# search in current dir
alias s="find . | grep "

# use icdiff with git
alias gid="git icdiff"

# source .zshrc quickly
alias upzsh="source ~/.zshrc"

# alias stop here
##################################################

bindkey -v


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

eval $(thefuck --alias)

# http proxy configure script
function proxy() {
	export all_proxy=http://localhost:1087
	curl ip.sb
}

function gitproxy() {
	git config --global http.proxy 'socks5h://localhost:1086'
}

function gitunproxy() {
	git config --global --unset http.proxy
}

function unproxy() {
	unset all_proxy
	curl ip.sb
}

# keybinding for anyframe
bindkey '^xb' anyframe-widget-cdr
bindkey '^x^b' anyframe-widget-checkout-git-branch

bindkey '^xr' anyframe-widget-execute-history
bindkey '^x^r' anyframe-widget-execute-history

bindkey '^xi' anyframe-widget-put-history
bindkey '^x^i' anyframe-widget-put-history

bindkey '^xg' anyframe-widget-cd-ghq-repository
bindkey '^x^g' anyframe-widget-cd-ghq-repository

bindkey '^xk' anyframe-widget-kill
bindkey '^x^k' anyframe-widget-kill

bindkey '^xe' anyframe-widget-insert-git-branch
bindkey '^x^e' anyframe-widget-insert-git-branch

