#!/bin/bash
# github.com/yyuu/pyenv
# Change bashrc to your own shell option file
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc  # make sure this write to the end of shell configurea file
exec $SHELL
