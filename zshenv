############
# function #
############
function chpwd () {
    if [[ "$platform" == 'mac' ]]; then
        # autoenv like
        if [[ ! -z ${VIRTUAL_ENV+venv} ]]; then
            deactivate
        fi
        if [[ -d venv ]]; then
            . venv/bin/activate
        else
            pyenv shell ${PWD##*/}
        fi

        ls -G
    else
        if [[ ! -z ${VIRTUAL_ENV+venv} ]]; then
            deactivate
        fi
        if [[ -d venv ]]; then
            . venv/bin/activate
        fi

        ls
    fi
}
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
function mktags() {
    if [[ "$platform" == 'mac' ]]; then
        if brew ls --versions ctags > /dev/null; then
            CTAG=`brew --prefix`/bin/ctags
        else
            brew install ctags
            CTAG=`brew --prefix`/bin/ctags
        fi
    else
        CTAG=ctags
    fi

    case $1 in
        "python2")
            $CTAG -R --fields=+l --languages=python --python-kinds=-i -f ./tags . $(python -c 'import os,sys;print " ".join([x for x in sys.path if os.path.isdir(x)])')
            return 0
        ;;
        "python3")
            $CTAG  -R --fields=+l --languages=python --python-kinds=-i -f ./tags . $(python -c 'import os,sys;print(" ".join([x for x in sys.path if os.path.isdir(x)]))')
            return 0
        ;;
        *)
            echo "Not implemented error $1"
            return 1
        ;;
    esac
}

###########
# exports #
###########
export memo="$HOME/Documents/md"
export snip="$HOME/Documents/snip"
export me="$HOME/Documents/github/me"
export company="$HOME/Documents/github/company"
export post="$HOME/Documents/github/me/flask_blog/pages/posts"
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
alias vmore='vim -u ~/.vimrc.more -'

alias pstop="ps -e -o pcpu,cpu,nice,state,cputime,args | sort -rk1 | head"

