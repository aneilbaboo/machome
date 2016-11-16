export EDITOR=emacs
export PATH="$PATH:/usr/local/bin:/usr/sbin:/bin:/sbin:/usr/bin:/usr/local/sbin"
export PATH=${PATH}:~/bin
export MANPATH=/usr/local/git/man:$MANPATH


export PYTHONSTARTUP=~/.pythonrc.py # add readline capabilities to python commandline interpreter
export PGDATA=/usr/local/var/postgres/

source ~/.machome/prompt.bash
source ~/.machome/machelp.bash
source ~/.machome/goconfig.bash
source ~/.machome/googlecloud.bash
source ~/.machome/rvm.bash
source ~/.machome/lunchy.bash
source ~/.machome/aquamacs.bash
source ~/.machome/colorman.bash
source ~/.machome/rails.bash
source ~/.machome/sshprompt.bash
source ~/.machome/bundler_bash_completion.bash

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

