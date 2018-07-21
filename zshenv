# platform
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='mac'
fi

# pyenv
if [[ $platform == 'mac' ]]; then
    eval "$(pyenv init -)"
    export PYENV_VERSION='gvenv'

    alias vim='mvim -v'
    alias vi=vim
fi

############
# function #
############
function ipy () {
    if [[ "$platform" == 'mac' ]]; then
        MPLBACKEND="module://itermplot" ITERMPLOT=rv ipython "$@"
    else
        ipython "$@"
    fi
}
function suipy () {
    sudo sh -c "ipython $@"
}
function chpwd () { ls }
function gbsize () {
	ls -lSr "$1" | awk '{ printf "%s %s %s\n", $8, $9, $5 }' | uniq -c -f 2 | head -n "$2" | sed '1d'
}
function today () {
	date +%Y%m%d
}
function current() {
    date +%Y%m%d_%H%M%S
}
function posting() {
    file=`date +%Y-%m-%d_$1`
    if [ ! -f $post/$file.md ]; then
        echo "date: `date +%Y-%m-%d\ %H:%M:%S`" >> $post/$file.md
        echo "layout: post" >> $post/$file.md
        echo "title: $1" >> $post/$file.md
        echo "tags: " >> $post/$file.md
    fi
    vim $post/$file.md
}
function temp() {
    if [ $# -eq 0 ]; then
        args='python'
    else
        args=$1
    fi
    vim -c "set filetype=$args"
}
function memo() {
    if [ $# -eq 0 ]; then
        filename="`today`.md"
    else
        filename="$1.md"
    fi
    vim "$memo/$filename.md"
}
function snip() {
    if [ $# -eq 0 ]; then
        filename=`ls -t $snip | head -n 1`
    else
        filename=$1
    fi
    vim "$snip/$filename"
}

###########
# exports #
###########
export memo="$HOME/Documents/md"
export snip="$HOME/Documents/snip"
export me="$HOME/github/private"
export company="$HOME/github/company"
export post="$HOME/github/private/flask_blog/pages/posts"

# DEFAULT --defaults-group-suffix
# export MYSQL_GROUP_SUFFIX="_name"
#
# DEFAULT --profile AWS
# export AWS_PROFILE="name"

#########
# alias #
#########

# Application alias
alias vi=vim

# Bookmark
alias pstop="ps -e -o pcpu,cpu,nice,state,cputime,args | sort -rk1 | head"

