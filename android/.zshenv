function chpwd() { ls -tr }
function ipy() { ipython "$@" }
function today() { date +%Y%m%d }
function current() { date +%Y%m%d_%H%M%S }

bindkey -v
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
 eval "$(pyenv virtualenv-init -)"
 export PYENV_VERSION='venv'
fi

export documents="$HOME/Documents"
export post="$documents/github/flask_blog/pages/posts"
export jw="$documents/.jw"

alias vmore='vim -u ~/.vimrc.more -'
