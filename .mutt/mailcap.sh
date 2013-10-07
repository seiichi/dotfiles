#!/bin/sh

UNAME=`uname`
case $UNAME in
Darwin)
  echo "set mailcap_path = ~/.mutt/mailcap-osx"
  ;;
*)
  if [ -f /etc/mailcap ] ; then
    echo "set mailcap_path = /etc/mailcap"
  fi
  ;;
esac
