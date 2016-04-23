#!/bin/bash
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualevn
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
echo "$SHELL"
