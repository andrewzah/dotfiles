#!/usr/bin/env bash

set -euxo pipefail

docker run \
  -ti \
  --rm \
  --device=/dev/cdrom \
  --mount "type=bind,source=${HOME}/.config/whipper,target=/home/worker/.config/whipper" \
  --mount "type=bind,source=${HOME}/rips/output,target=/output" \
  whipperteam/whipper "$@"
