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

