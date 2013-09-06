#!/bin/sh

if [ "x$TERM" = xdumb -o "x$TERM" = xlinux ] ; then
  colors_muttrc=mutt-colors-solarized/mutt-colors-solarized-dark-16.muttrc
else
  colors_muttrc=mutt-colors-solarized/mutt-colors-solarized-dark-256.muttrc
fi

echo source ~/.mutt/$colors_muttrc
