#!/bin/sh
test -n "$HG_NODE" || exit 0
TIP=`hg tip --template '{node|short}'`
REV=`hg log -r $HG_NODE --template '{rev}'`
test -n "$REV" -a $REV -ne 0 || exit 0
PREV=`expr $REV - 1`
PARENT=`hg log -r $PREV --template '{node|short}'`
echo "diffstat for $PARENT to $TIP" 1>&2
hg diff -r $PARENT -r tip | diffstat 1>&2
