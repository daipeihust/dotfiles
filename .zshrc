# zplug part
export ZPLUG=/usr/local/opt/zplug
source $ZPLUG/init.zsh

zplug "plugins/git",		from:oh-my-zsh
zplug "plugins/osx",		from:oh-my-zsh
zplug "plugins/rake",		from:oh-my-zsh
zplug "plugins/bundler",		from:oh-my-zsh
zplug "plugins/dotenv",		from:oh-my-zsh
zplug "plugins/d",		from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "plugins/correction",		from:oh-my-zsh
zplug "b4b4r07/enhancd",		use:init.sh
zplug "zsh-users/zsh-syntax-highlighting",	defer:2
zplug 'dracula/zsh',		as:theme
# Then, source plugins and add commands to $PATH
zplug load 

# env varible for enhancd plugin
export ENHANCD_FILTER=fzf

setopt AUTO_CD

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="takashiyoshida"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions svn osx autojump colored-man-pages) 

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias czsh="vim ~/.zshrc"
alias cvim="vim ~/.vimrc"

alias o="open ."

# use the vim 8.0
# alias vim="/usr/local/bin/vim"
alias vim="/usr/bin/vim"

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

# pm alias
alias go="pm go"

# source .zshrc quickly
alias upzsh="source ~/.zshrc"

alias j="autojump"

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


# PM functions
source ~/.pm/pm.zsh
alias pma="pm add"
alias pmg="pm go"
alias pmrm="pm remove"
alias pml="pm list"
# end PM
