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

touch ~/.emacs
if [ -z "`grep '(load "~/.machome/emacs.el")' ~/.emacs`" ]; then
    echo "Adding ~/.machome/emacs.el to ~/.emacs"
    echo '
(load "~/.machome/emacs.el")
' >> ~/.emacs
fi

touch ~/.bash_profile
if [ -z "`grep 'source ~/.machome' ~/.bash_profile`" ]; then
    echo "
Adding machome to .bash_profile"
    echo "
source ~/.machome/all.bash
" >> ~/.bash_profile
fi

echo "
Finished installing machome.  Please restart your terminal."
