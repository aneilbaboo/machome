#!/bin/bash

cd ~

if [ ! -f `which brew` ]; then
    echo "Installing brew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ ! -f `which rvm` ]; then
    echo "Installing rvm"    
    \curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

if [ ! -f `which hub` ]; then
    echo "Installing hub - helps you win at git"
    brew install hub
fi

if [ ! -f `which complete_bundle_bash_command` ]; then
    echo "Installing bash bundler completion"
    gem install bundler_bash_completion
fi

if [ -z "`grep 'source ~/.machome' ~/.bash_profile`" ]; then
    echo "Adding .bash_profile"
    echo "
source ~/.machome/all.bash
" >> ~/.bash_profile
fi

