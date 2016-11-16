#!/bin/bash

if [ "$0" != "-bash" ]; then
    echo "Please run this command instead:"
    echo "  source ~/.machome/install.bash"
    exit -1
fi

source ~/.machome/all.bash

cd ~

if [ -z "`which brew`" ]; then
    echo "
Installing brew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ -z "`which rvm`" ]; then
    echo "
Installing rvm"    
    \curl -sSL https://get.rvm.io | bash -s stable --ruby
    cp ~/.machome/rvm_hooks/* ~/.rvm/hooks/
fi

if [ -z "`which hub`" ]; then
    echo "
Installing hub - helps you win at git"
    brew install hub
fi

if [ -z "`which complete_bundle_bash_command`" ]; then
    echo "
Installing bash bundler completion"
    gem install bundler_bash_completion
fi


if [ -z "`grep -s '~/.machome/emacs.el' ~/.emacs`" ]; then
    echo "Adding ~/.machome/emacs.el to ~/.emacs"
    cat << EOF >> ~/.emacs
(load "~/.machome/emacs.el")
EOF
fi


if [ -z "`grep -s .machome/pythonrc.py ~/.pythonrc.py`" ]; then
    echo "Adding .machome/pythonrc.py to ~/.pythonrc.py"
    cat << EOF >> ~/.pythonrc.py
import imp
imp.load_source("pythonrc", ".machome/pythonrc.py")
EOF
fi

if [ -z "`grep -s 'source ~/.machome' ~/.bash_profile`" ]; then
    echo "Adding machome to .bash_profile"
    cat << EOF >> ~/.bash_profile
source ~/.machome/all.bash
EOF
fi

if [ -d ~/.git ]; then
    machome unedit
fi

echo "
Machome is ready.  Modifications have been made to your bash environment:
  * Bash prompt coloring
  * git autocompletion
  * bundler autocompletion
  * Scripts in ~/bin are on the PATH
  * Several emacs plugins in .machome/emacs.el and .machome/emacs/
  * Python autocompletion (see .pythonrc.py)

Please restart your other terminal windows.
"
