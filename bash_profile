#! /bin/bash

source ~/Scode/work-env/git-prompt.sh
source ~/work-env/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\h:\w\[\033[31m\]$(__git_ps1)\[\033[00m\] \$ '
export GREP_OPTIONS='--color=always'

source ~/Scode/work-env/alias
source ~/Scode/work-env/ls-colors.redhat
