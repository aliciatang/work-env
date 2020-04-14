#! /bin/bash

source ~/Scode/work-env/git-prompt.sh
source ~/Scode/work-env/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
export GREP_OPTIONS='--color=always'
export PS1='\[\033[01;32m\]\h:\[\033[01;34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\] \$ '

source ~/Scode/work-env/alias
# source ~/Scode/work-env/ls-colors.redhat
# source ~/bash_completion.d/gradle-completion.bash
#source ~/.bashrc

JDK_HOME="/export/apps/jdk/JDK_1_8_0_72"
JAVA_HOME="/export/apps/jdk/JDK_1_8_0_72"
