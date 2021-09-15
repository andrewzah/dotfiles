#!/bin/bash

set -exo pipefail

REPO_NAME=${1?-Please specify the repo name. It must be the same for all repos.}

if git remote -v | grep -q origin; then
  git remote remove origin
fi

if git remote -v | grep -q git@github; then
  git remote remove gh
fi
git remote add gh "git@github.com:andrewzah/$REPO_NAME.git"

if git remote -v | grep -q git@git.andrewzah.com; then
  git remote remove zah
fi
git remote add zah "git@git.andrewzah.com:andrewzah/$REPO_NAME.git"
