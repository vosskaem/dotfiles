#!/bin/sh
VERSION=atuin-x86_64-unknown-linux-gnu
ARCHIVE=${VERSION}.tar.gz
rm -Rf ${VERSION}*
echo $ARCHIVE
curl -sSfLO https://github.com/atuinsh/atuin/releases/latest/download/$ARCHIVE
tar xvzf $ARCHIVE
cp $VERSION/atuin /usr/local/bin/
curl -sSfLo /usr/local/share/bash-preexec.sh https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh

