#!/bin/sh
# provision: coreinit.sh, 2014-04-13 / Meetin.gs

set -u

export OPENINTERACT2="/usr/local/dcp"

PKGS="oi2_compatibility attachment awareness base comments default_theme development dojo domains domain_user_manager emails events event_source groups localization login meetings networking presentations random reset_theme security sessions settings tag thumbnails tinymce3 tinymce_meetings user_manager wiki navigation"

# Quit if crmjournal exists already.
#
mysql -e "SHOW DATABASES" | grep -q crmjournal && exit 0

echo " *** Creating crmjournal database"
mysql --force < /vagrant/sql/crmjournal.sql

# Let packages create their tables.
#
echo " *** Installing schema for packages"
for P in $PKGS; do
    oi2_manage install_sql --package=dicole_${P}
done

echo " *** Reinstalling packages"
/usr/local/bin/d i $PKGS

# Set come critical initial values right.
#
echo " *** Initializing database with values"
mysql --force crmjournal < /vagrant/sql/values.sql

echo " *** Restarting web server"
service lighttpd restart

echo " *** Enabling root development"
/opt/meetings/dcp/bin/root_development_config


