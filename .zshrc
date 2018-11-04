
# use dir name to change dir directly
setopt AUTO_CD

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
####################################################################################################
export ZPLUG=/usr/local/opt/zplug
source $ZPLUG/init.zsh

zplug "lib/*", from:oh-my-zsh
zplug "plugins/git",		from:oh-my-zsh
zplug "plugins/vi-mode",		from:oh-my-zsh
zplug "plugins/osx",		from:oh-my-zsh
zplug "plugins/sublime",		from:oh-my-zsh
zplug "plugins/correction",		from:oh-my-zsh
zplug "b4b4r07/enhancd",		use:init.sh
zplug "mollifier/anyframe"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
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

####################################################################################################
# zplug end

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
export VPS="138.68.227.123"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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

alias czsh="vim ~/.zshrc"
alias cvim="vim ~/.vimrc"
alias cign="vim .gitignore"

alias o="open ."

alias h="~"

# use the vim 8.0
# alias vim="/usr/local/bin/vim"
# alias vim="/usr/bin/vim"

# use the latest emacs
alias emacs="/usr/local/Cellar/emacs/25.2/Emacs.app/Contents/MacOS/Emacs -nw"

# check ip address quickly
alias ip="curl ip.cn"

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

alias j="autojump"

# alias stop here

bindkey -v

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
# export COCOS_CONSOLE_ROOT=/usr/local/software/Cocos2d-x/cocos2d-x-3.13.1/tools/cocos2d-console/bin
# export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
# export COCOS_X_ROOT=/usr/local/software/Cocos2d-x/
# export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
# export COCOS_TEMPLATES_ROOT=/usr/local/software/Cocos2d-x/cocos2d-x-3.13.1/templates
# export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
# export COCOS_CONSOLE_ROOT=/Users/daipei/Workshop/Clone/cocos2d-x-samples/libs/cocos2d-x/tools/cocos2d-console/bin
# export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
# export COCOS_TEMPLATES_ROOT=/Users/daipei/Workshop/Clone/cocos2d-x-samples/libs/cocos2d-x/templates
# export PATH=$COCOS_TEMPLATES_ROOT:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

eval $(thefuck --alias)

# http proxy configure script
function cw() {
		if [ "$http_proxy" = "" ]
		then
				# I don't neet polipo anymore, because next generation shadowsocks have http proxy
				# launchctl load ~/Library/LaunchAgents/homebrew.mxcl.polipo.plist
				export http_proxy=http://localhost:1090
				export https_proxy=http://localhost:1090
				export ftp_proxy=http://localhost:1090
		else
				# launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.polipo.plist
				export http_proxy=""
				export https_proxy=""
				export ftp_proxy=""
		fi
		curl ip.cn &
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

