#.pythonrc.py
try:
    import readline
except ImportError:
    print("Module readline not available.")
else:
    import rlcompleter
    if 'libedit' in readline.__doc__:
        readline.parse_and_bind("bind -e")
        readline.parse_and_bind("bind ^I rl_complete")
    else:
        readline.parse_and_bind("^I: complete")
