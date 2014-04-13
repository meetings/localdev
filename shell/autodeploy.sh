#!/bin/bash
# provision: autodeploy.sh, 2014-04-10 / Meetin.gs

set -u

# This is a kludge. Autodeployment script may expect
# this file even when it is not really used.
#
touch /etc/autodeploy.conf

# Vagrant version of autodeployment.
#
for SERVICE in /vagrant/autodeploy/*.env; do
    . $SERVICE

    [ ${DISABLED:-no} == "yes" ] && continue

    echo " *** Autodeploying $INTENT"

    BASEDIR=$(dirname $DIR)

    if [ ! -d $BASEDIR ]; then
        mkdir -vp $BASEDIR
    fi

    cd $BASEDIR

    if [ ! -d $DIR ]; then
        git clone $URL $INTENT 2>&1
        cd $DIR
        ./$DEPLOYDIR/init.sh 2>&1
    fi

    cd $DIR
    export FORCE=yes
    ./$DEPLOYDIR/update.sh 2>&1
done
