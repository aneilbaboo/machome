if [ -f /Applications/Emacs.app/Contents/MacOS/Emacs ]; then
    alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
else
    echo "DID NOT DETECT EMACS"
fi
