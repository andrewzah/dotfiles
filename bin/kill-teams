#!/bin/bash

# This script cleans all cache for Microsoft Teams on Linux
# Tested on Ubuntu and Debian by @necrifede. Feel free to test/use in other distributions.
# Tested with Teams via snap.

# Variables
TEAMS_PROCESS_NAME=teams

case $1 in
  deb)
    cd "$HOME"/.config/Microsoft/Microsoft\ Teams || exit 1
  ;;
  snap)
    cd "$HOME"/snap/teams/current/.config/Microsoft/Microsoft\ Teams || exit 1
  ;;
  *)
    echo "Use $0 (deb | snap) as parameter."
    exit 1
  ;;
esac

# Test if Microsoft Teams is running
if [ "$(pgrep ${TEAMS_PROCESS_NAME} | wc -l)" -gt 1 ]
then
  rm -rf Application\ Cache/Cache/*
  rm -rf blob_storage/*
  rm -rf Cache/* # Main cache
  rm -rf Code\ Cache/js/*
  rm -rf databases/*
  rm -rf GPUCache/*
  rm -rf IndexedDB/*
  rm -rf Local\ Storage/*
  #rm -rf backgrounds/* # Background function presents on Teams for Windows only.
  find ./ -maxdepth 1 -type f -name "*log*" -exec rm {} \;
  sleep 5
  killall ${TEAMS_PROCESS_NAME}
  # After this, MS Teams will open again.
else
  echo "Microsoft Teams is not running."
  exit
fi
