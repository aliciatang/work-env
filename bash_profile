#! /bin/bash

source /Users/xtang/Scode/work-env/git-prompt.sh
source /Users/xtang/Scode/work-env/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\] \$ '

source ~/Scode/work-env/ls-colors.mac
source ~/Scode/work-env/alias
