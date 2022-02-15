#!/bin/sh
# Options
BACKUP_FOLDER=/srv/backup/database/mariadb
NOW=$(date '+%F')
GZIP=$(which gzip)
MYSQLDUMP=$(which mysqldump)
# MariaDB access credentials
MDB=dbname
MHOST=hostname
MPASS=password
MUSER=username

# Clean old files before generating a new one
find ${BACKUP_FOLDER} -mindepth 1 -mtime +7 -delete

[ ! -d "$BACKUP_FOLDER" ] && mkdir --parents $BACKUP_FOLDER
FILE=${BACKUP_FOLDER}/backup-mariadb_${NOW}.sql.gz
$MYSQLDUMP -h $MHOST -u $MUSER -p${MPASS} --databases $MDB | $GZIP -9 > $FILE
