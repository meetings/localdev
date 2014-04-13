#!/bin/sh
# provision: stdintty.sh, 2014-03-05 / Meetin.gs
sed -i 's/^mesg n/tty -s \&\& mesg n/' /root/.profile
