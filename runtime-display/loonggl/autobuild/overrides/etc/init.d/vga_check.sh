#!/bin/bash

# This should be considered in public domain (despite someone earning a much
# much higher salary than me has written a much worse version!)

shopt -s nullglob
has_loonggpu=0
udevadm settle

for i in /sys/class/drm/card[0-9]/device/driver; do
	driver="$(basename $(readlink $i))"

	if [ "$driver" = "gsgpu-dc" ]; then
		has_loonggpu=1
	else
		# If any drm device(s) with a different driver are loaded, don't
		# enable LoongGPU.
		#
		# If you've connected two monitors, one on LoongGPU and another on a
		# different graphics card and then found LoongGPU isn't working,
		# do NOT report this as a bug to the AOSC maintainers: the
		# libEGL_loonggpu.so driver provided by the vendor is known to crash
		# on anything not driven by the LoongGPU kernel driver, so if we
		# don't do this the X server even won't even start on your system.
		# Even the Loongson UEFI firmware can hide LoongGPU if an AMD
		# graphics card is connected and the firmware can recognize it, in
		# order to work around this issue.
		#
		# The correct approach is checking the hardware model in
		# eglGetDisplay (the very first EGL function invoked by EGL
		# applications; libglvnd only falls back to different EGL
		# implementations if this function returns no display), but the
		# vendor guys seem not knowing this.
		#
		# Instead the vendor uses an ugly hack: the original version of this
		# script runs on system boot and check if no "different graphics
		# cards" are used; if so, the libEGL_loonggpu.so will be prioritized
		# by copying /usr/share/glvnd/egl.vendor.d/60_loonggpu.json to
		# 40_loonggpu.json, otherwise 40_loonggpu.json will be removed to
		# demote libEGL_loonggpu.so.
		#
		# This method is obviously full of racing conditions, making the
		# system initialization unreliable (yes the systemd unit has
		# Before=display-manager.service but there are countless ways to
		# invoke libEGL without starting the display manager; feel free
		# to submit a PR adding more units into Before= if you need), and
		# making oma have to run this script when this package is installed,
		# and have to delete 40-loonggpu.json when this package is removed.
		# And it also obviously prevents using LG110 and another graphics
		# card at the same time.
		#
		# And the original version of this script is really buggy: it
		# matches any graphics card with vendor ID 0x14, including LG200
		# that loonggpu-kernel-dkms does not support yet, causing the
		# X server crash on startup on 2K3000.  It also does not check the
		# kernel driver in use at all, causing the X server crash on setups
		# where loonggpu-kernel-dkms isn't loaded (like a 4-KiB-page
		# kernel).
		#
		# We already suggested the vendor to open the source of LoongGPU
		# driver so we can fix libEGL_loonggpu.so for them, but the only
		# response was a very aggressive comment on Bilibili seemingly from
		# some guy affilinated with the vendor, claiming "you open source
		# community knows nothing about graphics and the vendor can do
		# things much better than you."  But now we can see the vendor guys
		# even don't know how to use libglvnd properly.  So the best thing
		# we can do is just rewriting this script to the current form.
		has_loonggpu=0
		break
	fi
done

TARGET=/usr/share/glvnd/egl_vendor.d/40_loonggpu.json
if [[ "$has_loonggpu" = 1 ]]; then
	ln -sf 60_loonggpu.json "$TARGET"
else
	rm -f "$TARGET"
fi

# vim: ts=4
