# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=`readlink -f $0`
# Absolute path this script is in, thus /home/user/bin
rootpath=`dirname $SCRIPT`
echo $rootpath

. "$rootpath"/../lock/pid.sh

kill $TASK

#exit
