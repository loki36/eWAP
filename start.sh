#!/bin/sh
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=`readlink -f $0`
# Absolute path this script is in, thus /home/user/bin
rootpath=`dirname $SCRIPT`

. "$rootpath"/config/configue.ini

if [ "$WEBAPPPATH" != "" ]
then
 WEBAPPPATH="$rootpath/$WEBAPPPATH"
fi

if [ "$ROUTER" != "" ]
then
 ROUTER="$rootpath/$ROUTER"
fi

if [ "$(arch)" = "x86_64" ]
then
  PHPLINUXVERSION=$PHPLINUXVERSION64
else
  PHPLINUXVERSION=$PHPLINUXVERSION32
fi

cd $WEBAPPPATH
"$rootpath"/external_source/$PHPLINUXVERSION/php -S $HOST:$PORT $ROUTER &
TASK=$!

cd $rootpath

echo TASK=$TASK> "$rootpath"/lock/pid.sh

xdg-open http://$HOST:$PORT
