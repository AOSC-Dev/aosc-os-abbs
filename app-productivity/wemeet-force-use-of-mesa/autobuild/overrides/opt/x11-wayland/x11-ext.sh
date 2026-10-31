#!/usr/bin/env bash

# FIXME: Wemeet only reads this file from this path; placing it in any other path will not work.
#        Unless you modify the official startup script. 
#
# Link: https://www.cnblogs.com/keenli/p/21383446

# Compatibility of the official startup script
# FIXME: If these envs are not configured, Wemeet will crash.
export QT_QPA_PLATFORM=xcb
export XDG_SESSION_TYPE=x11
unset WAYLAND_DISPLAY
export WEMEET_XWAYLAND=1

# Check if Mesa is indeed installed.
readonly WEMEET_MESA_EGL_VENDOR=/usr/share/glvnd/egl_vendor.d/50_mesa.json
if [[ -r "$WEMEET_MESA_EGL_VENDOR" ]]; then
  export __EGL_VENDOR_LIBRARY_FILENAMES="$WEMEET_MESA_EGL_VENDOR"
fi

export __GLX_VENDOR_LIBRARY_NAME=mesa

unset LIBGL_ALWAYS_SOFTWARE
