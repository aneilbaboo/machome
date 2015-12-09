source ~/bin/git-completion.bash
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
export EDITOR=emacs
export PATH="$PATH:/usr/local/bin:/usr/sbin:/bin:/sbin:/usr/bin:/usr/local/sbin"

# Change the default drag and drop delay time
defaults write -g NSDragAndDropTextDelay -int 100

export MANPATH=/usr/local/git/man:$MANPATH

alias ssh=~/bin/retitle_ssh.sh

# set the title bar to include hostname and user
host=`hostname -s`
user=`whoami`
printf "\e]0;${user}@${host}\a";

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
# export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PYTHONSTARTUP=~/.pythonrc.py

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

export PATH=${PATH}:~/bin

# GO Configuration
export GOROOT="/usr/local/go/"
export GOPATH="$HOME/go"
export PATH="${PATH}:${GOROOT}/bin"

#export CPP=cpp; export CC=clang; export CXX=clang++
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# POSTGRES CONFIG
export PGDATA=/usr/local/var/postgres/

# The next line enables bash completion for gcloud.
if [ -f "~/bin/google-cloud-sdk/completion.bash.inc" ]; then
    source ~/bin/google-cloud-sdk/completion.bash.inc
fi

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}


if [[ -x `which hub` ]]; then
    alias git=hub
fi 

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if [ -f "`gem which lunchy 2>/dev/null`" ]; then
    LUNCHY_DIR = $(dirname `gem which lunchy 2>/dev/null`)
    if [ -f $LUNCHY_DIR/lunchy-completion.bash ]; then
        . $LUNCHY_DIR/lunchy-completion.bash
    fi
fi

# enable aquamac command line
function aquamacs
{
    # Create the files as needed -- not as good as raw emacs, but acceptable
    for f in "$@"
    do
 	test -e $f || touch $f
    done
    open -a /Applications/Aquamacs.app "$@"
}

