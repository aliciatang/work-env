#! /bin/bash

# use bash completion for git.
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

source /Users/xtang/Scode/work-env/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\] \$ '

source ~/Scode/work-env/ls-colors.mac
