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
    vim -c "set filetype=${1:-python}"
}
function memo() {
    vim "$memo/${1:-`today`}.md"
}
function snip() {
    vim "$snip/${1:-`ls -t $snip | head -n1`}"
}
function sg() {
    ls -lSr "${1:-.}" | awk '{print $8,$9,$5}' | uniq -c -f2 | head -n "${2:-10}"
}
function scr() {
    screencapture "$@" $scr/`current`.png
}

###########
# exports #
###########
export memo="$HOME/Documents/md"
export snip="$HOME/Documents/snip"
export me="$HOME/github/private"
export company="$HOME/github/company"
export post="$HOME/github/private/flask_blog/pages/posts"
export scr="$HOME/Desktop"

# DEFAULT --defaults-group-suffix ~/.my.cnf
# export MYSQL_GROUP_SUFFIX="_name"
#
# DEFAULT --profile ~/.aws/config
# export AWS_PROFILE="name"

#########
# alias #
#########
alias vi=vim
alias py=python

alias pstop="ps -e -o pcpu,cpu,nice,state,cputime,args | sort -rk1 | head"

