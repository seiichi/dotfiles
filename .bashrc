# if not running interactively, don't do anything
if [ -z "$PS1" ]; then
  return
fi

[ -f ~/.bash/bashrc ] && . ~/.bash/bashrc
