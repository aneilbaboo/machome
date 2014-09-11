#!/bin/bash
source=$TMPDIR/machome
cd ~
git clone --recursive https://github.com/aneilbaboo/machome "$source"
cp -r --overwrite "$source" ~
mv .git .machome.git

