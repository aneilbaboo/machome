if [ -f `which complete_bundle_bash_command` ] && [ "`gem list -i bundler_bash_completion`" == "true" ]; then
    eval "$(complete_bundle_bash_command init)"
fi

