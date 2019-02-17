#!/bin/bash
set -e

localpath=~/.local/gdi/config

if [ ! -d $localpath ]; then
    mkdir -p $localpath
fi

cp .bashrc .vimrc .tmux -t $localpath
echo "source ${localpath}/.bashrc" >> ~/.bashrc

echo "$0 done!"
