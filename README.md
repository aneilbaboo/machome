# About

Customizes your mac bash shell, adding git and bundler auto-completion, prompt
coloring, emacs plugins, python autocomplete, and several other
features.

Following the setup puts two directories in your home directory:

* ~/.machome - contains files required for .bash_profile
* ~/bin - useful scripts available on the path

# Setup

## Clone machome to home directory

```shell
cd ~
git init && git remote add origin git@github.com:aneilbaboo/machome && git fetch && git checkout master
```

### If you have trouble with cloning machome...
Note: you may need to remove some files and directories for this to work:

Carefully read the following before executing it!
```shell
rm ~/.git
rm ~/.gitignore
rm ~/.gitmodules
rm -frd ~/.machome
rm -frd ~/bin
rm ~/README.md
```

## Install machome 

```shell
source ~/.machome/install.bash
```


