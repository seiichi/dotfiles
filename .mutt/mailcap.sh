#!/bin/sh

UNAME=`uname`
case $UNAME in
Darwin)
  echo "set mailcap_path = ~/.mutt/mailcap-osx"
  ;;
Linux)
  ;;
*)
  ;;
esac


