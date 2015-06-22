
KDIR = /lib/modules/$(shell uname -r)/build
Conf1=${KDIR}/include/config/auto.conf
Conf2=${KDIR}/.config
ifeq "t" "$(shell test -e ${Conf1} && echo t)"
include ${Conf1}
else ifeq "t" "$(shell test -e ${Conf2} && echo t)"
include ${Conf2}
else
$(warning could not find kernel config file. internal auto-config may fail)
endif

CONFIG_AUFS_FS = m
AUFS_DEF_CONFIG = -DCONFIG_AUFS_FS_MODULE -UCONFIG_AUFS
include config.mk
export CONFIG_AUFS_FS

EXTRA_CFLAGS := -I${CURDIR}/include
EXTRA_CFLAGS += ${AUFS_DEF_CONFIG}

MakeMod = -C ${KDIR} M=${CURDIR}/fs/aufs EXTRA_CFLAGS="${EXTRA_CFLAGS}"

all: aufs.ko usr/include/linux/aufs_type.h

clean:
	${MAKE} ${MakeMod} $@
	find . -type f -name '*~' | xargs -r ${RM}
	${RM} -r aufs.ko usr

install: fs/aufs/aufs.ko
	${MAKE} ${MakeMod} modules_install

install_header install_headers: usr/include/linux/aufs_type.h
	install -o root -g root -p usr/include/linux/aufs_type.h \
		${DESTDIR}/usr/include/linux

aufs.ko: fs/aufs/aufs.ko
	ln -f $< $@

fs/aufs/aufs.ko:
	@echo ${EXTRA_CFLAGS}
	${MAKE} ${MakeMod} modules

usr/include/linux/aufs_type.h: d = $(shell echo ${CURDIR} | cut -c2-)
usr/include/linux/aufs_type.h:
	${MAKE} -rR -C ${KDIR} \
		-f scripts/Makefile.headersinst \
		-f Makefile \
		obj=${d}/include/uapi/linux dst=${d}/usr/include/linux
	test -s $@
