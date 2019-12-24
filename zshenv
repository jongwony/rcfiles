############
# function #
############
function chpwd () {
    ls -G -t -r
}
function ipy () {
    MPLBACKEND="module://itermplot" ITERMPLOT=rv ipython "$@"
}
function suipy () {
    sudo sh -c "ipython $@"
}
function today () {
	date +%Y%m%d
}
function current() {
    date +%Y%m%d_%H%M%S
}
function temp() {
    vim -c "set filetype=${1:-python}"
}
function snip() {
    vim "$snip/${1:-`ls -t $snip | head -n1`}"
}
function sg() {
    ls -lSr "${1:-.}" | awk '{print $8,$9,$5}' | uniq -c -f2 | head -n "${2:-10}"
}

###########
# exports #
###########
export company="$HOME/github/company"
export me="$HOME/Documents/github/me"
export snip="$me/bio/files"
export post="$me/flask_blog/pages/posts"

# DEFAULT --defaults-group-suffix ~/.my.cnf
# export MYSQL_GROUP_SUFFIX="_name"
#
# DEFAULT --profile ~/.aws/config
# export AWS_PROFILE="name"

#########
# alias #
#########
alias vim='vim -v'
alias vi=vim
alias vmore='vim -u ~/.vimrc.more -'
alias gt='google_trans --clipboard'
alias pstop="ps -e -o pcpu,cpu,nice,state,cputime,args | sort -rk1 | head"
alias bio=biocli
