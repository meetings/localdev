#!/bin/sh
# provision: mogilefs.sh, 2014-04-12 / Meetin.gs

echo " *** Setting up Mogilefs database"
mysql -e "SHOW DATABASES" | grep -q mogilefs || \
    mysql --force < /vagrant/sql/mogilefs.sql

echo " *** Restarting Mogilefs services"
service mogilefsd restart
service mogstored restart
