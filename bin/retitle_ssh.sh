#!/bin/sh
host=$1 #`hostname -s`
export PS1='\[\033]0;${host} \007\]\[\e[1;33m\]\u@\h:\[\e[1;36m\]\w\[\e[0m\]$ '
/usr/bin/ssh $@ 
host=`hostname -s`




