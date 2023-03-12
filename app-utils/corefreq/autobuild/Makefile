# CoreFreq
# Copyright (C) 2015-2017 CYRIL INGENIERIE
# Licenses: GPL2

obj-m := corefreqk.o
KVERSION = $(shell uname -r)
DESTDIR = $(HOME)

all:
	make -C /lib/modules/$(KVERSION)/build M=${PWD} modules
clean:
	make -C /lib/modules/$(KVERSION)/build M=${PWD} clean
