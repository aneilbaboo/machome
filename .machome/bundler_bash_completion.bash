if [ ! -f `which complete_bundle_bash_command` ]; then
    echo "Bundler bash completion not installed"
    echo "Please run: gem install bundler_bash_completion"
    echo "            or ~/.machome/setup.sh"
fi
eval "$(complete_bundle_bash_command init)"
