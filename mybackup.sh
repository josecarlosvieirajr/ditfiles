rsync -rav --exclude-from=.ignorefiles_backup . {LOCAL_BACKUPS} --stats

pg_dumpall -U postgres -h localhost  > {LOCAL_BACKUPS}/backups.sql
