export PATH=~/.machome/bin:~/bin:/usr/local/bin:$PATH
export EDITOR=emacs
export PYTHONSTARTUP=~/.pythonrc.py

source ~/bin/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

export NVM_AUTO_USE=true
antigen bundle lukechilds/zsh-nvm
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle command-not-found
antigen bundle node
antigen bundle rvm
antigen bundle npm
antigen bundle osx
antigen bundle jsontools
antigen bundle rummik/zsh-dokku

# Fish-like bundle
antigen bundle zsh-users/fizsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle tarruda/zsh-autosuggestions

# Set Theme
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship
ZSH_THEME="spaceship"
SPACESHIP_DIR_TRUNC=2
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_GIT_SYMBOL=""
SPACESHIP_GIT_PREFIX="("
SPACESHIP_GIT_SUFFIX=") "
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_PROMPT_ORDER=(
  time
  user
  host
  dir
  git
  hg
  package
  node
  ruby
  elixir
  xcode
  swift
  golang
  php
  rust
  julia
  docker
  venv
  pyenv
  dotnet
  ember
  exec_time
  # line_sep
  vi_mode
  jobs
  exit_code
  char
)

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Tell Antigen that you're done.
antigen apply


#######
####### Other options
#######

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

