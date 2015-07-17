[ -f ~/.bash/bashrc ] && . ~/.bash/bashrc

hostname=`hostname`
if [ "x$hostname" = xmarlboro -o "x$hostname" = xcamel ] ; then
  if [ "x$TMUX" = x ] ; then
    ssh-agent tmux
  else
     ssh-add -l > /dev/null || ssh-add
  fi
fi
