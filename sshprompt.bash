# Changes the color of the prompt when sshing into a different server 
ssh () {
    host=$1 
    saved_PS1=${PS1}
    export PS1='\[\033]0;${host} \007\]\[\e[1;33m\]\u@\h:\[\e[1;36m\]\w\[\e[0m\]$ '
    /usr/bin/ssh $@ 
    host=`hostname -s`
    export PS1=${saved_PS1}
}
