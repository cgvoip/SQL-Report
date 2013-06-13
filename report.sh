#!/bin/bash
# source oracle OS variables; see recipe 7-7 for an example of oraset script,
# otherwise hardcode the values of ORACLE_HOME, ORACLE_SID, and PATH
. /var/opt/oracle/oraset RMDB1
#
for DB in proddb prod2db; do
sqlplus -s << EOF
system/foo@${DB}
@?/rdbms/admin/awrcustom.sql
exit
EOF
#
mail -s "AWR Rpt: ${DB}" larry@orc.com </orahome/scripts/awrrpt.${DB}.txt
#
done # for DB in...
exit 0
