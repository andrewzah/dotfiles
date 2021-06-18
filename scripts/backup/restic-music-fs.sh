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

source "$HOME/.dotfiles/zsh/secret-exports.zsh"

export RESTIC_PASSWORD="$RESTIC_MUSIC_PASSWORD"

echo "backing up from NFS->/mnt/marth"
restic -r /mnt/marth/restic/music --verbose backup /mnt/nfs/media/music \
  >> "$TMPFILE" 2>&1 \
  || cat "$TMPFILE"

echo "pinging healthchecks service"
curl -L -X POST "$RESTIC_MUSIC_FS_HEALTHCHECK_URL" \
  >> "$TMPFILE" 2>&1 \
  || cat "$TMPFILE"

exit 0
