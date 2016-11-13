# Setup

## Clone machoem to home directory

```
git init && git remote add origin git@github.com:aneilbaboo/machome && git fetch && git checkout master
```
Note: the following files and directories must not exist for this to work:
* .git
* .emacs

## Add the following line to ~/.bash_profile
```
source ~/.machome/all.bash
```
