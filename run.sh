#!/bin/bash

: ${PDNS_DB_USER:root}
: ${PDNS_DB_PASSWORD:=pdns}
: ${PDNS_DB_HOST:=localhost}
: ${PDNS_DB_NAME:=pdns}
: ${PDNS_WEBSERVER:=no}

sed -i /etc/pdns/pdns.conf \
  -e "s/PDNS_DB_USER/${PDNS_DB_USER}/" \
  -e "s/PDNS_DB_PASSWORD/${PDNS_DB_PASSWORD}/" \
  -e "s/PDNS_DB_HOST/${PDNS_DB_HOST}/" \
  -e "s/PDNS_DB_NAME/${PDNS_DB_NAME}/" \
  -e "s/PDNS_WEBSERVER/${PDNS_WEBSERVER}/" \

if [[ $# -lt 1 ]] || [[ "$1" == "--"* ]]; then
  exec /usr/sbin/pdns_server "$@"
fi

exec "$@"

