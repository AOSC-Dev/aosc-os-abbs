#!/bin/sh
export ACME_PACKAGED=1
exec /usr/lib/acme.sh/acme.sh "$@"
