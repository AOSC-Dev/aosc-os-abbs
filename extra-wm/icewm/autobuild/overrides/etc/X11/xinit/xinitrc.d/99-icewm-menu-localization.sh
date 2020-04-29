#!/bin/bash
if [ -f /etc/locale.conf ]; then
    source /etc/locale.conf
fi

if [ ! -d "$HOME"/.icewm ]; then
    mkdir -v "$HOME"/.icewm
fi

for i in menu sysutils toolbar; do
    if [ -e "/usr/share/icewm/$i.${LANG%.*}" ]; then
        echo "Installing IceWM $i configuration for ${LANG%.*} ..."
        if [ -e "$HOME"/.icewm/$i ]; then
            echo "    >> Found user configuration, skipping installation."
        fi
        cp -nv /usr/share/icewm/$i."${LANG%.*}" "$HOME"/.icewm/$i
    else
        echo "Localization data not found, using default $i configuration..."
        if [ -e "$HOME"/.icewm/$i ]; then
            echo "    >> Found user configuration, skipping installation."
        fi
        cp -nv /usr/share/icewm/$i.def "$HOME"/.icewm/$i
    fi
done
