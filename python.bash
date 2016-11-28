if [[ `type -p /usr/local/bin/virtualenvwrapper.sh` ]]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi
