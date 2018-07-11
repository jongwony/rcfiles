# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Python interactive console autocompletion
# export PYTHONSTARTUP=/Users/jongwon/github/private/personal/myCloud/snippet/Sierra/.pythonrc

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# fpath=(/usr/local/share/zsh-completions $fpath)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#    export EDITOR='vim'
# else
#    export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# vim mode zsh
bindkey -v

PROMPT='%{$fg_bold[white]%}%D{%H:%M:%S}%{$reset_color%} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)${ret_status}%{$reset_color%}'

# activate global virtualenv
if [ -e ~/gvenv/bin/activate ]; then
    . ~/gvenv/bin/activate;
fi

############
# function #
############
function ipy () {
	if [ -e ~/gvenv/bin/activate ]; then
		. ~/gvenv/bin/activate;
	fi
	MPLBACKEND="module://itermplot" ITERMPLOT=rv ipython "$@"
}
function suipy () {
    sudo sh -c '. ~/gvenv/bin/activate; ipython "$@"'
}
function chpwd () { ls }
function mysqlq () { mysql -udev_master -hdev-mysql.ckpqcnrgsdmm.ap-northeast-2.rds.amazonaws.com -P3306 -p --local-infile --show-warnings -- "$1" }
function mysql2csv () { mysql -udev_master -hdev-mysql.ckpqcnrgsdmm.ap-northeast-2.rds.amazonaws.com -P3306 -p -B --database="$1" --execute="$2" --default-character-set='utf8' --delimiter='|' > "$3"}
function gbsize () {
	ls -lSr "$1" | awk '{ printf "%s %s %s\n", $8, $9, $5 }' | uniq -c -f 2 | head -n "$2" | sed '1d'
}
function today () {
	date +%Y%m%d
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###########
# exports #
###########
# export MPLBACKEND="TkAgg"
export PATH=$PATH:$HOME/.local/bin
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
export REPORTTIME=0
export memo="$HOME/Documents/md"
export snip="$HOME/Documents/snip"
export my="$HOME/github/private"
export company="$HOME/github/company"

#########
# alias #
#########

# Application alias
alias vi=vim
alias memo="vim $MEMO/`today`.md"

# Bookmark
alias pstop="ps -e -o pcpu,cpu,nice,state,cputime,args | sort -rk1 | head"

