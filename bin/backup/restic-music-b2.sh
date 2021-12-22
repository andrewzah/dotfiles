#!/bin/bash

# expects a creds file with the following

# export RESTIC_PASSWORD=
# export B2_ACCOUNT_ID=
# export B2_BUCKET_NAME=
# export B2_ACCOUNT_KEY=
# export HEALTHCHECKS_URL=

set -euo pipefail

TMPFILE="/tmp/zah-backup.$(openssl rand -hex 32)"
REPO_DIR="/mnt/marth/restic/music"

source "${REPO_DIR}/creds"

echo "backing up to b2 from /mnt/nfs/media/music" >> "$TMPFILE"
restic -r "b2:${B2_BUCKET_NAME}:/" --verbose backup /mnt/nfs/media/music  \
  >> "$TMPFILE" 2>&1 \
  || cat "$TMPFILE"
echo "[ok] backed up from NFS->b2"

echo "pinging healthchecks service" >> "$TMPFILE"
curl -L -X POST "$HEALTHCHECKS_URL" \
  >> "$TMPFILE" 2>&1 \
  || cat "$TMPFILE"

exit 0
