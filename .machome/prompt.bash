#!/bin/bash

#
# Sets up a colorized prompt that looks like this
#    user@host:current_dir(gitbranch modstatus)$
#
#
source ~/.machome/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE="1"
export PS1='\[\033]0;\u@\h \007\]\[\e[1;32m\]\u@\h:\[\e[1;36m\]\w\[\033[31m\]$(__git_ps1 "(%s)")\[\e[0m\]$ '
# for an explanation of PS1:
# http://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html
# and its colors: http://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagacad
# directory: cyan (Gx)
# symbolic link: magenta (Fx)
# socket: bold green (Cx)
# pipe: yellow (Dx)
# executable: bold red (Bx)
# block device: blue on cyan (eg)
# character device: blue on brown/yellow (ed)
# executable with setuid set: black on red (ab)
# executable with setguid set: black on cyan (ag)
# directory writeable by others, with sticky: black on green (ac)
# directory writeable by others, no sticky bit: black on brown/yellow (ad) 
export TERM=xterm-color

# set the title bar to include hostname and user
host=`hostname -s`
user=`whoami`
printf "\e]0;${user}@${host}\a";
