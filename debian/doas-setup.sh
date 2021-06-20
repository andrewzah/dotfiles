#!/usr/bin/env bash

set -exo pipefail

#### doas
apt install \
  build-essential \
  make \
  bison \
  flex \
  libpam0g-dev

[ -d /tmp/doas ] && rm -r /tmp/doas
git clone "https://github.com/slicer69/doas.git" /tmp/doas
cd /tmp/doas
make
make install

rm /usr/local/etc/doas.conf
echo "permit andrew as root" | tee -a /usr/local/etc/doas.conf
