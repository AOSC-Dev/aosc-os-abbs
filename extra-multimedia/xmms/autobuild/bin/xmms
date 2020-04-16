#!/bin/sh

# https://bugzilla.redhat.com/213172
if [ -z "$XLIB_SKIP_ARGB_VISUALS" ] ; then
    exec env XLIB_SKIP_ARGB_VISUALS=1 /usr/libexec/xmms "$@"
else
    exec /usr/libexec/xmms "$@"
fi
