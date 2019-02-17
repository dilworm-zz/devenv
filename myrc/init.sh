# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cls=clear
alias CLS=clear
alias fsk='ps aux |grep "skynet"|grep -v "grep"'
alias svnst='svn st'
alias svndf='svn diff '
alias svnsta='svn st|grep -E "M |C |A "'
alias rcli=redis-cli 
alias thefuck=fuck

echo 'gdi, have a nice day!'
if [ -e ~/.autojump/share/autojump/autojump.bash ]; then
    source ~/.autojump/share/autojump/autojump.bash
fi
if [ -e /usr/share/autojump/autojump.bash ]; then
    source /usr/share/autojump/autojump.bash
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH_LUACHECK=/usr/local/bin/luacheck/bin
export PATH="$PATH_LUACHECK:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
