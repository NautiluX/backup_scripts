#!/bin/bash

TODAY=$(date +%Y-%m-%d)
BACKUPDIR=/nas/backup/daily/
SCRIPTDIR=/nas/data/backup_scripts
DATADIR=/nas/data/
LASTDAYPATH=${BACKUPDIR}/$(ls ${BACKUPDIR} | tail -n 1)
TODAYPATH=${BACKUPDIR}/${TODAY}
if [[ ! -e ${TODAYPATH} ]]; then
	mkdir -p ${TODAYPATH}
fi
rsync -a --delete --link-dest ${LASTDAYPATH} ${DATADIR} ${TODAYPATH} $@
${SCRIPTDIR}/deleteOldBackups.sh
