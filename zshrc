fpath=(~/.zsh $fpath)
autoload -U colors && colors
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_HIDE_IF_PWD_IGNORED=true
source ~/.zsh/git-prompt.sh
precmd () { __git_ps1 "$fg[green]%m$fg[white]:$fg[blue]%~$reset_color" ">" "(%s)" }
path+=/usr/local/sbin
path+=/export/content/linkedin/bin/
source ~/Scode/work-env/ls-colors.mac
source ~/Scode/work-env/alias
 
