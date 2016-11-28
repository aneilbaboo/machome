

if [ -f "`gem which lunchy 2>/dev/null`" ]; then
    LUNCHY_DIR=$(dirname `gem which lunchy 2>/dev/null`)
    if [ -f $LUNCHY_DIR/lunchy-completion.bash ]; then
        . $LUNCHY_DIR/lunchy-completion.bash
    fi
fi

