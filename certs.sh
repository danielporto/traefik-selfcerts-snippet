#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# load variables from env file
. .env

#DOMAIN=$1

openssl req \
  -newkey rsa:2048 \
  -x509 \
  -nodes \
  -keyout "certs/$DOMAIN.key" \
  -new \
  -out "certs/$DOMAIN.crt" \
  -subj "/CN=*.$DOMAIN" \
  -reqexts SAN \
  -extensions SAN \
  -config <(cat /etc/ssl/openssl.cnf \
  <(printf "[SAN]\nsubjectAltName=DNS:*.%s, DNS:%s" "$DOMAIN" "$DOMAIN")) \
  -sha256 \
  -days 3650

cat "certs/$DOMAIN.crt" "certs/$DOMAIN.key" \
    | tee "certs/$DOMAIN.pem"