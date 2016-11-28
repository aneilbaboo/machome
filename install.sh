set -e
echo "Trying to clone using SSH"

git clone git@github.com:aneilbaboo/machome.git ~/.machome
if [ $? -ne 0 ]; then
    echo "Cloning using HTTP"
    git clone https://github.com/aneilbaboo/machome.git ~/.machome
fi

echo "Moving to home directory"
cd ~

echo "Checking for homebrew..."
if [ -z "`which brew`" ]; then
    echo "
Installing brew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Homebrew already installed"
fi

echo "Checking for GPG..."
if [ "`which gpg`" != "" ]; then
    echo "Trusting rvm author Michal Papis <mpapis@gmail.com>"
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
fi

echo "Checking for RVM..."
if [ -z "`which rvm`" ]; then
    echo "
Installing rvm"    
    \curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

cp ~/.machome/rvm_hooks/* ~/.rvm/hooks/

source ~/.machome/pathadd.bash
source ~/.machome/rvm.bash

rvm use default
if [ $? -ne 0 ]; then
   echo "Installing a default rvm ruby version"
   ruby_version=`ruby --version | grep -o '[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}'`
   rvm install $ruby_version
   rvm --default use $ruby_version
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
from os import path
imp.load_source("pythonrc", path.join(path.expanduser("~"),".machome/pythonrc.py"))
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

source .machome/all.bash

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
