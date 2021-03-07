#!/usr/bin/env bash

set -exo pipefail

FQDN="${1:-test.local}"

openssl req \
  -x509 \
  -nodes \
  -sha256 \
  -days 365 \
  -newkey \
  rsa:2048 \
  -keyout "${FQDN}.key" \
  -out "${FQDN}.crt"
