#!/bin/bash

set -euxo pipefail

MAX_BACKUPS=50
BACKUP_DIR="/mnt/marth/backups/neptunemc"

rsync \
  --recursive \
  --archive \
  --verbose \
  --human-readable \
  /mnt/nfs/subvol-107-disk-0/home/guest/backups/ \
  "$BACKUP_DIR"

# get nicely formatted timestamps
timestamp () {
	date -u +"%Y-%m-%dT%H:%M:%SZ"
}

# count backups
nbackups="$(ls -1 "$BACKUP_DIR" | grep "tar.gz" | wc -l)"
printf 'timestamp=%s nbackups=%i\n' "$(timestamp)" $nbackups

# prune only if necessary
if [ $nbackups -gt $MAX_BACKUPS ] ; then
  printf 'timestamp=%s msg="begin backup rotation"\n' "$(timestamp)"
  while true ; do
    # loop to check if there are still too many, select the oldest if so, and then delete
    nbackups="$(ls -1 "$BACKUP_DIR" | grep "tar.gz" | wc -l)"
    if [ $nbackups -le $MAX_BACKUPS ] ; then
      printf 'timestamp=%s msg="rotation finished"\n' "$(timestamp)"
    fi

    oldest="$(ls -1 "$BACKUP_DIR" | grep "tar.gz" | sort | head -n1)"
    printf 'timestamp=%s prune="%s"\n' "$(timestamp)" "$oldest"
    rm -f "$oldest"
  done
fi

curl -L -X POST 'https://healthchecks.zah.rocks/ping/a35f5c27-40e0-42be-b3c1-4ddf1b9c5d79'
exit 0
