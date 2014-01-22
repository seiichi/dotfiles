[ -f ~/.bash/bashrc ] && . ~/.bash/bashrc

hostname=`hostname`
if [ "x$hostname" = xtb303 ] ; then
  if [ "x$TMUX" = x ] ; then
    ssh-agent tmux
  else
     ssh-add -l > /dev/null || ssh-add
  fi
fi
