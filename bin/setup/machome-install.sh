#!/bin/bash

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

echo "
Finished installing machome.  Please restart your terminal."
